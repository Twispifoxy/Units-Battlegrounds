repeat wait() until game:IsLoaded()

local RETRY = true
local ANTIAFK = true

print("On")

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
AutoRetryButton.Size = UDim2.new(0, 150, 0, 50)
AutoRetryButton.Position = UDim2.new(0, 50, 0, 20)
AutoRetryButton.TextColor3 = Color3.new(0, 0, 0)
AutoRetryButton.Text = "AutoRetry: True"


local AntiAFKButton = Instance.new("TextButton")
AntiAFKButton.Parent = Frame
AntiAFKButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AntiAFKButton.Size = UDim2.new(0, 150, 0, 50)
AntiAFKButton.Position = UDim2.new(0, 150, 0, 20)
AntiAFKButton.TextColor3 = Color3.new(0, 0, 0)
AntiAFKButton.Text = "AntiAFK: True"






AutoRetryButton.MouseButton1Down:connect(function()
	if RETRY then
		RETRY = false
		AutoRetryButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		AutoRetryButton.Text = "AutoRetry: False"

	else
		RETRY = true
		AutoRetryButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
		AutoRetryButton.Text = "AutoRetry: True"
		
	end
end)


AntiAFKButton.MouseButton1Down:connect(function()
	if ANTIAFK then
		ANTIAFK = false
		AntiAFKButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		AntiAFKButton.Text = "AntiAFK: False"

	else
		ANTIAFK = true
		AntiAFKButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
		AntiAFKButton.Text = "AntiAFK: True"
		
	end
end)





while true do
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Twispifoxy/Units-Battlegrounds/refs/heads/main/UB.lua"))()
	wait(10)
end

--queue_on_teleport("loadstring(game:HttpGet('"   .. source   .. "'))()" );


--[[
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
local RetryGame_upvr = Events.Game:WaitForChild("RetryGame")
]]




