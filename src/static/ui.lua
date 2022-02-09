

local raidDisplay = false








RegisterNUICallback("exit", function()
    showraidDisplay(false)
end)

RegisterNUICallback('raid', function (data)
    room = data.room
    showraidDisplay(false)
    Wait(250)
    startRaid()
end)
RegisterNUICallback('cannotBeNul', function ()
   TriggerEvent('notification', 'You must input a room number', 2)
end)








Citizen.CreateThread(function()
    while raidDisplay do
        Citizen.Wait(0)       
        DisableControlAction(0, 1, raidDisplay)
        DisableControlAction(0, 2, raidDisplay) 
        DisableControlAction(0, 142, raidDisplay) 
        DisableControlAction(0, 18, raidDisplay) 
        DisableControlAction(0, 322, raidDisplay) 
        DisableControlAction(0, 106, raidDisplay) 
    end
end)

function showraidDisplay(bool)
    raidDisplay = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "displayRaid",
        status = bool,
    })
end

