SLASH_ENABLEGWHISPER1 = '/gwhisper'

local f = CreateFrame("Frame");
local function myEvent(event, ...)
	if gwhisper_enabled == 1 then
		message = arg1
		if string.find(message, "Herald") or string.find(message, "herald") then 
			DEFAULT_CHAT_FRAME:AddMessage("Inviting |cFFFF0000"..arg2.."|r to guild")
			GuildInviteByName(arg2)
		end
	end
end

f:RegisterEvent("CHAT_MSG_WHISPER")
f:SetScript("OnEvent", myEvent)

local function handler(msg, editbox)
	if msg == 'on' then
		DEFAULT_CHAT_FRAME:AddMessage("Guild Invite on Whisper is now |cFFFF0000ON")
		gwhisper_enabled = 1
	elseif msg == 'off' then
		DEFAULT_CHAT_FRAME:AddMessage("Guild Invite on Whisper is now |cFFFF0000OFF")
		gwhisper_enabled = 0
	else 
		if gwhisper_enabled == 0 then
			enabled = "OFF"
		end
		
		if gwhisper_enabled == 1 then
			enabled = "ON"
		end
		
		DEFAULT_CHAT_FRAME:AddMessage("Guild Invite on Whisper is currently |cFFFF0000"..enabled)
	end
end

SlashCmdList["ENABLEGWHISPER"] = handler
