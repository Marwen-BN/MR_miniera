local RSGCore = exports['rsg-core']:GetCoreObject()
local mining = false


Citizen.CreateThread(function()
    local blip = N_0x554d9d53f696d002(1664425300, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z)
    SetBlipSprite(blip, 1220803671, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Miniera") 
end)

RegisterNetEvent("minatore:updatejob")
AddEventHandler("minatore:updatejob", function()
    mining = true 
    animazione()
	Wait(20000)
	TriggerServerEvent("miniera:itemreward")
    mining = false
end)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
            Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, Config.Zonas['Miniera1'].x, Config.Zonas['Miniera1'].y, Config.Zonas['Miniera1'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 215, 0, 155, 0, 0, 0, 1, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera1'].x, Config.Zonas['Miniera1'].y, Config.Zonas['Miniera1'].z) < 2.0) and not mining then
                DrawText3D(Config.Zonas['Miniera1'].x, Config.Zonas['Miniera1'].y, Config.Zonas['Miniera1'].z, Language.translate[Config.lang]['premi'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent("minatore:checkjob")
                end
            end
       
            end
end)
--- BLIP 2 ----------
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
           Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, Config.Zonas['Miniera2'].x, Config.Zonas['Miniera2'].y, Config.Zonas['Miniera2'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 215, 0, 155, 0, 0, 0, 1, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera2'].x, Config.Zonas['Miniera2'].y, Config.Zonas['Miniera2'].z) < 2.0) and not mining then
                DrawText3D(Config.Zonas['Miniera2'].x, Config.Zonas['Miniera2'].y, Config.Zonas['Miniera2'].z, Language.translate[Config.lang]['premi'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent("minatore:checkjob")
                end
            end
       
            end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
            Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, Config.Zonas['Miniera3'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera3'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 215, 0, 155, 0, 0, 0, 1, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miniera3'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera3'].z) < 2.0) and not mining then
              DrawText3D(Config.Zonas['Miniera3'].x, Config.Zonas['Miniera3'].y, Config.Zonas['Miniera3'].z, Language.translate[Config.lang]['premi'])

                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent("minatore:checkjob")
                end
            end
       
     end
end)










function animazione()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_PICKAXE_WALL'), 20000, false, false, false, false)
	RSGCore.Functions.Progressbar('minier', Language.translate[Config.lang]['mining'], 20000, false, true, {
		disableMovement = false,
		disableboard = false,
		disableMouse = false,
		disableCombat = false,
	}, {}, {}, {}, function() 
	
    Wait(20000)
	
    ClearPedSecondaryTask(playerPed)
    ClearPedTasks(PlayerPedId())
	end)
end




function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end
----------------------------------- Processus ----------------------------------------------
Citizen.CreateThread(function()
    WarMenu.CreateMenu('perso', 'craft  weapon')
	WarMenu.CreateSubMenu('pp', 'perso', 'craft  weapon')
	WarMenu.CreateSubMenu('pf', 'perso', 'craft  weapon')
	WarMenu.CreateSubMenu('pd', 'perso', 'craft  weapon')
	 while true do

        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())

     if WarMenu.IsMenuOpened('perso') then

		if WarMenu.MenuButton('processing copper', 'pp') then
		end
		if WarMenu.MenuButton('processing iron', 'pf') then
		end
	    if WarMenu.MenuButton('processing aluminum', 'pd') then
		end
		if WarMenu.Button('Close') then
			Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
			WarMenu.CloseMenu()
		end	

		WarMenu.Display()
		elseif WarMenu.IsMenuOpened('pp') then
			if WarMenu.Button('processing') then
				
				WarMenu.CloseMenu()
				animacion()
				Wait(10000)
				TriggerServerEvent('MR_processa:copper')
			end
			if WarMenu.Button('Back') then
				WarMenu.CloseMenu()
				WarMenu.OpenMenu('perso')
			end	
			if WarMenu.Button('Close') then
				Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
				WarMenu.CloseMenu()
			end	
		
				WarMenu.Display()
		elseif WarMenu.IsMenuOpened('pf') then
			if WarMenu.Button('processing') then
				
				WarMenu.CloseMenu()
				animacion()
		        Wait(10000)
			    TriggerServerEvent('MR_processa:iron')
			end
			if WarMenu.Button('Back') then
				WarMenu.CloseMenu()
				WarMenu.OpenMenu('perso')
			end	
			if WarMenu.Button('Close') then
				Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
				WarMenu.CloseMenu()
			end	
		
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened('pd') then
			if WarMenu.Button('processing') then
				
				WarMenu.CloseMenu()
				animacion()
				Wait(10000)
			 TriggerServerEvent('MR_processa:aluminum')
			end
			if WarMenu.Button('Back') then
				WarMenu.CloseMenu()
				WarMenu.OpenMenu('perso')
			end	
			if WarMenu.Button('Close') then
				Citizen.InvokeNative(0x7D9EFB7AD6B19754, ped, false)
				WarMenu.CloseMenu()
			end
	
			WarMenu.Display()
			elseif (Vdist(coords.x, coords.y, coords.z, 2950.5, 1378.9, 56.3) < 1.0) then 
               TriggerEvent("enter:processminerals")
               if whenKeyJustPressed(key) and not WarMenu.IsMenuOpened('perso') then
			        TriggerEvent('MR_miniera:open')
               end 
		
		end
		Citizen.Wait(0)
		
	end	
end)

RegisterNetEvent("enter:processminerals")
  AddEventHandler("enter:processminerals", function()
    SetTextScale(0.5, 0.5)
    local msg = 'Press [G] to work'
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
  end)

  RegisterNetEvent('MR_miniera:open')
AddEventHandler('MR_miniera:open', function(cb)

	WarMenu.OpenMenu('perso')
end)
	
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, 0x760A9C6F) then
        return true
    else
        return false
    end
end

function animacion()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 10000, true, false, false, false) 
	  RSGCore.Functions.Progressbar('minier', 'Processing...', 10000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() 
    ClearPedTasksImmediately(PlayerPedId())
end)
end


Citizen.CreateThread(function()
    local blip = N_0x554d9d53f696d002(1664425300, 2950.5, 1378.9, 56.3)
    SetBlipSprite(blip, 2107754879, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Processus Minatore") 
end)


function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    
    SetTextScale(0.35, 0.35)
	RegisterFontFile('A9eelsh')
    fontId = RegisterFontId('A9eelsh')
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    local factor = (string.len(text)) / 150
    DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
    
end