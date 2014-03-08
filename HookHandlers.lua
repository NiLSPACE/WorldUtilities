
-- This file implements the hook handlers.





function OnWeatherChanging(a_World, a_Weather)
	local WorldName = a_World:GetName()
	
	if (g_WorldsWithoutWeatherChange[WorldName] and not g_WorldExeption[WorldName]) then
		return true, a_World:GetWeather()
	end
	
	g_WorldExeption[WorldName] = false
end





function OnWorldTick(a_World)
	local WorldName = a_World:GetName()
	
	-- The time isn't even set so don't even bother.
	if (not g_WorldStuckTime[WorldName] or g_WorldStuckTime[WorldName] < 0) then
		return false
	end
	
	if (g_WorldSetTimeCountdown[WorldName] >= 0) then
		g_WorldSetTimeCountdown[WorldName] = g_WorldSetTimeCountdown[WorldName] - 1
	else
		a_World:SetTimeOfDay(g_WorldStuckTime[WorldName])
		g_WorldSetTimeCountdown[WorldName] = 20
	end
end