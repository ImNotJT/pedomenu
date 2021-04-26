

CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd("wm"), "wm2", GetDuiHandle(CreateDui("https://media.discordapp.net/attachments/758474436331831316/765781192989081610/watermalone.PNG?", 50, 50)))
local ypos2 = 0.008
local MenuKeys = {
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["E"] = 38,
    ["R"] = 45,
    ["Y"] = 246,
    ["U"] = 303,
    ["CAPS"] = 137,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTALT"] = 19,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["INSERT"] = 121,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["UP"] = 172,
    ["DOWN"] = 173,
    ["LEFTSHIFT"] = 131,
    ["N4"] = 108,
    ["N5"] = 110,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N9"] = 118,
    ["MOUSE3"] = 348
}
local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    [""] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["INSERT"] = 121,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["UP"] = 172,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["MWHEELUP"] = 15,
    ["MWHEELDOWN"] = 14,
    ["LEFTSHIFT/N8"] = 61,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N9"] = 118,
    ["MOUSE1"] = 24,
    ["MOUSE2"] = 25,
    ["MOUSE3"] = 348
}
local selected_tab = 1
local menuenabled = true
local lilwm = true
local cachedNotifications = {}

local texture_preload = {
    "mpleaderboard",
    "commonmenu",
    "pilotschool",
    "srange_gen",
	"mpweaponscommon",
	"visualflow",
	"mptattoos",
	"mpweaponsgang1",
	"mphud",
	"mpweaponsunusedfornow"
}

local WM = {
    Menu = {
        MenuX = 0.5,
        MenuY = 0.5,
    }
}

function math.round(first, second)
    return tonumber(string.format("%." .. (second or 0) .. "f", first))
end

local function PreloadTextures()
	for i = 1, #texture_preload do
		RequestStreamedTextureDict(texture_preload[i])
	end
end
PreloadTextures()

local function AddNotification(text, type, ms)
    if type == "GREEN" then
        table.insert(cachedNotifications, { ['text'] = "~w~[~g~WM~w~] ".. text, ['time'] = ms, ['startTime'] = GetGameTimer() })
    end
    if type == "INFO" then
	    table.insert(cachedNotifications, { ['text'] = "~w~[~b~WM~w~] ".. text, ['time'] = ms, ['startTime'] = GetGameTimer() })
    end
    if type == "ORANGE" then
        table.insert(cachedNotifications, { ['text'] = "~w~[~o~WM~w~] ".. text, ['time'] = ms, ['startTime'] = GetGameTimer() })
    end
    if type == "ERROR" then
        table.insert(cachedNotifications, { ['text'] = "~w~[~r~WM~w~] ".. text, ['time'] = ms, ['startTime'] = GetGameTimer() })
    end
end
AddNotification("Imagine being a fallout user, couldn't be us #WMGang","GREEN",5000)
AddNotification("Hi, i'm wm and i'm sexually attracted to underage women!","ORANGE",5000)
AddNotification("github.com/ImNotJT","GREEN",5000)
Citizen.CreateThread(function()
    while menuenabled do
        Wait(0)

        if lilwm then
            DrawSprite("wm", "wm2", 0.5, 0.1, 0.12, 0.12,0,255,255,255,255)
        end
    end
end)

local function DrawText(text, x, y, outline, size, font, centre)
    SetTextFont(0)
    if outline then
        SetTextOutline(true)
    end
    if tonumber(font) ~= nil then
        SetTextFont(font)
    end
	if centre then
		SetTextCentre(true)
	end
    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(text)
    EndTextCommandDisplayText(x, y)
end

local function GetTextWidht(str, font, scale)
    BeginTextCommandWidth("STRING")
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 4)
    SetTextScale(scale or 0.35, scale or 0.35)
    local length = EndTextCommandGetWidth(1)

    return length
end

local to_add_X = WM.Menu.MenuX-0.5
local to_add_Y = WM.Menu.MenuY-0.5
local function MenuButton(id, text, x, y, outline)
    if id == selected_tab then
        DrawRect(x+to_add_X, y+to_add_Y+0.011,0.05,0.02,0,0,0,220)
        SetTextColour(13, 105, 117,255)
        DrawText(text, x+to_add_X, y+to_add_Y, outline, 0.31, 4, true)
    else
        DrawText(text, x+to_add_X, y+to_add_Y, outline, 0.31, 4, true)        
    end
    
    local cursor_x, cursor_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    
    local widht = GetTextWidht(text, 0, 0.2)

    if( (cursor_x) + 0.02 >= x+to_add_X and (cursor_x) - 0.02 <= x+to_add_X and (cursor_y) + 0.01 >= y+to_add_Y and (cursor_y) - 0.015 <= y+to_add_Y) then
        SetTextColour(255,0,0,255)
        DrawText(text, x+to_add_X, y+to_add_Y, outline, 0.31, 4, true)
    end

    if( (cursor_x) + 0.02 >= x+to_add_X and (cursor_x) - 0.02 <= x+to_add_X and (cursor_y) + 0.01 >= y+to_add_Y and (cursor_y) - 0.015 <= y+to_add_Y and IsDisabledControlJustReleased(0, 92)) then 
        return true
    else
        return false
    end
end
local function PlayerButtons(text, x, y, outline)
    local cursor_x, cursor_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    
    local widht = GetTextWidht(text, 0, 0.2)

    if( (cursor_x) + 0.03 >= x+to_add_X and (cursor_x) - 0.1 <= x+to_add_X and (cursor_y) + 0.009 >= y+to_add_Y and (cursor_y) - 0.009 <= y+to_add_Y) then
        SetTextColour(255,0,0, 255)
        DrawText(text, x+to_add_X-0.028, y+to_add_Y-0.011, outline, 0.3, 4, false)
    else
        DrawText(text, x+to_add_X-0.028, y+to_add_Y-0.011, outline, 0.3, 4, false)
    end


    if( (cursor_x) + 0.03 >= x+to_add_X and (cursor_x) - 0.1 <= x+to_add_X and (cursor_y) + 0.009 >= y+to_add_Y and (cursor_y) - 0.009 <= y+to_add_Y and IsDisabledControlJustReleased(0, 92)) then 
        return true
    else
        return false
    end
end
local function Checkbox(nazwa,x,y,bool, outline)
    local cursor_x, cursor_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    x = x+0.014
    local x2 = x-0.023
    
    if bool then
    	DrawRect(x2+to_add_X, y+to_add_Y, 0.01, 0.017,13,13,13,255)
        DrawSprite("commonmenu", "shop_tick_icon", x2+to_add_X, y+to_add_Y, 0.015, 0.022, 0.0, 0, 255, 0, 255)
        else
        DrawRect(x2+to_add_X, y+to_add_Y, 0.01, 0.017,13,13,13,255)
    end
	
	local text_widht = (GetTextWidht(nazwa) / 2)

    if( (cursor_x) + 0.03 >= x+to_add_X and (cursor_x) <= x+text_widht+to_add_X and (cursor_y) + 0.0077 >= y+to_add_Y and (cursor_y) - 0.0072 <= y+to_add_Y) then
        SetTextColour(255,0,0, 255)
        DrawText(nazwa,x+0.01+to_add_X-0.027,y+to_add_Y-0.011,outline,0.29, 4)
        DrawSprite("commonmenu", "shop_tick_icon", x2+to_add_X, y+to_add_Y, 0.015, 0.022, 0.0, 255, 0, 0, 255)
    else
 	    DrawText(nazwa,x+0.01+to_add_X-0.027,y+to_add_Y-0.011,outline,0.29, 4)
    end

	if( (cursor_x) + 0.03 >= x+to_add_X and (cursor_x) <= x+text_widht+to_add_X and (cursor_y) + 0.0077 >= y+to_add_Y and (cursor_y) - 0.0072 <= y+to_add_Y) and IsDisabledControlJustPressed(0, 92) then 
        return true
    else
        return false
    end
end

local menu_tabs = {
    [1] = {name = "Lua", items = (function()
        if Checkbox("Pedo Checkbox",0.43,0.275,hey,false) then
            hey = not hey
        end
    end)},
    [2] = {name = "Aimbot"},
    [3] = {name = "Visuals"},
    [4] = {name = "Vehicle"},
    [5] = {name = "Weapons"},
    [6] = {name = "Miscellaneous"},
    [7] = {name = "Malicious"},
    [8] = {name = "Player"},
    [9] = {name = "Others"},
    [10] = {name = "AI"},
    [11] = {name = "RC"},
    [12] = {name = "Chat"},
    [13] = {name = "Camera"},
    [14] = {name = "Configs"}
}

local function DrawButtons()
    SetMouseCursorSprite(8)
    to_add_X = WM.Menu.MenuX-0.5
    to_add_Y = WM.Menu.MenuY-0.5
    -- Left Rect
    DrawRect(to_add_X+0.365,to_add_Y+0.485,0.055,0.475,0,0,0,220)
    -- Middle Rect
    DrawRect(to_add_X+0.475,to_add_Y+0.485,0.15,0.475,0,0,0,220)
    -- Top Rect
    DrawRect(to_add_X+0.475,to_add_Y+0.225,0.15,0.024,0,0,0,220)
    -- Top Right Rect
    DrawRect(to_add_X+0.625,to_add_Y+0.225,0.135,0.024,0,0,0,220)
    -- Right Rect
    DrawRect(to_add_X+0.625,to_add_Y+0.485,0.135,0.475,0,0,0,220)
    -- Text
    DrawText("Watermalone.net - 4/21/2069 (".. GetPlayerName()..")",to_add_X+0.403,to_add_Y+0.2135,true,0.3,4,false)
    DrawText("Player List | On: ".. #GetActivePlayers(),to_add_X+0.56,to_add_Y+0.2135,true,0.3,4,false)

    for key = 1, #menu_tabs do
        local value = menu_tabs[key]
        if (MenuButton(key, value.name, 0.365, 0.26 + (key> 1 and (key - 1) * 0.03 or 0), true)) then 
            selected_tab = key
        end
    end
    if (menu_tabs[selected_tab].items ~= nil) then
        menu_tabs[selected_tab].items()
    end

    local playerlist = GetActivePlayers()
    local hash = GetEntityModel(GetPlayerPed(SelectedPlayer))
    local lmao = "M"
    if hash == `mp_f_freemode_01` then
        lmao = "F"
    elseif hash == `mp_f_freemode_01` then
        lmao = "M"
    else
        lmao = "N"
    end
    if SelectedPlayer == nil then
        SelectedPlayer = playerlist[1]
    end
    DrawSprite("mpinventory","mp_specitem_ped", to_add_X+0.675, to_add_Y+0.225, 0.015, 0.02, 0.0,0, 255, 0, 255)
    DrawSprite("mpinventory","mp_specitem_ped", to_add_X+0.685, to_add_Y+0.225, 0.015, 0.02, 0.0,255, 0, 0, 255)
    if #GetActivePlayers() >= 30 then
        if IsDisabledControlJustPressed(0, 15) then
            ypos2 = ypos2 + 0.015
        end
        if IsDisabledControlJustPressed(0, 14) then
            ypos2 = ypos2 - 0.015
        end
    end
    for i = 1, #playerlist do
        local currPlayer = playerlist[i]
        local buttonypos = ( (0.26*1.0) + (i-1) * 0.02) + ypos2
        
        if buttonypos >= 0.26 and buttonypos <= 0.7125 then
            if PlayerButtons("ID: ".. GetPlayerServerId(currPlayer) .. " | NAME: ".. GetPlayerName(currPlayer) .. " | M/F: ".. lmao,0.59,buttonypos, false) then
                SelectedPlayer = currPlayer
                AddNotification("Selected Player: ".. GetPlayerName(currPlayer),"INFO",5000)
            end
            --print(buttonypos)
        end
    end
end

local function DisableMovement(bool)
    DisableControlAction(0, 1, true) -- LookLeftRight
    DisableControlAction(0, 2, true) -- LookUpDown
    DisableControlAction(0, 142, false) -- MeleeAttackAlternate
    DisableControlAction(0, 18, true) -- Enter
    DisableControlAction(0, 322, true) -- ESC
    DisableControlAction(0, 24, true)
    FreezeEntityPosition(PlayerPedId(), false)
    DisableControlAction(0, 25, true)
    DisableControlAction(0, 106, true)
    DisableControlAction(0, 229, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 24, true)
end

local function DrawMenu()
    SetMouseCursorActiveThisFrame()
    local cursor_x, cursor_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    if dragging_allowed and IsDisabledControlPressed(1, 24) then
        dragging = true
        WM.Menu.MenuX = cursor_x
        WM.Menu.MenuY = cursor_y+0.28
        SetMouseCursorSprite(4)
    else   
        dragging = false
        dragging_allowed = false
    end

    if( (cursor_x) + 0.19 >= WM.Menu.MenuX and (cursor_x) - 0.19 <= WM.Menu.MenuX and (cursor_y) + 0.01 >= WM.Menu.MenuY-0.28 and (cursor_y) - 0.01 <= WM.Menu.MenuY-0.28) then
        if IsDisabledControlPressed(1, 24) and not dragging then
            dragging_allowed = not dragging_allowed
        end

        if not dragging then
            SetMouseCursorSprite(8)
        end
    else
        SetMouseCursorSprite(5)
    end
    DrawButtons()
    DisableMovement(true)
end 

Citizen.CreateThread(function()
    while menuenabled do 
        Citizen.Wait(0)
        if #cachedNotifications > 0 then
            DrawRect(0.105,0.3, 0.19, 0.025, 13,13,13, 200)
            DrawText("Watermalone Event Log",0.012,0.288,true,0.31,4,false)
            for notificationIndex = 1, #cachedNotifications do
                local notification = cachedNotifications[notificationIndex]
                
                if notification then
                    notification['opacity'] = (notification['opacity'] or (notification['time'] / 1000) * 60) - 1
                    local offset = 10 + (notificationIndex * 1.0)
                    local timer = (Citizen.InvokeNative(0x9CD27B0045628463) - notification['startTime']) / notification['time'] * 100        
                    DrawRect(0.105,0.03*offset, 0.19, 0.03, 13,13,13, 200)                   
                    DrawText(notification['text'], 0.01, 0.029*offset, true, 0.31, 4, false) 
                    if timer >= 100 then
                        table.remove(cachedNotifications, notificationIndex)
                    end
                end
            end
        end
    end 
end)

Citizen.CreateThread(function()
    while menuenabled do
        Citizen.Wait(0)
        if IsDisabledControlJustReleased(1, 348) then
            menu_display = not menu_display
        end
        if menu_display then
            DrawMenu()
        end
        if IsDisabledControlJustPressed(0, 121) then
            lilwm = false
            menuenabled = false
        end
    end
end)

