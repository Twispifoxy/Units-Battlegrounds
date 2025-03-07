repeat wait();
until game:IsLoaded()

print("I'm running :)");

local source = "https://raw.githubusercontent.com/Twispifoxy/Units-Battlegrounds/refs/heads/main/UB.lua";

local teleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport); 
teleport("loadstring(game:HttpGet('"   .. source   .. "'))()" );