state("DyingLightGame")
{
	//int qte : "gamedll_x64_rwdi.dll", 0x1C6B9E0, 0x780, 0xB98, 0xB8;
	int loading : "rd3d11_x64_rwdi.dll", 0x7D108; // Thanks to Mr.Brood for this one.
}

update
{
	vars.StoryWatch.Update(game);
	if(!vars.baseFound){
		if(vars.StoryWatch.Changed){
			int checkpointBase = vars.StoryWatch.Current;
			// Check for DLC (30 is no DLC, anything else is)
			if(vars.StoryWatch.Current == 30){
				SortedList<int, string> checkpoints = new SortedList<int, string>(){
					{checkpointBase += 18, "Quartermaster & Zere"}, // + 18
					{checkpointBase += 27, "First Assignment"}, // + 27
					{checkpointBase += 3, "Call GRE"}, // + 3
					{checkpointBase += 15, "Brecken's Booboo"}, // + 15
					{checkpointBase += 12, "Empty airdrop"}, // + 12
					{checkpointBase += 5, "Real airdrop"}, // + 5
					{checkpointBase += 6, "Return to hot babe"}, // + 6
					{checkpointBase += 4, "Talk to bff"}, // + 4
					{checkpointBase += 6, "Radio tower 1"}, // + 6
					{checkpointBase += 1, "Radio tower 2 and Karim"}, // + 1
					{checkpointBase += 11, "Jaffar and Gursel"}, // + 11
					{checkpointBase += 6, "Fishermen village"}, // + 6
					{checkpointBase += 5, "Karim's love letter"}, // + 5
					{checkpointBase += 14, "RUSH B BLYAT"}, // + 14
					{checkpointBase += 2, "Beg for antizin"}, // + 2
					{checkpointBase += 1, "School shooter"}, // + 1
					{checkpointBase += 8, "Show Rahim your explosives"}, // + 8
					{checkpointBase += 1, "Hunt Green Goblin"}, // + 1
					{checkpointBase += 26, "Explosive business"}, // + 26
					{checkpointBase += 2, "Fix Rahim's mess"}, // + 2
					{checkpointBase += 10, "Rais' Garrison"}, // + 10
					{checkpointBase += 1, "Get to parking lot"}, // + 1
					{checkpointBase += 1, "Cut Rais' hand off"}, // + 1
					{checkpointBase += 1, "Run from Pirate Rais"}, // + 1
					{checkpointBase += 3, "Go to Saviours"}, // + 3
					{checkpointBase += 3, "Get to the tunnel"}, // + 3
					{checkpointBase += 3, "Run to Old Town"}, // + 3
					{checkpointBase += 11, "Get to Troy"}, // + 11
					{checkpointBase += 68, "Go to University"}, // + 68
					{checkpointBase += 15, "Get to sewers1"}, // + 15
					{checkpointBase += 5, "Meet chicken shit Michael"}, // + 5
					{checkpointBase += 6, "Smiley Face"}, // + 6
					{checkpointBase += 16, "Museum Curator"}, // + 16
					{checkpointBase += 1, "History Parkour"}, // + 1
					{checkpointBase += 17, "Zombie LSD"}, // + 17
					{checkpointBase += 1, "Get to sewers2"}, // + 1
					{checkpointBase += 17, "It's radio time"}, // + 17
					{checkpointBase += 7, "Run to Camden's Clinic"}, // + 7
					{checkpointBase += 10, "Camden's Dungeon"}, // + 10
					{checkpointBase += 1, "No Loose Ends"}, // + 1	
				};
				vars.checkpoints = checkpoints;
				vars.baseFound = true;
			} else if(vars.StoryWatch.Current > 30) {
				SortedList<int, string> checkpoints = new SortedList<int, string>(){
					{checkpointBase += 18, "Quartermaster & Zere"}, // + 18
					{checkpointBase += 27, "First Assignment"}, // + 27
					{checkpointBase += 4, "Call GRE"}, // + 4
					{checkpointBase += 15, "Brecken's Booboo"}, // + 15
					{checkpointBase += 12, "Empty airdrop"}, // + 12
					{checkpointBase += 5, "Real airdrop"}, // + 5
					{checkpointBase += 6, "Return to hot babe"}, // + 6
					{checkpointBase += 4, "Talk to bff"}, // + 4
					{checkpointBase += 6, "Radio tower 1"}, // + 6
					{checkpointBase += 1, "Radio tower 2 and Karim"}, // + 1
					{checkpointBase += 11, "Jaffar and Gursel"}, // + 11
					{checkpointBase += 6, "Fishermen village"}, // + 6
					{checkpointBase += 5, "Karim's love letter"}, // + 5
					{checkpointBase += 14, "RUSH B BLYAT"}, // + 14
					{checkpointBase += 2, "Beg for antizin"}, // + 2
					{checkpointBase += 1, "School shooter"}, // + 1
					{checkpointBase += 8, "Show Rahim your explosives"}, // + 8
					{checkpointBase += 1, "Hunt Green Goblin"}, // + 1
					{checkpointBase += 26, "Explosive business"}, // + 26
					{checkpointBase += 2, "Fix Rahim's mess"}, // + 2
					{checkpointBase += 10, "Rais' Garrison"}, // + 10
					{checkpointBase += 1, "Get to parking lot"}, // + 1
					{checkpointBase += 1, "Cut Rais' hand off"}, // + 1
					{checkpointBase += 1, "Run from Pirate Rais"}, // + 1
					{checkpointBase += 3, "Go to Saviours"}, // + 3
					{checkpointBase += 3, "Get to the tunnel"}, // + 3
					{checkpointBase += 3, "Run to Old Town"}, // + 3
					{checkpointBase += 11, "Get to Troy"}, // + 11
					{checkpointBase += 69, "Go to University"}, // + 68
					{checkpointBase += 15, "Get to sewers1"}, // + 15
					{checkpointBase += 5, "Meet chicken shit Michael"}, // + 5
					{checkpointBase += 6, "Smiley Face"}, // + 6
					{checkpointBase += 16, "Museum Curator"}, // + 16
					{checkpointBase += 1, "History Parkour"}, // + 1
					{checkpointBase += 17, "Zombie LSD"}, // + 17
					{checkpointBase += 1, "Get to sewers2"}, // + 1
					{checkpointBase += 17, "It's radio time"}, // + 17
					{checkpointBase += 6, "Run to Camden's Clinic"}, // + 7
					{checkpointBase += 1, "Camden's Dungeon"}, // + 9
					{checkpointBase += 10, "No Loose Ends"}, // + 1	
				};
				
				SortedList<string, int> exceptions = new SortedList<string, int>(){
					{checkpoints.Values[checkpoints.Count - 7], 9}, // History Parkour
					{checkpoints.Values[checkpoints.Count - 6], 10}, // Zombie LSD
					{checkpoints.Values[checkpoints.Count - 5], 10},
					{checkpoints.Values[checkpoints.Count - 4], 10},
					{checkpoints.Values[checkpoints.Count - 3], 10},
					{checkpoints.Values[checkpoints.Count - 2], 10},
					{checkpoints.Values[checkpoints.Count - 1], 10},
				};
				
				vars.checkpoints = checkpoints;
				vars.exceptions = exceptions;
				vars.baseFound = true;
				using (System.IO.StreamWriter sw = File.AppendText(vars.dlFolder + "ExpectedProgressions.txt")){
					foreach(KeyValuePair<int, string> checkpoint in checkpoints){
						sw.WriteLine(checkpoint.Key + " -- " + checkpoint.Value);
					}
				}
			}
		}
	}
	
	/*if((old.qte == 1 || old.qte == 2) && current.qte == 0){
		vars.used = false;
	}*/
}

init
{
	vars.isPaused = (Func<bool>)(() => {
		return current.loading == 240;
	});
	/*vars.EndSplit = (Func<bool>)(() =>
	{
		if(vars.endQteCompleted < 1 && current.qte == 1){
			vars.endQteCompleted = 1;
			vars.used = true;
		} else if(vars.endQteCompleted > 0 && !vars.used){
			if(current.qte == 1){
				vars.endQteCompleted = vars.endQteCompleted + 1;
				vars.used = true;
			} else if(vars.isPaused() || current.qte == 2){
				if(vars.endQteCompleted < 3){
					vars.endQteCompleted = 1;
				} else if(vars.endQteCompleted > 3 && vars.endQteCompleted < 6){
					vars.endQteCompleted = 2;
				}
			}
		}
		
		return vars.endQteCompleted == 8;
	});*/
	
	// PROGRESSION ADDRESS
	vars.StoryWatch = new MemoryWatcher<int>(new DeepPointer("gamedll_x64_rwdi.dll", 0x1D9CFA0)); 

	vars.PrintProgression = (Action)(() =>
	{
		using (System.IO.StreamWriter sw = File.AppendText(vars.dlFolder + "progressions.txt"))
		{
			if(vars.pastCheckpoints.Count > 0){
				sw.WriteLine("" + vars.StoryWatch.Current + " -- " + ((SortedList<int,string>)(vars.checkpoints)).Values[vars.pastCheckpoints.Count - 1]);
			} else {
				sw.WriteLine("" + vars.StoryWatch.Current + " -- " + ((SortedList<int,string>)(vars.checkpoints)).Values[vars.pastCheckpoints.Count]);
			}
		}
	});
	
	vars.HasProgressed = (Func<int, KeyValuePair<int, string>, bool>)((int currentProgression, KeyValuePair<int, string> expectedProgression) =>
	{
		SortedList<string, int> exceptions = vars.exceptions;
		if(exceptions.ContainsKey(expectedProgression.Value)){
			if((currentProgression == expectedProgression.Key) || (currentProgression == expectedProgression.Key + exceptions[expectedProgression.Value])){
				return true;
			} else {
				return false;
			}
		} else if(currentProgression == expectedProgression.Key){
			return true;
		} else {
			return false;
		}
	});
	
	int amntCheckpoints = 0;
	foreach(string split in vars.splits){
		if(settings[split]){
			amntCheckpoints++;
		}
	}

	vars.amntCheckpoints = amntCheckpoints;
}

startup
{
	settings.Add("checkpoints", true, "---Splits---");
	vars.splits = new string[]{
		"Quartermaster & Zere",
		"First Assignment",
		"Call GRE",
		"Brecken's Booboo",
		"Empty airdrop",
		"Real airdrop",
		"Return to hot babe",
		"Talk to bff",
		"Radio tower 1",
		"Radio tower 2 and Karim",
		"Jaffar and Gursel",
		"Fishermen village",
		"Karim's love letter",
		"RUSH B BLYAT",
		"Beg for antizin",
		"School shooter",
		"Show Rahim your explosives",
		"Hunt Green Goblin",
		"Explosive business",
		"Fix Rahim's mess",
		"Rais' Garrison",
		"Get to parking lot",
		"Cut Rais' hand off",
		"Run from Pirate Rais",
		"Go to Saviours",
		"Get to the tunnel",
		"Run to Old Town",
		"Get to Troy",
		"Go to University",
		"Get to sewers1",
		"Meet chicken shit Michael",
		"Smiley Face",
		"Museum Curator",
		"History Parkour",
		"Zombie LSD",
		"Get to sewers2",
		"It's radio time",
		"Run to Camden's Clinic",
		"Camden's Dungeon",
		"No Loose Ends",
	};
	
	foreach(string split in vars.splits){
		settings.Add(split, true, split, "checkpoints");
	}
	
	vars.endQteCompleted = 0;
	vars.used = false;
	vars.baseFound = false;
	vars.split = 0;
	vars.pastCheckpoints = new HashSet<string>();
	vars.exceptions = new SortedList<string, int>();
	string aboveRoot = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), @"..\"));
	vars.dlFolder = Path.GetFullPath(Path.Combine(aboveRoot, @"dlProgression\"));
	if(!Directory.Exists(vars.dlFolder)){
		Directory.CreateDirectory(vars.dlFolder);
	}
	
	vars.timer_OnStart = (EventHandler)((s, e) =>
    {
		using (System.IO.StreamWriter sw = File.AppendText(vars.dlFolder + "progressions.txt"))
		{
			sw.WriteLine("------ START (" + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + ") ------");
		}
		using (System.IO.StreamWriter sw = File.AppendText(vars.dlFolder + "ExpectedProgressions.txt")){
			sw.WriteLine("------ START (" + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + ") ------");
			foreach(KeyValuePair<int, string> checkpoint in vars.checkpoints){
				sw.WriteLine(checkpoint.Key + " -- " + checkpoint.Value);
			}
		}
    });
	timer.OnStart += vars.timer_OnStart;
	
	vars.timer_OnReset = (LiveSplit.Model.Input.EventHandlerT<TimerPhase>)((s, e) =>
    {
        vars.endQteCompleted = 0;
		vars.used = false;
		vars.baseFound = false;
		vars.split = 0;
		vars.checkpoints = null;
		vars.exceptions.Clear();
		vars.pastCheckpoints.Clear();
		using (System.IO.StreamWriter sw = File.AppendText(vars.dlFolder + "progressions.txt"))
		{
			sw.WriteLine("------ END OF RUN ------" + System.Environment.NewLine);
		}
		using (System.IO.StreamWriter sw = File.AppendText(vars.dlFolder + "ExpectedProgressions.txt")){
			sw.WriteLine("------ END OF RUN ------" + System.Environment.NewLine);
		}
    });
    timer.OnReset += vars.timer_OnReset;
}

split
{	
	if(vars.baseFound && vars.checkpoints != null){
		SortedList<int, string> checkpoints = vars.checkpoints;

		if(vars.pastCheckpoints.Count < vars.amntCheckpoints){
			foreach(var checkpoint in checkpoints){
				if(settings[checkpoint.Value] && vars.HasProgressed(vars.StoryWatch.Current, checkpoint) && !vars.pastCheckpoints.Contains(checkpoint.Value)){
					vars.pastCheckpoints.Add(checkpoint.Value);
					vars.PrintProgression();
					return true;
				}
			}
			
			if(vars.StoryWatch.Current != 0 && vars.StoryWatch.Changed){
				vars.PrintProgression();
			}
		}
		/*else {
			return vars.EndSplit();
		}*/
	}
}

shutdown
{
	timer.OnReset -= vars.timer_OnReset;
	timer.OnStart -= vars.timer_OnStart;
}