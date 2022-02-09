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


startRaid = function ()
    local id = room
    TriggerEvent('notification', 'Breaching Apartment number '..id, 1)
    inHouse = true
    DoScreenFadeOut(300)
    TriggerEvent('doorSounds')
    TriggerServerEvent('cs_routebucket', id)
    Wait(2300)
    SetEntityCoords(PlayerPedId(), 383.5519, 267.0627, 91.0091, 0, 0, 0, false)
    DoScreenFadeIn(450) 
                   
                
end