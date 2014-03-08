
-- This file implements the storage. It's just an IniFile.





function LoadWorlds()
	local IniFile = cIniFile()
	IniFile:ReadFile(g_Plugin:GetLocalFolder() .. "/WorldInfo.ini")
	
	cRoot:Get():ForEachWorld(function(a_World)
		local WorldName = a_World:GetName()
		if (IniFile:GetValueI(WorldName, "SetTime") ~= 0) then
			g_WorldStuckTime[WorldName] = IniFile:GetValueI(WorldName, "SetTime")
		end
		g_WorldSetTimeCountdown[WorldName] = 20
		g_WorldsWithoutWeatherChange[WorldName] = IniFile:GetValueB(WorldName, "ShouldWeatherChange") or false
		g_WorldExeption[WorldName] = false
	end)
end





function SaveWorlds()
	local IniFile = cIniFile()
	IniFile:ReadFile(g_Plugin:GetLocalFolder() .. "/WorldInfo.ini")
	
	cRoot:Get():ForEachWorld(function(a_World)
		local WorldName = a_World:GetName()
		IniFile:SetValueI(WorldName, "SetTime", g_WorldStuckTime[WorldName] or -1)
		IniFile:SetValueB(WorldName, "ShouldWeatherChange", g_WorldsWithoutWeatherChange[WorldName])
	end)
	IniFile:WriteFile(g_Plugin:GetLocalFolder() .. "/WorldInfo.ini")
end