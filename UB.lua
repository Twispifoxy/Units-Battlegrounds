repeat wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local source = "https://raw.githubusercontent.com/Twispifoxy/Units-Battlegrounds/refs/heads/main/UB.lua"

player.CharacterAdded:Connect(function()
    wait(1)
	print("I'm running :)")
    loadstring(game:HttpGet(source))()
end)