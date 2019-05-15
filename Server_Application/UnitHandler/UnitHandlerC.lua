-- Unit Handler Server Script --

-- Set Variables
local unitConfigured = false;
local unitId;
local unitType;
local unitActive = false

-- Register Unit Id
RegisterCommand("uhid", function(source, unit)
    unit[1] = unit[1] or 0
    if unitConfigured == false then return getUnitSettings(source) end
    if unit[1] == 0 then
        msg = "~r~No Unit ID Detected!\n~b~Ex. /uhid 123"
    else
        unitId = unit[1]
        msg = "~b~Your Unit ID is now set to: ~g~" .. unitId
    end
    ShowNotification(msg)
end, false)

-- Register Unit Type
RegisterCommand("uhtype", function(source, type)
    type[1] = type[1] or 0
    if unitId == false then return getUnitSettings(source) end
    if type[1] == 0 then
        msg = "~r~No Unit Type Detected!\n~g~Ex. ~o~/uhtype ~b~leo"
    else
        unitType = type[1]:lower()
        if unitType == "leo" then
            unitColor = "~b~"
        elseif unitType == "fire" then
            unitColor = "~r~"
        elseif unitType == "tow" then
            unitColor = "~o~"
        end
        msg = "~b~Your Unit Type is now set to: ".. unitColor .. unitType
    end
    ShowNotification(msg)
end, false)

-- Register Unit Active
RegisterCommand("uhactive", function(source)
    if unitConfigured == false then return getUnitSettings(source) end
    if unitActive == false then
        unitActive = true
        msg = "~b~Your Unit GPS is now: ~g~On"
    elseif unitActive == true then
        unitActive = false
        msg = "~b~Your Unit GPS is now: ~r~Off"
    end

    ShowNotification(msg)
end, false)

-- View Current Settings
RegisterCommand("uhunit", function(source)
    if unitConfigured == false then return getUnitSettings(source) end
    showUnit(source)
end, false)

-- Show Data
function showUnit(source)
    local unitColor;
    local gpsColor;

    if unitType == "leo" then
        unitColor = "~b~"
    elseif unitType == "fire" then
        unitColor = "~r~"
    elseif unitType == "tow" then
        unitColor = "~o~"
    end

    ShowNotification("~g~Unit Id: ~r~" .. unitId .. "\n~g~unitType: " .. unitColor .. unitType)
end

-- Retrieve Values
RegisterNetEvent("getUnitData")
function getUnitSettings(source)
    ShowNotification("~o~Retrieving Unit Values..")
    playerId = GetPlayerServerId(source)
    TriggerServerEvent("getUnitData", playerId)
end

RegisterNetEvent("returnUnitData")
AddEventHandler("returnUnitData", function(unitId, unitType)
    unitConfigured = true;
    updateUnitData(unitId, unitType)
end)

function updateUnitData(uId, uType)
    unitId = uId;
    unitType = uType;
    ShowNotification("~g~ Unit Values have been Retrieved\n~r~Re-enter Previous Command")
    showUnit(source)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterCommand("uhconfig", function(source)
    ShowNotification(unitConfigured)
end, false)