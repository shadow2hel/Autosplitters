state("DyingLightGame")
{
	//int progression : "gamedll_x64_rwdi.dll", 0x1D6D530;
	int qte : "gamedll_x64_rwdi.dll", 0x1C6B9D0, 0x780, 0xB98, 0xB8;
	int loading : "rd3d11_x64_rwdi.dll", 0x7D108; // Thanks to Mr.Brood for this one.
}

update
{
	vars.StoryWatch.Update(game);
	if(!vars.baseFound){
		if(vars.StoryWatch.Old == 0 && vars.StoryWatch.Changed){
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
			} else {
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
					{checkpointBase += 7, "Run to Camden's Clinic"}, // + 7
					{checkpointBase += 9, "Camden's Dungeon"}, // + 9
					{checkpointBase += 1, "No Loose Ends"}, // + 1	
				};
				vars.checkpoints = checkpoints;
				vars.baseFound = true;
			}
		}
	}
	if(timer.CurrentPhase == TimerPhase.NotRunning && vars.split > 0){
		vars.endQteCompleted = 0;
		vars.used = false;
		vars.baseFound = false;
		vars.split = 0;
		vars.checkpoints = null;
	}
	
	if((old.qte == 1 || old.qte == 2) && current.qte == 0){
		vars.used = false;
	}
}

init
{
	vars.isPaused = (Func<bool>)(() => {
		return current.loading == 240;
	});
	vars.EndSplit = (Func<bool>)(() =>
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
	});
	
	vars.StoryWatch = new MemoryWatcher<int>(new DeepPointer("gamedll_x64_rwdi.dll", 0x1D6D530));
	
}

startup
{
	vars.endQteCompleted = 0;
	vars.used = false;
	vars.baseFound = false;
	vars.split = 0;
}

split
{	
	if(vars.baseFound && vars.checkpoints != null){
		if(vars.split < vars.checkpoints.Count){
			if(vars.StoryWatch.Current == ((SortedList<int,string>)(vars.checkpoints)).Keys[vars.split]){
				vars.split++;
				return true;
			}
			
		} else {
			return vars.EndSplit();
		}
	}
}