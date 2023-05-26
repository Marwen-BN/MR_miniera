
local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('miniera:itemreward')
AddEventHandler('miniera:itemreward', function()
	local src = source
	local Player = RSGCore.Functions.GetPlayer(source)

	math.randomseed(os.time())     
	local rng = math.random(1, 20)

	if rng == 1 then
		RSGCore.Functions.Notify(source, "Didn't find anything", 'primary', 3000)
					
	elseif rng > 1 and rng < 10 then
        local hasitem = Player.Functions.GetItemByName("copper")
        if hasitem and hasitem.amount >= 30 then 
            count = hasitem.amount
			
			RSGCore.Functions.Notify(source, "You don't have enough space", 'primary', 3000)
		else
			RSGCore.Functions.Notify(source, "I found some copper stones", 'primary', 3000)
			 Player.Functions.AddItem('copper', math.random(1,3) )
			 TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['copper'], "add")
		end
						
	elseif rng >= 10 and rng < 15 then
        local hasitem = Player.Functions.GetItemByName("iron")
        if hasitem and hasitem.amount >= 30 then 
            count = hasitem.amount

			RSGCore.Functions.Notify(source, "You don't have enough space", 'primary', 3000)
		else
			RSGCore.Functions.Notify(source, "I found some iron", 'primary', 3000)
			 Player.Functions.AddItem('iron', math.random(1,3))
			 TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['iron'], "add")
		end
					
	elseif rng >= 15 and rng <= 20 then

        local hasitem = Player.Functions.GetItemByName("aluminum")
        if hasitem and hasitem.amount >= 30 then 
            count = hasitem.amount
		  
			RSGCore.Functions.Notify(source, "You don't have enough space", 'primary', 3000)
		else
			RSGCore.Functions.Notify(source, "I found some aluminum ", 'primary', 3000)
			 Player.Functions.AddItem('aluminum', math.random(1,3) )
			 TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['aluminum'], "add")
		end
	end
end)


RegisterServerEvent("minatore:checkjob")
AddEventHandler("minatore:checkjob", function()
    local src = source

	 local Player = RSGCore.Functions.GetPlayer(source)

			TriggerClientEvent("minatore:updatejob", src)
            RSGCore.Functions.Notify(src,  "You are a good worker, keep working" , 'primary', 3000)
end)
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
RegisterServerEvent("MR_processa:copper")
AddEventHandler("MR_processa:copper", function()
	local src = source
    local Player = RSGCore.Functions.GetPlayer(source)
    local hasitem = Player.Functions.GetItemByName("copper")
        if hasitem and hasitem.amount >= 5 then 
            count = hasitem.amount
			
			 Player.Functions.RemoveItem('copper', 4)
             TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['copper'], 'remove')
			 Player.Functions.AddItem('trigger',1)
             TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['trigger'], "add")
             Player.Functions.AddMoney('cash', 4)
			RSGCore.Functions.Notify(source, "I have processed copper", 'primary', 3000)
		else
			RSGCore.Functions.Notify(source, "You don't have enough materials", 'primary', 3000)
		end
end)


RegisterServerEvent("MR_processa:iron")
AddEventHandler("MR_processa:iron", function()
	local src = source
    local Player = RSGCore.Functions.GetPlayer(source)
    local hasitem = Player.Functions.GetItemByName("iron")
        if hasitem and hasitem.amount >= 5 then 
            count = hasitem.amount
			
			 Player.Functions.RemoveItem('iron', 4)
             TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['iron'], 'remove')
			 Player.Functions.AddItem('cylinder',1)
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['cylinder'], "add")
			RSGCore.Functions.Notify(source, "I processed some iron", 'primary', 3000)
			Player.Functions.AddMoney('cash', 4)
		else
			RSGCore.Functions.Notify(source, "You don't have enough materials", 'primary', 3000)
		end
end)

RegisterServerEvent("MR_processa:aluminum")
AddEventHandler("MR_processa:aluminum", function()
	local src = source
    local Player = RSGCore.Functions.GetPlayer(source)
    local hasitem = Player.Functions.GetItemByName("aluminum")
        if hasitem and hasitem.amount >= 5 then 
            count = hasitem.amount
			 Player.Functions.RemoveItem('aluminum', 4)
             TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['aluminum'], 'remove')
			 Player.Functions.AddItem('hammer',1)
             TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['hammer'], "add")
			 Player.Functions.AddMoney('cash', 4)
			RSGCore.Functions.Notify(source, "I've processed some aluminum", 'primary', 3000)
		else
			RSGCore.Functions.Notify(source, "You don't have enough materials", 'primary', 3000)
		end

end)
