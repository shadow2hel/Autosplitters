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

    vars.mode            = "solo";
    vars.modeLocked      = false;
    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
}

init
{
    vars.mode            = "solo";
    vars.modeLocked      = false;
    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
}

update
{
    // playersCount pointer chain is only valid for 1.55 — skip entirely on 1.47
    if (!settings["v155"])
        return;

    int realPlayers = current.playersCount + 1;

    // Track the highest player count seen
    if (realPlayers >= 1 && realPlayers <= 4)
    {
        if (realPlayers > vars.maxPlayersSeen)
            vars.maxPlayersSeen = realPlayers;
    }

    // Determine mode (before run starts)
    if (!vars.modeLocked)
    {
        if (settings["forceSolo"])
            vars.mode = "solo";
        else if (settings["forceCoop"])
            vars.mode = "coop";
        else // auto
            vars.mode = (vars.maxPlayersSeen >= 2) ? "coop" : "solo";
    }

    // Determine expected player count for coop
    if (vars.mode == "coop")
    {
        if      (settings["p2"]) vars.expectedPlayers = 2;
        else if (settings["p3"]) vars.expectedPlayers = 3;
        else if (settings["p4"]) vars.expectedPlayers = 4;
        else                     vars.expectedPlayers = vars.maxPlayersSeen;
    }
}

start
{
    if (settings["v147"])
        return current.start_147 == 2 && old.start_147 != current.start_147;

    // 1.55
    bool started = old.start_155 != 2 && current.start_155 == 2;
    if (started)
        vars.modeLocked = true;
    return started;
}

isLoading
{
    if (settings["v147"])
        return current.loading_147 == 240;

    // 1.55
    if (vars.mode == "solo")
        return current.loading_155 == 240;

    if (vars.mode == "coop")
        return (current.playersCount + 1) < vars.expectedPlayers;

    return false;
}

exit
{
    vars.mode            = "solo";
    vars.modeLocked      = false;
    vars.maxPlayersSeen  = 1;
    vars.expectedPlayers = 1;
}
