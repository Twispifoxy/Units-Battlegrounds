repeat wait() until game:IsLoaded()

local RETRY = false
local retryEventConnection = nil

local vu = game:GetService("VirtualUser")
local antiAFKConnect = game:GetService("Players").LocalPlayer.Idled:Connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("AntiAFK on")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 330, 0, 60)
Frame.AnchorPoint = Vector2.new(1, 1)
Frame.Position = UDim2.new(0, 330, 0.124, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Имбулечка"
Title.Size = UDim2.new(0, 300, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

local AutoRetryButton = Instance.new("TextButton")
AutoRetryButton.Parent = Frame
AutoRetryButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
AutoRetryButton.Size = UDim2.new(0, 150, 0, 30)
AutoRetryButton.Position = UDim2.new(0, 0, 0, 30)
AutoRetryButton.TextColor3 = Color3.new(0, 0, 0)
AutoRetryButton.Text = "AutoRetry: False"
AutoRetryButton.TextSize = 14

local AntiAFKButton = Instance.new("TextButton")
AntiAFKButton.Parent = Frame
AntiAFKButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AntiAFKButton.Size = UDim2.new(0, 150, 0, 30)
AntiAFKButton.Position = UDim2.new(0, 150, 0, 30)
AntiAFKButton.TextColor3 = Color3.new(0, 0, 0)
AntiAFKButton.Text = "AntiAFK: True"
AntiAFKButton.TextSize = 14

local MiniButton = Instance.new("TextButton")
MiniButton.Parent = Frame
MiniButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniButton.Size = UDim2.new(0, 30, 0, 30)
MiniButton.Position = UDim2.new(0, 300, 0, 30) 
MiniButton.TextColor3 = Color3.new(1, 1, 1)
MiniButton.Text = "-"
MiniButton.TextScaled = true

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0, 300, 0, 0) 
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Text = "x"
CloseButton.TextScaled = true

local function ToggleVisibility(state)
	Title.Visible = state
    AutoRetryButton.Visible = state
    AntiAFKButton.Visible = state
	CloseButton.Visible = state
    Frame.Size = state and UDim2.new(0, 330, 0, 60) or UDim2.new(0, 30, 0, 30)
	MiniButton.Position = state and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 0, 0, 0)
end

MiniButton.MouseButton1Click:Connect(function()
    local visible = not AutoRetryButton.Visible
    ToggleVisibility(visible)
    MiniButton.Text = visible and "-" or "+"
end)

AutoRetryButton.MouseButton1Click:Connect(function()
    RETRY = not RETRY
    AutoRetryButton.BackgroundColor3 = RETRY and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    AutoRetryButton.Text = RETRY and "AutoRetry: True" or "AutoRetry: False"
    
    if RETRY then
        local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
        local RetryGame_upvr = Events.Game:WaitForChild("RetryGame")
        
        retryEventConnection = Events.Game:WaitForChild("FinishGame").OnClientEvent:Connect(function()
            RetryGame_upvr:FireServer()
        end)
        
        print("AutoRetry on")
    else
        if retryEventConnection then
            retryEventConnection:Disconnect()
            retryEventConnection = nil
            print("AutoRetry off")
        end
    end
end)

AntiAFKButton.MouseButton1Click:Connect(function()
    local originalText = AntiAFKButton.Text
    AntiAFKButton.Text = "Why?"
    wait(1)
    AntiAFKButton.Text = originalText
end)

CloseButton.MouseButton1Click:Connect(function()
	if retryEventConnection then
		retryEventConnection:Disconnect()
		retryEventConnection = nil
		print("AutoRetry off")
	end
	if antiAFKConnect then 
		antiAFKConnect:Disconnect()
		antiAFKConnect = nil
		print("AntiAFK off")
	end
    ScreenGui:Destroy()
end)