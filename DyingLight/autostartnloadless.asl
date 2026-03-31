state("DyingLightGame")
{
    // --- 1.47 ---
    int start_147   : "gamedll_x64_rwdi.dll", 0x1D9CF40;
    int loading_147 : "rd3d11_x64_rwdi.dll",  0x7D108;

    // --- 1.55 ---
    int start_155    : "gamedll_x64_rwdi.dll", 0x1CF8050;
    int loading_155  : "rd3d11_x64_rwdi.dll",  0x7E048;
    int playersCount : "gamedll_x64_rwdi.dll", 0x1C15318, 0x540, 0x48, 0x9C8;
}

startup
{
    refreshRate = 120;

    settings.Add("version", true,  "Game Version");
    settings.Add("v147",    true,  "1.47", "version");
    settings.Add("v155",    false, "1.55", "version");

    settings.Add("auto",      true,  "Auto Detect (recommended)", "v155");
    settings.Add("forceSolo", false, "Force Solo",                "v155");
    settings.Add("forceCoop", false, "Force Coop",                "v155");

    settings.Add("p2", false, "2 Players", "forceCoop");
    settings.Add("p3", false, "3 Players", "forceCoop");
    settings.Add("p4", false, "4 Players", "forceCoop");

    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
    print("current level is ");
}

init
{
    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
}

update
{
    if (settings["v155"])
    {
        int realPlayers = current.playersCount + 1;

        // Track the highest player count seen
        if (realPlayers >= 1 && realPlayers <= 4)
        {
            if (realPlayers > vars.maxPlayersSeen)
                vars.maxPlayersSeen = realPlayers;
        }

        // Expected player count for coop
        if      (settings["p2"]) vars.expectedPlayers = 2;
        else if (settings["p3"]) vars.expectedPlayers = 3;
        else if (settings["p4"]) vars.expectedPlayers = 4;
        else                     vars.expectedPlayers = vars.maxPlayersSeen;
        
    }
}

onStart{
    vars.maxPlayersSeen = current.playersCount;
}

start
{
    if (settings["v147"])
        return current.start_147 == 2 && old.start_147 != current.start_147;

    // 1.55
    return old.start_155 != 2 && current.start_155 == 2;
}

isLoading
{
    if (settings["v147"])
        return current.loading_147 == 240;

    // 1.55 solo
    if (settings["forceSolo"] || (!settings["forceCoop"] && vars.maxPlayersSeen < 2))
        return current.loading_155 == 240;

    // 1.55 coop
    return current.loading_155 == 240 || (current.playersCount + 1) < vars.expectedPlayers;

    // 1.55 auto
    if (vars.maxPlayersSeen >= 2)
        return current.loading_155 == 240 || (current.playersCount + 1) < vars.maxPlayersSeen;
    else
        return current.loading_155 == 240;
}

exit
{
    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
}

onReset 
{
    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
}
