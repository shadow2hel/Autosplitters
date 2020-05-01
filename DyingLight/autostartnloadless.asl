state("DyingLightGame")
{
	int start : "gamedll_x64_rwdi.dll", 0x1D7AF20;
	int loading: "rd3d11_x64_rwdi.dll", 0x7D108; // Thanks to Mr.Brood for this one.
}

update
{
	vars.isLoading = false;	
	vars.isLoading = (current.loading == 240) ? true : false;
}

start
{
	return old.start == 3 && (old.start != current.start);
}

isLoading
{
	return vars.isLoading;
}

