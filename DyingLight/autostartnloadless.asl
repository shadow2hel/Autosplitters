state("DyingLightGame")
{
	int progression : "gamedll_x64_rwdi.dll", 0x1D6D540;
	int loading: "rd3d11_x64_rwdi.dll", 0x7D108; // Thanks to Mr.Brood for this one.
}

update
{
	vars.isLoading = false;	
	vars.isLoading = (current.loading == 240) ? true : false;
}

start
{
	return old.progression == 0 && (old.progression != current.progression);
}

isLoading
{
	return vars.isLoading;
}

