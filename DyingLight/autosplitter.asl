state("DyingLightGame")
{
	int progression : "gamedll_x64_rwdi.dll", 0x1D69420;
	int qte : "gamedll_x64_rwdi.dll", 0x1C679D0, 0x780, 0xB98, 0xB8;
}

startup
{
	int split = 0;
	int[] splits = { 73, 75, 78, 93, 105, 110, 116, 
	120, 126, 127, 138, 144, 149, 163, 165, 166, 174, 175, 201, 
	203, 213, 214, 215, 216, 219, 222, 225, 236, 304, 319, 324, 
	330, 346, 347, 348, 364, 365, 382, 389, 399, 400 
	};
	
	int endQteCompleted = 0;
	bool used = false;
		
	vars.splits = splits;
	vars.split = split;
	vars.endQteCompleted = endQteCompleted;
	vars.used = used;
}

split
{
	if(vars.split < vars.splits.Length){
		if(current.progression == vars.splits[vars.split]){
			vars.split++;
			return true;
		}
	} else if(vars.split == vars.splits.Length){
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

