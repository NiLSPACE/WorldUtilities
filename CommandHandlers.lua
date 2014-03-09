
-- Implements the command handlers





function HandleWeatherCommand(a_Split, a_Player)
	-- /wu weather [set/stop/start/change]
	
	-- Check if the /wu was used or /weather. If /weather was used we have to move all the parameters up by one.
	if (a_Split[1] ~= "/wu") then
		for I=#a_Split + 1, 1, -1 do
			a_Split[I] = a_Split[I - 1]
		end
	end
	
	-- The player didn't give enough parameters.
	if (#a_Split < 3) then
		a_Player:SendMessage(cChatColor.Rose .. "Not enough parameters.")
		a_Player:SendMessage(cChatColor.Rose .. " Usage:")
		a_Player:SendMessage(cChatColor.Rose .. " /wu weather set <weather> [Permanent|true/false]")
		a_Player:SendMessage(cChatColor.Rose .. " /wu weather stop")
		a_Player:SendMessage(cChatColor.Rose .. " /wu weather start")
		a_Player:SendMessage(cChatColor.Rose .. " /wu weather change")
		return true
	end
	
	local World = a_Player:GetWorld()
	local WorldName = World:GetName()
	local Operation = a_Split[3]:upper()
	
	if (Operation == "STOP") then
		g_WorldsWithoutWeatherChange[WorldName] = true
		a_Player:SendMessage(cChatColor.Green .. "You stopped the weather in your current world.")
	elseif (Operation == "START") then
		g_WorldsWithoutWeatherChange[WorldName] = false
		a_Player:SendMessage(cChatColor.Green .. "You started the weather in your current world.")
	elseif (Operation == "SET") then
		if (a_Split[4] == nil) then
			a_Player:SendMessage(cChatColor.Rose .. "No new weather given.")
			return true
		end
		
		local ToSetWeather = -1
		local NewWeather = a_Split[4]:upper()
		
		-- Check if the weather is valid
		if (NewWeather == "SUN") then
			ToSetWeather = wSunny
		elseif (NewWeather == "RAIN") then
			ToSetWeather = wRain
		elseif (NewWeather == "STORM") then
			ToSetWeather = wStorm
		else
			a_Player:SendMessage(cChatColor.Rose .. "Unknown weather. You can use Sun, Rain and Storm")
			return true
		end
		
		local Permanent = (a_Split[5] or "false"):upper()
		if (Permanent == "TRUE") then
			g_WorldsWithoutWeatherChange[WorldName] = true
		elseif (Permanent == "FALSE") then
			g_WorldsWithoutWeatherChange[WorldName] = false
		end
		
		if g_WorldsWithoutWeatherChange[WorldName] then
			g_WorldExeption[WorldName] = true
		end
		
		World:SetWeather(ToSetWeather)
		a_Player:SendMessage(cChatColor.Green .. "Weather changed to " .. a_Split[4])
	elseif (Operation == "CHANGE") then
		World:ChangeWeather()
		a_Player:SendMessage(cChatColor.Green .. "Weather swiched.")
	else
		a_Player:SendMessage(cChatColor.Rose .. "Unknown parameter " .. a_Split[3])
	end
	
	return true
end





function HandleTimeCommand(a_Split, a_Player)
	-- wu time [set/stop/start]
	
	-- Check if the /wu was used or /time. If /time was used we have to move all the parameters up by one.
	if (a_Split[1] ~= "/wu") then
		for I=#a_Split + 1, 1, -1 do
			a_Split[I] = a_Split[I - 1]
		end
	end
	
	-- The player didn't give enough parameters.
	if (#a_Split < 3) then
		a_Player:SendMessage(cChatColor.Rose .. "Not enough parameters.")
		a_Player:SendMessage(cChatColor.Rose .. " Usage:")
		a_Player:SendMessage(cChatColor.Rose .. " /wu time set <time> [Permanent|true/false]")
		a_Player:SendMessage(cChatColor.Rose .. " /wu time stop")
		a_Player:SendMessage(cChatColor.Rose .. " /wu time start")
		return true
	end
	
	local World = a_Player:GetWorld()
	local WorldName = World:GetName()
	local Operation = a_Split[3]:upper()
	
	if (Operation == "STOP") then
		g_WorldStuckTime[WorldName] = World:GetTimeOfDay()
		a_Player:SendMessage(cChatColor.Green .. "Time stopped at " .. World:GetTimeOfDay())
	elseif (Operation == "START") then
		g_WorldStuckTime[WorldName] = -1
		a_Player:SendMessage(cChatColor.Green .. "Time started.")
	elseif (Operation == "SET") then
		if (a_Split[4] == nil) then
			a_Player:SendMessage(cChatColor.Rose .. "No new time given.")
			return true
		end
		
		local NewTime = a_Split[4]:upper()
		local ToSetTime = tonumber(a_Split[4])
		
		if (NewTime == "DAY") then
			ToSetTime = 0
		elseif (NewTime == "NIGHT") then
			ToSetTime = 13187
		end
		
		if (ToSetTime == nil) then
			a_Player:SendMessage(cChatColor.Rose .. "Invalid time " .. a_Split[4])
			return true
		end
		
		World:SetTimeOfDay(ToSetTime)
		
		local Permanent = (a_Split[5] or "false"):upper()
		if (Permanent == "TRUE") then
			g_WorldStuckTime[WorldName] = ToSetTime
		elseif (Permanent == "FALSE") then
			g_WorldStuckTime[WorldName] = -1
		end
		
		a_Player:SendMessage(cChatColor.Green .. "Time set to " .. ToSetTime)
	else
		a_Player:SendMessage(cChatColor.Rose .. "Unknown parameter " .. a_Split[3])
	end
	
	return true
end
		