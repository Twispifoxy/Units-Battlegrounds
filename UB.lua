repeat wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local source = "https://raw.githubusercontent.com/Twispifoxy/Units-Battlegrounds/refs/heads/main/UB.lua"

print("on")

queue_on_teleport("loadstring(game:HttpGet('"   .. source   .. "'))()" );