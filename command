local events = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
local messageDoneFiltering = events:WaitForChild("OnMessageDoneFiltering")
local players = game:GetService("Players")
local client = players.LocalPlayer
messageDoneFiltering.OnClientEvent:Connect(function(message)
    local player = players:FindFirstChild(message.FromSpeaker)
    local message = message.Message or ""
	
end)
