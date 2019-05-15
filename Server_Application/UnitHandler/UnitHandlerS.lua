-- Unit Handler Server Script --

-- Retrieve Unit Data
RegisterServerEvent("getUnitData")
RegisterServerEvent("returnUnitData")
AddEventHandler("getUnitData", function(playerId)
    local steamHex = nil
    local unitId;
    local unitType;
    local identifiers = GetPlayerIdentifiers(playerId)
    for _, identifier in next, identifiers do
        if string.find(identifier, "steam:") then
            steamHex = identifier
            break
        end
    end
    steamHex = steamHex

    MySQL.Async.fetchAll("SELECT 1 FROM FiveM_UnitHandler.unit_data WHERE steam_hex = @steamHex;",
    {["@steamHex"] = steamHex},
    function(result)
        if result[1] == nil then
            MySQL.Async.fetchAll("INSERT INTO FiveM_UnitHandler.unit_data (steam_hex, unit_id, unit_type) VALUES (@steamHex, @uid, @utype);",
            {["@steamHex"] = steamHex, ["@uid"] = "000", ["@utype"] = "leo"},
            function(result)
                unitId = "000"
                unitType = "leo"
                TriggerClientEvent("returnUnitData", playerId, unitId, unitType)
            end)
        else
            MySQL.Async.fetchAll("SELECT * FROM FiveM_UnitHandler.unit_data WHERE steam_hex = @steamHex;",
            {["@steamHex"] = steamHex},
            function(result)
                unitId = result[1].unit_id
                unitType = result[1].unit_type
                TriggerClientEvent("returnUnitData", playerId, unitId, unitType)
            end)
        end
    end)
end)

-- Update Unit Id
RegisterServerEvent("updateUnitId")
RegisterServerEvent("returnUnitId")
AddEventHandler("updateUnitId", function(playerId, unitId)
    local steamHex = nil
    local unitId;
    local unitType;
    local identifiers = GetPlayerIdentifiers(playerId)
    for _, identifier in next, identifiers do
        if string.find(identifier, "steam:") then
            steamHex = identifier
            break
        end
    end
    steamHex = steamHex

    MySQL.Async.fetchAll("FiveM_UnitHandler.unit_data SET unit_id = @uid WHERE steam_hex = @steamHex;",
    {["uid"] = unitId, ["@steamHex"] = steamHex},
    function(result)
        TriggerClientEvent("returnUnitId", playerId, unitId)
    end)
end)

-- Update Unit Type
RegisterServerEvent("updateUnitType")
RegisterServerEvent("returnUnitType")
AddEventHandler("updateUnitType", function(playerId, unitType)
    local steamHex = nil
    local unitId;
    local unitType;
    local identifiers = GetPlayerIdentifiers(playerId)
    for _, identifier in next, identifiers do
        if string.find(identifier, "steam:") then
            steamHex = identifier
            break
        end
    end
    steamHex = steamHex

    MySQL.Async.fetchAll("FiveM_UnitHandler.unit_data SET unit_id = @uid WHERE steam_hex = @steamHex;",
    {["uid"] = unitId, ["@steamHex"] = steamHex},
    function(result)
        TriggerClientEvent("returnUnitId", playerId, unitId)
    end)
end)