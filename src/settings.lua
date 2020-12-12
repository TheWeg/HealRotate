local Addon = select(1, ...)

local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local L = HealRotate.L

function HealRotate:CreateConfig()

	local function get(info)
		return HealRotate.db.profile[info[#info]]
	end

	local function set(info, value)
		HealRotate.db.profile[info[#info]] = value
        HealRotate:applySettings()
	end

	local options = {
		name = "HealRotate",
		type = "group",
		get = get,
		set = set,
		icon = "",
		args = {
            general = {
                name = L['SETTING_GENERAL'],
                type = "group",
                order = 1,
                args = {
					descriptionText = {
						name = "HealRotate v" .. HealRotate.version .. " by Slivo-Sulfuron\n",
						type = "description",
						width = "full",
						order = 1,
					},
					repoLink = {
						name = L['SETTING_GENERAL_REPORT'] .. " https://github.com/Slivo-fr/HealRotate\n",
						type = "description",
						width = "full",
						order = 2,
					},
                    -- @todo : find a way to space widget properly
					spacer3 = {
						name = ' ',
						type = "description",
						width = "full",
						order = 3,
					},
					baseVersion = {
						name = L['SETTING_GENERAL_DESC'],
						type = "description",
						width = "full",
						order = 4,
					},
                    -- @todo : find a way to space widget properly
					spacer4 = {
						name = ' ',
						type = "description",
						width = "full",
						order = 5,
					},
                    lock = {
                        name = L["LOCK_WINDOW"],
                        desc = L["LOCK_WINDOW_DESC"],
                        type = "toggle",
                        order = 6,
                        width = "double",
                    },
                    hideNotInRaid = {
                        name = L["HIDE_WINDOW_NOT_IN_RAID"],
                        desc = L["HIDE_WINDOW_NOT_IN_RAID_DESC"],
                        type = "toggle",
                        order = 7,
                        width = "double",
                    },
                    doNotShowWindowOnRaidJoin = {
                        name = L["DO_NOT_SHOW_WHEN_JOINING_RAID"],
                        desc = L["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"],
                        type = "toggle",
                        order = 8,
                        width = "full",
                    },
                    showWindowWhenTargetingBoss = {
                        name = L["SHOW_WHEN_TARGETING_BOSS"],
                        desc = L["SHOW_WHEN_TARGETING_BOSS_DESC"],
                        type = "toggle",
                        order = 9,
                        width = "full",
                    },
                    testHeader = {
                        name = L["TEST_MODE_HEADER"],
                        type = "header",
                        order = 10,
                    },
                    ToggleArcaneShotTestingDesc = {
                        name = L['ENABLE_ARCANE_SHOT_TESTING_DESC'],
                        type = "description",
                        width = "full",
                        order = 11,
                    },
                    spacer12 = {
                        name = ' ',
                        type = "description",
                        width = "full",
                        order = 12,
                    },
                    ToggleArcaneShotTesting = {
                        name = L["ENABLE_ARCANE_SHOT_TESTING"],
                        type = "execute",
                        order = 13,
                        func = function() HealRotate.toggleArcaneShotTesting() end
                    }
                }
            },
            announces = {
                name = L['SETTING_ANNOUNCES'],
                type = "group",
                order = 2,
                args = {
                    enableAnnounces = {
                        name = L["ENABLE_ANNOUNCES"],
                        desc = L["ENABLE_ANNOUNCES_DESC"],
                        type = "toggle",
                        order = 1,
                        width = "double",
                    },
                    announceHeader = {
                        name = L["ANNOUNCES_MESSAGE_HEADER"],
                        type = "header",
                        order = 20,
                    },
                    channelType = {
                        name = L["MESSAGE_CHANNEL_TYPE"],
                        desc = L["MESSAGE_CHANNEL_TYPE_DESC"],
                        type = "select",
                        order = 21,
                        values = {
                            ["RAID_WARNING"] = L["CHANNEL_RAID_WARNING"],
                            ["SAY"] = L["CHANNEL_SAY"],
                            ["YELL"] = L["CHANNEL_YELL"],
                            ["PARTY"] = L["CHANNEL_PARTY"],
                            ["RAID"] = L["CHANNEL_RAID"]
                        },
                    },
                    spacer22 = {
                        name = ' ',
                        type = "description",
                        width = "normal",
                        order = 22,
                    },
                    announceStartMessage = {
                        name = L["SUCCESS_MESSAGE_LABEL"],
                        type = "input",
                        order = 23,
                        width = "double",
                    },
                    announceStopMessage = {
                        name = L["STOP_MESSAGE_LABEL"],
                        type = "input",
                        order = 24,
                        width = "double",
                    },
                    announceFailMessage = {
                        name = L["FAIL_MESSAGE_LABEL"],
                        type = "input",
                        order = 25,
                        width = "double",
                    },
                    whisperFailMessage = {
                        name = L["FAIL_WHISPER_LABEL"],
                        type = "input",
                        order = 26,
                        width = "double",
                    },
                    setupBroadcastHeader = {
                        name = L["BROADCAST_MESSAGE_HEADER"],
                        type = "header",
                        order = 30,
                    },
                    rotationReportChannelType = {
                        name = L["MESSAGE_CHANNEL_TYPE"],
                        type = "select",
                        order = 31,
                        values = {
                            ["CHANNEL"] = L["CHANNEL_CHANNEL"],
                            ["RAID_WARNING"] = L["CHANNEL_RAID_WARNING"],
                            ["SAY"] = L["CHANNEL_SAY"],
                            ["YELL"] = L["CHANNEL_YELL"],
                            ["PARTY"] = L["CHANNEL_PARTY"],
                            ["RAID"] = L["CHANNEL_RAID"]
                        },
                        set = function(info, value) set(info,value) LibStub("AceConfigRegistry-3.0", true):NotifyChange("HealRotate") end
                    },
                    setupBroadcastTargetChannel = {
                        name = L["MESSAGE_CHANNEL_NAME"],
                        desc = L["MESSAGE_CHANNEL_NAME_DESC"],
                        type = "input",
                        order = 32,
                        hidden = function() return not (HealRotate.db.profile.rotationReportChannelType == "CHANNEL") end,
                    },
                    useMultilineRotationReport = {
                        name = L["USE_MULTILINE_ROTATION_REPORT"],
                        desc = L["USE_MULTILINE_ROTATION_REPORT_DESC"],
                        type = "toggle",
                        order = 40,
                        width = "full",
                    },
                }
            },
            sounds = {
                name = L['SETTING_SOUNDS'],
                type = "group",
                order = 3,
                args = {
                    enableNextToHealSound = {
                        name = L["ENABLE_NEXT_TO_HEAL_SOUND"],
                        desc = L["ENABLE_NEXT_TO_HEAL_SOUND"],
                        type = "toggle",
                        order = 1,
                        width = "full",
                    },
                    enableHealNowSound = {
                        name = L["ENABLE_HEAL_NOW_SOUND"],
                        desc = L["ENABLE_HEAL_NOW_SOUND"],
                        type = "toggle",
                        order = 2,
                        width = "full",
                    },
                    healNowSound = {
                        name = L["HEAL_NOW_SOUND_CHOICE"],
                        desc = L["HEAL_NOW_SOUND_CHOICE"],
                        type = "select",
                        style = "dropdown",
                        order = 3,
                        values = HealRotate.constants.healNowSounds,
                        set = function(info, value)
                            set(info, value)
                            PlaySoundFile(HealRotate.constants.sounds.alarms[value])
                        end
                    },
                    baseVersion = {
                        name = L['DBM_SOUND_WARNING'],
                        type = "description",
                        width = "full",
                        order = 4,
                    },
                }
            }
        }
	}

    AceConfigRegistry:RegisterOptionsTable(Addon, options, true)
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)

    AceConfigDialog:AddToBlizOptions(Addon, nil, nil, "general")
    AceConfigDialog:AddToBlizOptions(Addon, L['SETTING_ANNOUNCES'], Addon, "announces")
    AceConfigDialog:AddToBlizOptions(Addon, L["SETTING_PROFILES"], Addon, "profile")

    AceConfigDialog:SetDefaultSize(Addon, 895, 570)

end

