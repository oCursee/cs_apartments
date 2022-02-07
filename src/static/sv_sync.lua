ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local ox_inventory = exports.ox_inventory




-- local playerStash = {
--     id = 'playerStashes',
--     label = 'Apartment Storage',
--     slots = 50,
--     weight = 100000,
--     owner = true
-- }


-- AddEventHandler('onServerResourceStart', function(resourceName)
--     if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
--         Wait(0)
--         ox_inventory:RegisterStash(playerStash.id, playerStash.label, playerStash.slots, playerStash.weight, true)
--     end
-- end)

RegisterServerEvent('cs_routebucket')
AddEventHandler('cs_routebucket', function(id)
   -- print(id)
    SetPlayerRoutingBucket(source, id)
    TriggerClientEvent('notification', source, "You have entered your apartment. ", 1)
end)

RegisterServerEvent('cs_routebucketReset')
AddEventHandler('cs_routebucketReset', function(data)
    SetPlayerRoutingBucket(source, 0)
end)