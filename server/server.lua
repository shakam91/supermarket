ESX = nil
TriggerEvent("esx:getSharedObject", function(obj)
	ESX = obj
end)



RegisterServerEvent("sShop:Payement")
	AddEventHandler('sShop:Payement', function(label, name, Price) 
		local _src = source
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= Price then
			xPlayer.removeMoney(Price)
			xPlayer.addInventoryItem(name, 1)
			Citizen.Wait(500) 
			TriggerClientEvent('esx:showAdvancedNotification', _src, 'Supérette', '~o~2~r~4~g~7', "Vous venez d\'acheter ~b~1x "..label.." ~s~pour ~r~"..price.."$ ~s~!", 'CHAR_ACTING_UP', 1)
		else 
			Citizen.Wait(500) 
			TriggerClientEvent('esx:showAdvancedNotification', _src, 'Supérette', '~o~2~r~4~g~7', 'Vous n\'avez pas suffisament d\'argent !', 'CHAR_ACTING_UP', 1)
		end
	end)  
	












