//New pointers by Mysterion_06_ & code remodification by Ero

state("DyingLightGame")
{
	int start : "gamedll_x64_rwdi.dll", 0x1CF8050;
	int loading: "rd3d11_x64_rwdi.dll", 0x7E048;
}

start
{
	return old.start != 2 && current.start == 2;
}

isLoading
{
	return current.loading == 240;
}

