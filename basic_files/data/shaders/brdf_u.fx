#include "template.fx"

#ifndef GAMMA_CORR
#define GAMMA_CORR 1.25
#endif

#ifndef SATURATE_CORR
#define SATURATE_CORR 1.3
#endif


DeclareTexture2D   (DIFFUSE_MAP_0, DiffuseTexture, DiffuseSampler, Wrap)
DeclareTexture2D   (LIGHT_MAP_0,   LightTexture,   LightSampler,   Wrap)
DeclareTexture2D   (BUMP_MAP_0,    BumpTexture,    BumpSampler,    Wrap)
DeclareTextureCube (CUBE_MAP_0,    CubeTexture,    CubeSampler,    Clamp)

float4 ViewerPosition: VIEW_POS <int Space = SPACE_OBJECT;>;
float3 LightDirection: TMP_LIGHT0_DIR <int Space = SPACE_OBJECT;>;

row_major float4x4 FinalMatrix: TOTAL_MATRIX;
row_major float4x4 WorldMatrix: WORLD_MATRIX;

const float3 one = float3(1.0, 1.0, 1.0);

struct VS_INPUT {
    float3 Position: POSITION;
    float3 Normal:   NORMAL;
    float4 Tangent:  TANGENT;
    float2 UVMap0:   TEXCOORD0;
};

struct VS_OUTPUT {
    float4 Position:      POSITION;
    float2 UVMap0:        TEXCOORD0;
    float4 Tangent:       TEXCOORD1;
    float3 Normal:        TEXCOORD2;
    float3 Binormal:      TEXCOORD3;
    float3 ViewDirection: TEXCOORD4;
    float  Fog:           FOG;
};

VS_OUTPUT BRDF_VS(VS_INPUT input) {
    VS_OUTPUT output = (VS_OUTPUT) 0;

    output.Position      = mul(float4(input.Position, 1.0), FinalMatrix);
    output.UVMap0        = input.UVMap0;
    output.Normal        = input.Normal;
    output.Tangent       = input.Tangent;
    output.Binormal      = cross(input.Normal, input.Tangent) * input.Tangent.w;
    output.ViewDirection = normalize(input.Position - ViewerPosition);
    output.Fog           = fog(output.Position, g_FogTerm);

    return output;
};

float DistributionGGX(float3 N, float3 H, float roughness) {
    float a = roughness * roughness;
    float a2 = a * a;
    float NdotH = max(dot(N, H), 0.0);
    float NdotH2 = NdotH * NdotH;
    float denom = (NdotH2 * (a2 - 1.0) + 1.0);
    denom = PI * denom * denom;

    return a2 / denom;
};

float GeometrySchlickGGX(float NdotV, float roughness) {
    float r = roughness + 2;
    float k = (r * r) / 8.0;
    float denom = NdotV * (1.0 - k) + k;
    return NdotV / denom;
};

float GeometrySmith(float NdotV, float NdotL, float roughness) {
    float ggx2  = GeometrySchlickGGX(NdotV, roughness);
    float ggx1  = GeometrySchlickGGX(NdotL, roughness);
    return ggx1 * ggx2;
};

float3 FresnelSchlick(float cosTheta, float3 F0) {
    return F0 + (1.0 - F0) * pow(1.0 - cosTheta, 5.0);
}
float3 fresnelSchlickRoughness(float cosTheta, float3 F0, float roughness)
{
    return F0 + (max(one - roughness, F0) - F0) * pow(clamp(1.0 - cosTheta, 0.0, 1.0), 5.0);
};


float4 BRDF_PS(VS_OUTPUT input) : COLOR {
    float3 albedo = tex2D(DiffuseSampler, input.UVMap0);
    float3 Bump   = tex2D(BumpSampler,    input.UVMap0);
    float4 rmao   = tex2D(LightSampler,   input.UVMap0);


    float roughness = rmao.r;
    float metallic = rmao.g;
    float occlusion = rmao.b;
    float opacity = rmao.a;

    float3 N = bump(Bump.rgb, input.Normal, input.Tangent, input.Binormal);
    float3 V = -input.ViewDirection;
    float3 L = -LightDirection;
    float3 H = normalize(V + L);
    float3 R = reflect(-V, N);

    float3 prefilteredColor = texCUBE(CubeSampler, R);

    float3 F0 = float3(0.04, 0.04, 0.04);
    F0 = lerp(F0, albedo, metallic);

    // Light
    float3 radiance = g_Diffuse.rgb;

    float NdotV = max(dot(N, V), 0.0);
    float NdotL = max(dot(N, L), 0.0);

    float NDF = DistributionGGX(N, H, roughness);
    float G = GeometrySmith(NdotV, NdotL, roughness);
    float3 F  = fresnelSchlickRoughness(max(dot(H, V), 0.0), F0, roughness);

    float3 kS = F;
    float3 kD = one - kS;
    kD *= 1.0 - metallic;

    float3 numerator = NDF * G * F;
    float  denominator = 8.0 * NdotV * NdotL + 0.0001;
    float3 specular = numerator / denominator * prefilteredColor + prefilteredColor * F; // numerator / denominator + ;

    float3 Lo = (kD * albedo / PI + specular) * radiance * NdotL;

    float3 ambient = g_Ambient * albedo * occlusion;

    float3 color = ambient + Lo;
    // Gamma correction need to be linear space over sRGB
    color = saturate(color * SATURATE_CORR);
    color = pow(color, one / GAMMA_CORR);

    return float4(color, g_Transparent * opacity);
};
technique BRDF <bool   ComputeTangentSpace = true;
                string VertexFormat = "VERTEX_XYZNT1T";
                bool   Default = true;
                bool   IsPs20 = true;
                bool   UseAlpha = false;> {
    pass Default {
        VertexShader = compile vs_3_0 BRDF_VS();
        PixelShader  = compile ps_3_0 BRDF_PS();
    }
}