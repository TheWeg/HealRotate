local HealRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "HealRotate loaded, type /heal for options",
    ["HEAL_WINDOW_HIDDEN"] = "Healrotate window hidden. Use /heal toggle to get it back",

    -- Settings
    ["SETTING_GENERAL"] = "General",
    ["SETTING_GENERAL_REPORT"] = "Please report any issue at",
    ["SETTING_GENERAL_DESC"] = "New : HealRotate will now play a sound when you need to shoot your healshot ! There are also few more display options to make the addon less intrusive.",

    ["LOCK_WINDOW"] = "Lock window",
    ["LOCK_WINDOW_DESC"] = "Lock window",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "Hide the window when not in a raid",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "Hide the window when not in a raid",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "Do not show window when joining a raid",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "Check this if you don't want the window to show up each time you join a raid",
    ["SHOW_WHEN_TARGETING_BOSS"] = "Show window when you target a heal-able boss",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "Show window when you target a heal-able boss",
    ["WINDOW_LOCKED"] = "HealRotate: Window locked",
    ["WINDOW_UNLOCKED"] = "HealRotate: Window unlocked",

    ["TEST_MODE_HEADER"] = "Test mode",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "Toggle testing mode",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "While testing mode is enabled, arcane shot will be registered as a healshot\n" ..
        "Testing mode will last 10 minutes unless you toggle it off",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "Arcane shot testing mode enabled for 10 minutes",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "Arcane shot testing mode disabled",

    --- Announces
    ["SETTING_ANNOUNCES"] = "Announces",
    ["ENABLE_ANNOUNCES"] = "Enable announces",
    ["ENABLE_ANNOUNCES_DESC"] = "Enable / disable the announcement.",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "Announce channel",
    ["MESSAGE_CHANNEL_TYPE"] = "Send messages to",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "Channel you want to send messages",
    ["MESSAGE_CHANNEL_NAME"] = "Channel name",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "Set the name of the target channel",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "Channel",
    ["CHANNEL_RAID_WARNING"] = "Raid Warning",
    ["CHANNEL_SAY"] = "Say",
    ["CHANNEL_YELL"] = "Yell",
    ["CHANNEL_PARTY"] = "Party",
    ["CHANNEL_RAID"] = "Raid",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "Announce messages",
    ["SUCCESS_MESSAGE_LABEL"] = "Start cast announce message",
    ["SUCCESS_MESSAGE_LABEL"] = "Finish cast announce message",

    ['DEFAULT_START_ANNOUNCE_MESSAGE'] = "Starting cast of %s",
    ['DEFAULT_STOP_ANNOUNCE_MESSAGE'] = "Finished casting",

    ['HEAL_NOW_LOCAL_ALERT_MESSAGE'] = "YOU ARE NEXT ON DECK !",

    ["BROADCAST_MESSAGE_HEADER"] = "Rotation setup text broadcast",
    ["USE_MULTILINE_ROTATION_REPORT"] = "Use multiline for main rotation when reporting",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "Check this option if you want more comprehensible order display",

    --- Sounds
    ["SETTING_SOUNDS"] = "Sounds",
    ["ENABLE_NEXT_TO_HEAL_SOUND"] = "Play a sound when you are the next to shoot",
    ["ENABLE_HEAL_NOW_SOUND"] = "Play a sound when you have to shoot your heal",
    ["HEAL_NOW_SOUND_CHOICE"] = "Select the sound you want to use for the 'heal now' alert",
    ["DBM_SOUND_WARNING"] = "DBM is playing the 'flag taken' sound on each frenzy, it may prevent you from earing gentle sounds from HealRotate. I would either suggest to pick a strong sound or disable DBM frenzy sound.",

    --- Profiles
    ["SETTING_PROFILES"] = "Profiles",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "Healer healshot setup",
    ["BROADCAST_ROTATION_PREFIX"] = "Rotation",
    ["BROADCAST_BACKUP_PREFIX"] = "Backup",
}

HealRotate.L = L
