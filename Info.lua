
-- Info.lua

-- Implements the g_PluginInfo standard plugin description.

g_PluginInfo =
{
	Name = "WorldUtilities",
	Version = 1,
	Date = "2014-3-8",
	SourceLocation = "",
	Description = [[
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
					HelpString = "",
					Permission = "WorldUtilities.weather",
					Handler = HandleWeatherCommand,
				},
				time =
				{
					HelpString = "",
					Permission = "WorldUtilities.time",
					Handler = HandleTimeCommand,
				},
			},
		},
	},
}




