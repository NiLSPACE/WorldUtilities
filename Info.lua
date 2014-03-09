
-- Info.lua

-- Implements the g_PluginInfo standard plugin description.

g_PluginInfo =
{
	Name = "WorldUtilities",
	Version = 1,
	Date = "2014-3-8",
	SourceLocation = "https://github.com/STRWarrior/WorldUtilities",
	Description = [[
	A plugin that allows you to manage the weather and time in your world.
	]],
	
	Commands =
	{
		["/wu"] =
		{
			Permission = "",
			Handler = nil,
			HelpString = "",
			Subcommands =
			{
				weather =
				{
					HelpString = "The command that manages the weather. As parameters it has: Set, Stop, Start and Change.",
					Permission = "WorldUtilities.weather",
					Handler = HandleWeatherCommand,
					ParameterCombinations =
					{
						{
							Params = "Set [Weather] <Is Permanent|true>",
							Help = "Allows you to set the weather in the world. This can be: Sun, Rain and Storm.",
						},
						{
							Params = "stop",
							Help = "Stops any change in the weather exept when the weather is changed manualy using this plugin.",
						},
						{
							Params = "start",
							Help = "Allows the weather to change again on it's own.",
						},
						{
							Params = "change",
							Help = "Changes the weather. Sun => Rain or Rain => Sun",
						},
					}, -- ParameterCombinations
				}, -- ["weater"]
				time =
				{
					HelpString = "The command that manages the time. As parameters it has: Set, Stop and Start.",
					Permission = "WorldUtilities.time",
					Handler = HandleTimeCommand,
					ParameterCombinations =
					{
						{
							Params = "Set [Time] <Is Permanent|true>",
							Help = "Allows you to set the time in the world. This can be: Day, Night or <Number>",
						},
						{
							Params = "stop",
							Help = "Stops the time cycle.",
						},
						{
							Params = "start",
							Help = "Allows the time to cycle again on it's own.",
						},
					}, -- ParameterCombinations
				}, -- ["time"]
			}, -- Subcommands
		}, -- ["/wu"]
		
		["/time"] =
		{
			Permission = "WorldUtilities.time",
			Handler = HandleTimeCommand,
			HelpString = "The command that manages the time. As parameters it has: Set, Stop and Start.",
			ParameterCombinations =
			{
				{
					Params = "Set [Time] <Is Permanent|true>",
					Help = "Allows you to set the time in the world. This can be: Day, Night or <Number>",
				},
				{
					Params = "stop",
					Help = "Stops the time cycle.",
				},
				{
					Params = "start",
					Help = "Allows the time to cycle again on it's own.",
				},
			}, -- ParameterCombinations
		}, -- ["/time"]
		
		["/weather"] =
		{
			Permission = "WorldUtilities.weather",
			Handler = HandleWeatherCommand,
			HelpString = "The command that manages the weather. As parameters it has: Set, Stop, Start and Change.",
			ParameterCombinations =
			{
				{
					Params = "Set [Weather] <Is Permanent|true>",
					Help = "Allows you to set the weather in the world. This can be: Sun, Rain and Storm.",
				},
				{
					Params = "stop",
					Help = "Stops any change in the weather exept when the weather is changed manualy using this plugin.",
				},
				{
					Params = "start",
					Help = "Allows the weather to change again on it's own.",
				},
				{
					Params = "change",
					Help = "Changes the weather. Sun => Rain or Rain => Sun",
				},
			}, -- ParameterCombinations
		}, -- ["/weather"]
	}, -- Commands
	
	Permissions =
	{
		["WorldUtilities.time"] =
		{
			Description = "This permission allows a player to manage the time in the world he's standing in.",
			RecommendedGroups = "admins, mods",
		}, -- time permission
		
		["WorldUtilities.weather"] =
		{
			Description = "This permission allows a player to manage the weather in the world he's standing in.",
			RecommendedGroups = "admins, mods",
		}, -- weather permission
	}, -- Permissions
}




