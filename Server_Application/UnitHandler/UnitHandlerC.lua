-- Unit Handler Server Script --

-- Setup Menu
_menuPool = MenuPool.New()
unitMenu = UIMenu.New("UNIT GPS", "~b~PUBLIC SERVICES UNIT GPS")
_menuPool:Add(unitMenu)
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

-- Get Steam Hex


-- Set Variables
local SteamHex = "110000104b4dd4e"
local MenuKeyCode = 56
local unitId = "000"
local unitType = "leo"
local unitActive = false

function setUnitId(menu)
    local setUnitId = UIMenuItem.New("Unit Id:", "GPS: Unit Id")
    setUnitId:RightLabel("~r~" .. unitId)
    menu:AddItem(setUnitId)
    menu.OnItemSelect = function(sender, item, index)
        if item == setUnitId then
            ShowNotification("~b~To update your Unit ID use the following command:\n~g~/uhid\n~r~Ex. /uhid 123")
        end
    end
end

function setUnitType(menu)
    local UnitTypes = {
        "~b~Leo",
        "~r~Fire",
        "~o~Tow"
    }
    local setUnitType = UIMenuListItem.New("Unit Type:", UnitTypes, 1, "GPS: Unit Type")
    menu:AddItem(setUnitType)
    menu.OnListSelect = function(sender, item, index)
        if item == setUnitType then
            unitType = item:IndexToItem(index)
            ShowNotification("~g~Unit Type: " .. unitType)
        end
    end
end

function setActiveStatus(menu)
    local setStatus = UIMenuCheckboxItem.New("Activate Unit GPS", unitActive, "GPS: Activate/Deactivate")
    menu:AddItem(setStatus)
    menu.OnCheckboxChange = function(sender, item, checked_)
        if item == setStatus then
            unitActive = checked_
            if(unitActive == true) then
                ShowNotification("~b~Unit GPS:~g~ On")
            else
                ShowNotification("~b~Unit GPS:~r~ Off")
            end
        end
    end
end

setUnitId(unitMenu)
setUnitType(unitMenu)
setActiveStatus(unitMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, MenuKeyCode) then
            unitMenu:Visible(not unitMenu:Visible())
        end
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Register User Id
RegisterCommand("uhid", function(source, unit)
    unit[1] = unit[1] or 0
    if unit[1] == 0 then
        msg = "~r~No Unit ID Detected!\n~b~Ex. /uhid 123"
    else
        msg = "~b~Your Unit ID is now set to: ~g~" .. unit[1]
    end
    ShowNotification(msg)
end, false)

RegisterCommand("getid", function(source)
    playerId = GetPlayerServerId(source)
    ShowNotification("Player Id: " .. playerId)
end, false)