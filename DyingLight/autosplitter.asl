state("DyingLightGame")
{
	int progression : "gamedll_x64_rwdi.dll", 0x1D69420;
	int qte : "gamedll_x64_rwdi.dll", 0x1C679D0, 0x780, 0xB98, 0xB8;
}

update
{
	if(!vars.baseFound){
		if(old.progression == 0 && (old.progression != current.progression)){
			int checkpointBase = current.progression;
			vars.baseFound = true;
			// Check for DLC (30 is no DLC, anything else is)
			if(current.progression == 30){
				int[] checkpoints = {
					checkpointBase += 18, // "Quartermaster & Zere" // + 18
					checkpointBase += 27, // "First Assignment" // + 27
					checkpointBase += 3, // "Call GRE" // + 3
					checkpointBase += 15, // "Brecken's Booboo" // + 15
					checkpointBase += 12, // "Empty airdrop" // + 12
					checkpointBase += 5, // "Real airdrop" // + 5
					checkpointBase += 6, // "Return to hot babe" // + 6
					checkpointBase += 4, // "Talk to bff" // + 4
					checkpointBase += 6, // "Radio tower 1" // + 6
					checkpointBase += 1, // "Radio tower 2 and Karim" // + 1
					checkpointBase += 11, // "Jaffar and Gursel" // + 11
					checkpointBase += 6, // "Fishermen village" // + 6
					checkpointBase += 5, // "Karim's love letter" // + 5
					checkpointBase += 14, // "RUSH B BLYAT" // + 14
					checkpointBase += 2, // "Beg for antizin" // + 2
					checkpointBase += 1, // "School shooter" // + 1
					checkpointBase += 8, // "Show Rahim your explosives" // + 8
					checkpointBase += 1, // "Hunt Green Goblin" // + 1
					checkpointBase += 26, // "Explosive business" // + 26
					checkpointBase += 2, // "Fix Rahim's mess" // + 2
					checkpointBase += 10, // "Rais' Garrison" // + 10
					checkpointBase += 1, // "Get to parking lot" // + 1
					checkpointBase += 1, // "Cut Rais' hand off" // + 1
					checkpointBase += 1, // "Run from Pirate Rais" // + 1
					checkpointBase += 3, // "Go to Saviours" // + 3
					checkpointBase += 3, // "Get to the tunnel" // + 3
					checkpointBase += 3, // "Run to Old Town" // + 3
					checkpointBase += 11, // "Get to Troy" // + 11
					checkpointBase += 68, // "Go to University" // + 68
					checkpointBase += 15, // "Get to sewers" // + 15
					checkpointBase += 5, // "Meet chicken shit Michael" // + 5
					checkpointBase += 6, // "Smiley Face" // + 6
					checkpointBase += 16, // "Museum Curator" // + 16
					checkpointBase += 1, // "History Parkour" // + 1
					checkpointBase += 17, // "Zombie LSD" // + 17
					checkpointBase += 1, // "Get to sewers" // + 1
					checkpointBase += 17, // "It's radio time" // + 17
					checkpointBase += 7, // "Run to Camden's Clinic" // + 7
					checkpointBase += 10, // "Camden's Dungeon" // + 10
					checkpointBase += 1, // "No Loose Ends" // + 1	
				};
				
				vars.checkpoints = checkpoints;
			} else {
				int[] checkpoints = {
					checkpointBase += 18, // "Quartermaster & Zere" // + 18
					checkpointBase += 27, // "First Assignment" // + 27
					checkpointBase += 4, // "Call GRE" // + 4
					checkpointBase += 15, // "Brecken's Booboo" // + 15
					checkpointBase += 12, // "Empty airdrop" // + 12
					checkpointBase += 5, // "Real airdrop" // + 5
					checkpointBase += 6, // "Return to hot babe" // + 6
					checkpointBase += 4, // "Talk to bff" // + 4
					checkpointBase += 6, // "Radio tower 1" // + 6
					checkpointBase += 1, // "Radio tower 2 and Karim" // + 1
					checkpointBase += 11, // "Jaffar and Gursel" // + 11
					checkpointBase += 6, // "Fishermen village" // + 6
					checkpointBase += 5, // "Karim's love letter" // + 5
					checkpointBase += 14, // "RUSH B BLYAT" // + 14
					checkpointBase += 2, // "Beg for antizin" // + 2
					checkpointBase += 1, // "School shooter" // + 1
					checkpointBase += 8, // "Show Rahim your explosives" // + 8
					checkpointBase += 1, // "Hunt Green Goblin" // + 1
					checkpointBase += 26, // "Explosive business" // + 26
					checkpointBase += 2, // "Fix Rahim's mess" // + 2
					checkpointBase += 10, // "Rais' Garrison" // + 10
					checkpointBase += 1, // "Get to parking lot" // + 1
					checkpointBase += 1, // "Cut Rais' hand off" // + 1
					checkpointBase += 1, // "Run from Pirate Rais" // + 1
					checkpointBase += 3, // "Go to Saviours" // + 3
					checkpointBase += 3, // "Get to the tunnel" // + 3
					checkpointBase += 3, // "Run to Old Town" // + 3
					checkpointBase += 11, // "Get to Troy" // + 11
					checkpointBase += 72, // "Go to University" // + 9
					checkpointBase += 15, // "Get to sewers" // + 15
					checkpointBase += 5, // "Meet chicken shit Michael" // + 5
					checkpointBase += 6, // "Smiley Face" // + 6
					checkpointBase += 16, // "Museum Curator" // + 16
					checkpointBase += 1, // "History Parkour" // + 1
					checkpointBase += 17, // "Zombie LSD" // + 17
					checkpointBase += 1, // "Get to sewers" // + 1
					checkpointBase += 17, // "It's radio time" // + 17
					checkpointBase += 7, // "Run to Camden's Clinic" // + 7
					checkpointBase += 9, // "Camden's Dungeon" // + 9
					checkpointBase += 1, // "No Loose Ends" // + 1	
				};
				vars.checkpoints = checkpoints;
			}
		}
	}
	if(timer.CurrentPhase == TimerPhase.NotRunning && vars.split > 0){
		vars.endQteCompleted = 0;
		vars.used = false;
		vars.baseFound = false;
		vars.anomaly = false;
		vars.split = 0;
		vars.checkpoints = null;
	}
}

startup
{
	vars.endQteCompleted = 0;
	vars.used = false;
	vars.baseFound = false;
	vars.anomaly = false;
	vars.split = 0;
}

split
{	
	if(vars.baseFound && vars.checkpoints.Length > 0){
		if(vars.split < vars.checkpoints.Length){
			if(current.progression == vars.checkpoints[vars.split]){
				vars.split++;
				return true;
			}
			
		} else {
			if(vars.endQteCompleted == 0 && current.qte == 1){
				vars.endQteCompleted = 1;
				vars.used = true;
			}
			else if(vars.endQteCompleted == 1 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 2;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 1;
				}
			}
			else if(vars.endQteCompleted == 2 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 3;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 1;
				}
			}
			else if(vars.endQteCompleted == 3 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 4;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 2;
				}
			}
			else if(vars.endQteCompleted == 4 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 5;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 2;
				}
			}
			else if(vars.endQteCompleted == 5 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 6;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 2;
				}
			}
			else if(vars.endQteCompleted == 6 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 7;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 6;
				}
			}
			else if(vars.endQteCompleted == 7 && !vars.used){
				if(current.qte == 1){
					vars.endQteCompleted = 8;
					vars.used = true;
				} else if(current.loading == 240 || current.qte == 2){
					vars.endQteCompleted = 7;
				}
			}
			
			if((old.qte == 1 || old.qte == 2) && current.qte == 0){
				vars.used = false;
			}
			
			if(vars.endQteCompleted == 8){
				return true;
			};
			
		}
	}
}