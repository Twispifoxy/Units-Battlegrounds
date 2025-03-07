repeat wait() until game:IsLoaded()

local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
local RetryGame_upvr = Events.Game:WaitForChild("RetryGame")

local RETRY = true
local ANTIAFK = true


print("On")
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local AutoRetryButton = Instance.new("TextButton")
AutoRetryButton.Parent = Frame
AutoRetryButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AutoRetryButton.Size = UDim2.new(0, 100, 0, 50)
AutoRetryButton.Position = UDim2.new(0, 0, 0, 50)
AutoRetryButton.TextColor3 = Color3.new(0, 0, 0)
AutoRetryButton.BackgroundTransparency = 1
AutoRetryButton.Text = "AutoRetry: " .. RETRY



local AntiAFKLabel = Instance.new("TextLabel")
AntiAFKLabel.Parent = Frame
AntiAFKLabel.Text = "AntiAFK:"
AntiAFKLabel.Size = UDim2.new(0, 100, 0, 50)
AntiAFKLabel.Position = UDim2.new(0, 50, 0, 100)
AntiAFKLabel.TextColor3 = Color3.new(1, 1, 1)
AntiAFKLabel.BackgroundTransparency = 1






AutoRetryButton.MouseButton1Down:connect(function()
	if RETRY then
		RETRY = false
		AutoRetryButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

	else
		RETRY = true
		AutoRetryButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
		
	end
end)





while true do
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Twispifoxy/Units-Battlegrounds/refs/heads/main/UB.lua"))()
	wait(10)
end

--queue_on_teleport("loadstring(game:HttpGet('"   .. source   .. "'))()" );





