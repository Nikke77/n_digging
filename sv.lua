
local items = {
    "copper"
}

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('lapio', function(source)
    local source = source
    TriggerClientEvent('esx_n_digging:client:start', source)
end)

local item = items[math.random(1,#items)]
RegisterNetEvent("esx_n_digging:server:givereward", function ()
    local source = source
    local player = ESX.GetPlayerFromId(source)
    player.addInventoryItem(item, 1)
end)