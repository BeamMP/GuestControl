--=================================================================
-- Guest Control - Giving you the control over your guests.
-- By Titch
--=================================================================
-- Configuration
--=================================================================
--    Setting        = Value (true/false)
--=================================================================
local AllowGuests    = true
local AllowGuestChat = false
--=================================================================
-- DO NOT TOUCH BEYOND THIS POINT
--=================================================================

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function onChatMessage(id, name, message)
	local identifiers = GetPlayerIdentifiers(id)
	if identifiers == nil and not AllowGuestChat then -- the nil means they are a guest
		SendChatMessage(id, "Sorry chat is disabled for guest players on this server. Please register for a BeamMP Account to use the Chat functionality.")
		return 1
	end
end

function onPlayerAuth(name, role, isGuest)
	if isGuest and not AllowGuests then
		return "You must be signed in to join this server!"
	end
end

RegisterEvent("onPlayerAuth","onPlayerAuth")
RegisterEvent("onChatMessage","onChatMessage")