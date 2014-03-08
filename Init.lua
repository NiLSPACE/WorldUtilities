
-- Implements the Initialize and OnDisable function





-- Initialize the globals
g_Plugin = nil
g_WorldsWithoutWeatherChange = {}
g_WorldExeption = {}

g_WorldStuckTime = {}
g_WorldSetTimeCountdown = {}





-- The initialize function. Add the hooks and commands
function Initialize(a_Plugin)
	a_Plugin:SetName("WorldUtilities")
	a_Plugin:SetVersion(1)
	
	g_Plugin = a_Plugin
	
	-- Load the InfoReg shared library:
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
	
	-- Bind the commands
	RegisterPluginInfoCommands()
	
	-- Register the hooks.
	cPluginManager:AddHook(cPluginManager.HOOK_WEATHER_CHANGING, OnWeatherChanging)
	cPluginManager:AddHook(cPluginManager.HOOK_WORLD_TICK, OnWorldTick)
	
	LoadWorlds()
	
	LOG("Initialized WorldUtilities v" .. a_Plugin:GetVersion())
	return true
end






function OnDisable()
	SaveWorlds()
	LOG("WorldUtilities is shutting down.")
end