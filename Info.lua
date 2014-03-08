
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
				},
				time =
				{
					HelpString = "The command that manages the time. As parameters it has: Set, Stop and Start.",
					Permission = "WorldUtilities.time",
					Handler = HandleTimeCommand,
				},
			},
		},
	},
}




