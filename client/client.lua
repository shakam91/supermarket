ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(500)
    end
end)



local mainMenu = RageUI.CreateMenu("", "24/7 SuperMarket", X, Y, "menu", "menu")
local nourriture = RageUI.CreateSubMenu(mainMenu, "", "Nourriture")
local boisson = RageUI.CreateSubMenu(mainMenu, "", "Boisson")
local divers = RageUI.CreateSubMenu(mainMenu, "", "Divers")


mainMenu:DisplayGlare(false)
nourriture:DisplayGlare(false)
boisson:DisplayGlare(false)
divers:DisplayGlare(false)


function OpenShop()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
        endance = true
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu,function() 
            RageUI.Separator("~p~↓~s~  ~g~24~s~/~p~7~s~ SuperMarket  ~p~↓~s~")

            RageUI.Button('~p~→~s~ Nourriture', nil, {RightLabel = "~p~>>"}, true, {

            }, nourriture)
            RageUI.Button('~p~→~s~ Boisson', nil, {RightLabel = "~p~>>"}, true, {

            }, boisson)
            RageUI.Button('~p~→~s~ Divers', nil, {RightLabel = "~p~>>"}, true, {

            }, divers)

           end)

           RageUI.IsVisible(nourriture,function() 

            for k,v in pairs(cfg_shop.nourriture) do
                RageUI.Button(v.label, nil, {RightLabel = ("~g~%s$~s~ ~p~>>"):format(v.price)}, true, {
                    onSelected = function()
                        local item = v.name
                        TriggerServerEvent('sShop:Payement', v.label, v.name, v.price)
                    end
                })
            end

           end)

           RageUI.IsVisible(boisson,function() 

            for k,v in pairs(cfg_shop.boisson) do
                RageUI.Button(v.label, nil, {RightLabel = ("~g~%s$~s~ ~p~>>"):format(v.price)}, true, {
                    onSelected = function()
                        local item = v.name
                        TriggerServerEvent('sShop:Payement', v.label, v.name, v.price)
                    end
                })
            end

           end)

           RageUI.IsVisible(divers,function() 

            for k,v in pairs(cfg_shop.divers) do
                RageUI.Button(v.label, nil, {RightLabel = ("~g~%s$~s~ ~p~>>"):format(v.price)}, true, {
                    onSelected = function()
                        local item = v.name
                        TriggerServerEvent('sShop:Payement', v.label, v.name, v.price)
                    end
                })
            end


           end)

           Wait(3)
       end
   end)
end
end


CreateThread(function()
    while true do
        local internal = 250 
        
        for k, v in pairs(cfg_shop.positionShop.InteractZone) do
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local pos = cfg_shop.positionShop.InteractZone
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)

            if dist <= 10 then
                interval = 0
                DrawMarker(23, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.8, 0.8, 0.3, 132, 102, 226, 255, false, false, p19, true)  
            end

            if dist <= 2 then
                interval = 0
                ESX.ShowHelpNotification("Appuyer sur [~g~E~s~] pour accéder au SuperMarket")
                if IsControlJustPressed(1, 51) then
                    OpenShop()
                end
            end
        end
    Wait(1)
    end
end)


Citizen.CreateThread(function()
    for k, v in pairs(cfg_shop.positionShop.InteractZone) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z)

        SetBlipSprite(blip, 52)
        SetBlipScale (blip, 0.6)
        SetBlipColour(blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('SuperMarket')
        EndTextCommandSetBlipName(blip)
    end
end)




