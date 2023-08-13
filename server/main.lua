local QBCore = exports['qb-core']:GetCoreObject()
local tunedVehicles = {}

QBCore.Functions.CreateUseableItem("tunerlaptop", function(source, item)
    TriggerClientEvent('qb-tunerchip:client:openChip', source)
end)

RegisterNetEvent('qb-tunerchip:server:TuneStatus', function(plate, bool)
    if bool then
        tunedVehicles[plate] = bool
    else
        tunedVehicles[plate] = nil
    end
end)

QBCore.Functions.CreateCallback('qb-tunerchip:server:HasChip', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local Chip = Ply.Functions.GetItemByName('tunerlaptop')

    if Chip ~= nil then
        cb(true)
    else
        DropPlayer(src, 'This is not the idea, is it?')
        cb(true)
    end
end)

QBCore.Functions.CreateCallback('qb-tunerchip:server:GetStatus', function(source, cb, plate)
    cb(tunedVehicles[plate])
end)

QBCore.Commands.Add('changewallpaper', "Change Your Tuner Cheap Background", {{name = "url", help = "image URL"}}, false, function(source, args)
    local src = source
    TriggerClientEvent('qb-tunercheap:setbackGround', src, args[1])
end, 'user')

QBCore.Commands.Add('resetwallpaper', "Reset Your Tuner Cheap Background", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-tunercheap:setbackGround', src, './mi.png')
end, 'user')


RegisterNetEvent('limbo-tunerchip:saveSettings', function(plate, boost, acceleration, gearchange, breaking)
    local data = {
        boost = boost,
        acceleration = acceleration,
        gearchange = gearchange,
        drivetrain = 2,
        breaking = breaking,
    }
    local result = MySQL.Sync.prepare('SELECT * FROM player_vehicles where plate = ?', {plate})
    if not result then return end
    MySQL.Sync.prepare('UPDATE player_vehicles SET tunedata = ? WHERE plate = ?', {json.encode(data), plate})
end)

RegisterNetEvent('limbo-tunerchip:getSettings', function(veh, plate)
    local result = MySQL.Sync.prepare('SELECT * FROM player_vehicles where plate = ?', {plate})
    if not result then return end
    local data = json.decode(result.tunedata)
    print(veh)
    TriggerClientEvent('limbo-tunerchip:getSettings', -1, veh, data)
end)