ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)
inHouse = false


exports.qtarget:AddBoxZone("Apartment", vector3(212.94, -591.6, 43.87), 4, 4, {

    name="Apartment",
    heading=327,
    --debugPoly=true
    minZ=40.77834,
	maxZ=45.87834,
},{
    options = {
        {
            event = "enterApartment",
            icon = "fas fa-building",
            label = "Enter your apartment",
        },
        {
          event = "raidApartment",
          icon = "fas fa-building",
          label = "Raid an Apartment",
          job = 'police'
      },
        
    },
    distance = 3.5
  })
  exports.qtarget:AddBoxZone("Exit_Apartment", vector3(384.02, 267.16, 91.01), 2, 2, {

    name="ExitApartment",
    heading=327,
    --debugPoly=true
    minZ=87.77834,
	maxZ=94.87834,
},{
    options = {
        {
            event = "exitApartment",
            icon = "fas fa-building",
            label = "Exit your apartment",
        },
        
    },
    distance = 3.5
  })
 
--   exports.qtarget:AddBoxZone("Storage", vector3(361.79, 273.06, 91.01), 1, 1, {

--     name="storage",
--     heading=89,
--     --debugPoly=true
--     minZ=89.77834,
-- 	maxZ=93.87834,
-- },{
--     options = {
--         {
--             event = "openStorage",
--             icon = "fas fa-archive",
--             label = "Open your storage",
--         },
        
--     },
--     distance = 3.5
--   })



  AddEventHandler('enterApartment', function ()
    local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
    inHouse = true
    DoScreenFadeOut(300)
    TriggerEvent('doorSounds')
      TriggerServerEvent('cs_routebucket', id)
      Wait(2300)
      SetEntityCoords(PlayerPedId(), 383.5519, 267.0627, 91.0091, 0, 0, 0, false)
      DoScreenFadeIn(450)
  end)
  AddEventHandler('exitApartment', function ()
    inHouse = false
    DoScreenFadeOut(300)
    TriggerEvent('doorSounds')
      TriggerServerEvent('cs_routebucketReset')
      Wait(2300)
      SetEntityCoords(PlayerPedId(), 211.4663, -593.4462, 43.8679, 0, 0, 0, false)
      DoScreenFadeIn(450)
      
  end)

  

  AddEventHandler('openStorage', function (playerStash)
    exports.ox_inventory:openInventory('stash', {id=playerStash.id, owner = true})
  end)

AddEventHandler('onResourceStop', function(resource)
  TriggerServerEvent('cs_routebucketReset')
end)

  AddEventHandler('doorSounds', function()
    SendNUIMessage({
      play = 'playSound',
    })
  end)

  AddEventHandler('raidApartment', function ()
    showraidDisplay(true)
  end)