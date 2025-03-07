repeat wait() until game:IsLoaded()

local RETRY = true
local ANTIAFK = true

print("On")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 50)
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local AutoRetryButton = Instance.new("TextButton")
AutoRetryButton.Parent = Frame
AutoRetryButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AutoRetryButton.Size = UDim2.new(0, 150, 0, 50)
AutoRetryButton.Position = UDim2.new(0, 0, 0, 0)
AutoRetryButton.TextColor3 = Color3.new(0, 0, 0)
AutoRetryButton.Text = "AutoRetry: True"

local AntiAFKButton = Instance.new("TextButton")
AntiAFKButton.Parent = Frame
AntiAFKButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AntiAFKButton.Size = UDim2.new(0, 150, 0, 50)
AntiAFKButton.Position = UDim2.new(0, 150, 0, 0)
AntiAFKButton.TextColor3 = Color3.new(0, 0, 0)
AntiAFKButton.Text = "AntiAFK: True"

local MiniButton1 = Instance.new("TextButton")
MiniButton1.Parent = Frame
MiniButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniButton1.Size = UDim2.new(0, 50, 0, 50)
MiniButton1.Position = UDim2.new(0, 300, 0, 0)
MiniButton1.TextColor3 = Color3.new(0, 0, 0)
MiniButton1.Text = "-"

local MiniButton2 = Instance.new("TextButton")
MiniButton2.Parent = Frame
MiniButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniButton2.Size = UDim2.new(0, 50, 0, 50)
MiniButton2.Position = UDim2.new(0, 300, 0, 0)
MiniButton2.TextColor3 = Color3.new(0, 0, 0)
MiniButton2.Text = "-"
MiniButton2.Visible = false


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

MiniButton1.MouseButton1Click:Connect(function()
	AutoRetryButton.Visible = false
	AntiAFKButton.Visible = false
	MiniButton1.Visible = false
	MiniButton2.Visible = true
	ScreenGui.Frame..Position = UDim2.new(0, 300, 0, 0)
end)

MiniButton2.MouseButton1Click:Connect(function()
	AutoRetryButton.Visible = true
	AntiAFKButton.Visible = true
	MiniButton1.Visible = true
	MiniButton2.Visible = false
	ScreenGui.Frame..Position = UDim2.new(0, 0, 0, 0)
end)





while true do
	ScreenGui = nil
	local scriptContent = game:HttpGet("https://raw.githubusercontent.com/Twispifoxy/Units-Battlegrounds/refs/heads/main/UB.lua", true)
    
    if not scriptContent or scriptContent == "" then
        warn("Ошибка: скрипт не загружен или пуст")
        return
    end
    
    local success, func = pcall(loadstring, scriptContent)
    
    if success and func then
        pcall(func)
    else
        warn("Ошибка выполнения loadstring: " .. tostring(func))
    end
	wait(10)
end

--queue_on_teleport("loadstring(game:HttpGet('"   .. source   .. "'))()" );


--[[
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
local RetryGame_upvr = Events.Game:WaitForChild("RetryGame")
]]




