-- by MrKarfen
function DTWorkshops(num)

	if num==11 then
		local WTown = GetEntityByName("TheTown_Workshop")
		local WRepTown = WTown:GetRepositoryByTypename("Vehicles")
		WRepTown:AddItems("BulldogForSale", 1)
		
		local WRepCabTown = WTown:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabTown:AddItems("bulldogCab01", 2)
		WRepCabTown:AddItems("bulldogCab02", 2)
		WRepCabTown:AddItems("bulldogCargo01", 2)
		WRepCabTown:AddItems("bulldogCargo02", 2)
		
	elseif num==12 then	
		local WEsting = GetEntityByName("Esting_Workshop")
		local WRepEsting = WEsting:GetRepositoryByTypename("Vehicles")
		WRepEsting:AddItems("BulldogForSale", 1)

		local WRepCabEsting = WEsting:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabEsting:AddItems("bulldogCab01", 2)
		WRepCabEsting:AddItems("bulldogCab02", 2)
		WRepCabEsting:AddItems("bulldogCargo01", 2)
		WRepCabEsting:AddItems("bulldogCargo02", 2)
		
		local WMidragd = GetEntityByName("Midragd_Workshop")
		local WRepMidragd = WMidragd:GetRepositoryByTypename("Vehicles")
		WRepMidragd:AddItems("BulldogForSale", 1)

		local WRepCabMidragd = WMidragd:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabMidragd:AddItems("bulldogCab01", 2)
		WRepCabMidragd:AddItems("bulldogCab02", 2)
		WRepCabMidragd:AddItems("bulldogCargo01", 2)
		WRepCabMidragd:AddItems("bulldogCargo02", 2)
		
		local WPorto = GetEntityByName("Porto_Workshop")
		local WRepPorto = WPorto:GetRepositoryByTypename("Vehicles")
		WRepPorto:AddItems("BulldogForSale", 1)

		local WRepCabPorto = WPorto:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabPorto:AddItems("bulldogCab01", 2)
		WRepCabPorto:AddItems("bulldogCab02", 2)
		WRepCabPorto:AddItems("bulldogCargo01", 2)
		WRepCabPorto:AddItems("bulldogCargo02", 2)
		
	elseif num==13 then		
		local WAsgard = GetEntityByName("Asgard_Workshop")
		local WRepAsgard = WAsgard:GetRepositoryByTypename("Vehicles")
		WRepAsgard:AddItems("BulldogForSale", 1)

		local WRepCabAsgard = WAsgard:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabAsgard:AddItems("bulldogCab01", 2)
		WRepCabAsgard:AddItems("bulldogCab02", 2)
		WRepCabAsgard:AddItems("bulldogCargo01", 2)
		WRepCabAsgard:AddItems("bulldogCargo02", 2)
		
		local WPesht = GetEntityByName("Pesht_Workshop")
		local WRepPesht = WPesht:GetRepositoryByTypename("Vehicles")
		WRepPesht:AddItems("BulldogForSale", 1)

		local WRepCabPesht = WPesht:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabPesht:AddItems("bulldogCab01", 2)
		WRepCabPesht:AddItems("bulldogCab02", 2)
		WRepCabPesht:AddItems("bulldogCargo01", 2)
		WRepCabPesht:AddItems("bulldogCargo02", 2)
		
		local WMinin = GetEntityByName("Minin_Workshop")
		local WRepMinin = WMinin:GetRepositoryByTypename("Vehicles")
		WRepMinin:AddItems("BulldogForSale", 1)

		local WRepCabMinin = WMinin:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabMinin:AddItems("bulldogCab01", 2)
		WRepCabMinin:AddItems("bulldogCab02", 2)
		WRepCabMinin:AddItems("bulldogCargo01", 2)
		WRepCabMinin:AddItems("bulldogCargo02", 2)
		
	elseif num==14 then	
		local WTheOlme = GetEntityByName("TheOlme_Workshop")
		local WRepTheOlme = WTheOlme:GetRepositoryByTypename("Vehicles")
		WRepTheOlme:AddItems("BulldogForSale", 1)

		local WRepCabTheOlme = WTheOlme:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabTheOlme:AddItems("bulldogCab01", 2)
		WRepCabTheOlme:AddItems("bulldogCab02", 2)
		WRepCabTheOlme:AddItems("bulldogCargo01", 2)
		WRepCabTheOlme:AddItems("bulldogCargo02", 2)
		
	elseif num==21 then	
		local WTheGelvetcia = GetEntityByName("TheGelvetcia_Workshop")
		local WRepTheGelvetcia = WTheGelvetcia:GetRepositoryByTypename("Vehicles")
		WRepTheGelvetcia:AddItems("BulldogForSale", 1)

		local WRepCabTheGelvetcia = WTheGelvetcia:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabTheGelvetcia:AddItems("bulldogCab01", 2)
		WRepCabTheGelvetcia:AddItems("bulldogCab02", 2)
		WRepCabTheGelvetcia:AddItems("bulldogCargo01", 2)
		WRepCabTheGelvetcia:AddItems("bulldogCargo02", 2)
		
		local WTheSel = GetEntityByName("TheSel_Workshop")
		local WRepTheSel = WTheSel:GetRepositoryByTypename("Vehicles")
		WRepTheSel:AddItems("BulldogForSale", 1)

		local WRepCabTheSel = WTheSel:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabTheSel:AddItems("bulldogCab01", 2)
		WRepCabTheSel:AddItems("bulldogCab02", 2)
		WRepCabTheSel:AddItems("bulldogCargo01", 2)
		WRepCabTheSel:AddItems("bulldogCargo02", 2)

		local WTheTuzz = GetEntityByName("TheTuzz_Workshop")
		local WRepTheTuzz = WTheTuzz:GetRepositoryByTypename("Vehicles")
		WRepTheTuzz:AddItems("BulldogForSale", 1)

		local WRepCabTheTuzz = WTheTuzz:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabTheTuzz:AddItems("bulldogCab01", 2)
		WRepCabTheTuzz:AddItems("bulldogCab02", 2)
		WRepCabTheTuzz:AddItems("bulldogCargo01", 2)
		WRepCabTheTuzz:AddItems("bulldogCargo02", 2)
		
	elseif num==22 then	
		local WMarezzia = GetEntityByName("Marezzia_Workshop")
		local WRepMarezzia = WMarezzia:GetRepositoryByTypename("Vehicles")
		WRepMarezzia:AddItems("BulldogForSale", 1)

		local WRepCabMarezzia = WMarezzia:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabMarezzia:AddItems("bulldogCab01", 2)
		WRepCabMarezzia:AddItems("bulldogCab02", 2)
		WRepCabMarezzia:AddItems("bulldogCargo01", 2)
		WRepCabMarezzia:AddItems("bulldogCargo02", 2)

	elseif num==31 then	
		local WTheSet = GetEntityByName("Set_Workshop")
		local WRepTheSet = WTheSet:GetRepositoryByTypename("Vehicles")
		WRepTheSet:AddItems("CruiserEnemySpawn", 1)

		local WRepCabSet = WTheSet:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabSet:AddItems("CruiserCab01", 2)
		WRepCabSet:AddItems("CruiserCab02", 2)
		WRepCabSet:AddItems("CruiserCargo01", 2)
		WRepCabSet:AddItems("CruiserCargo02", 2)

		local WTheFist = GetEntityByName("Fist_Workshop")
		local WRepTheFist = WTheFist:GetRepositoryByTypename("Vehicles")
		WRepTheFist:AddItems("CruiserEnemySpawn", 1)

		local WRepCabFist = WTheFist:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabFist:AddItems("CruiserCab01", 2)
		WRepCabFist:AddItems("CruiserCab02", 2)
		WRepCabFist:AddItems("CruiserCargo01", 2)
		WRepCabFist:AddItems("CruiserCargo02", 2)

		local WUluk = GetEntityByName("Uluk_Workshop")
		local WRepUluk = WUluk:GetRepositoryByTypename("Vehicles")
		WRepUluk:AddItems("CruiserEnemySpawn", 1)

		local WRepCabUluk = WUluk:GetRepositoryByTypename("CabinsAndBaskets")
		WRepCabUluk:AddItems("CruiserCab01", 2)
		WRepCabUluk:AddItems("CruiserCab02", 2)
		WRepCabUluk:AddItems("CruiserCargo01", 2)
		WRepCabUluk:AddItems("CruiserCargo02", 2)		
	end
end