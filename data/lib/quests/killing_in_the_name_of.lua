--[[
TODO
Unite all related variables/functions in a table
rewrite functions like "getTasksByPlayer" to "Player.getTasks"
]]

RANK_NONE = 0
RANK_JOIN = 1
RANK_HUNTSMAN = 2
RANK_RANGER = 3
RANK_BIGGAMEHUNTER = 4
RANK_TROPHYHUNTER = 5
RANK_ELITEHUNTER = 6

REWARD_MONEY = 1
REWARD_EXP = 2
REWARD_ACHIEVEMENT = 3
REWARD_STORAGE = 4
REWARD_POINT = 5
REWARD_ITEM = 6

QUESTSTORAGE_BASE = 38500
JOIN_STOR = 38400
KILLSSTORAGE_BASE = 38600
POINTSSTORAGE = 38401
BOSS_POINTS = 38402
tasks =
{
	[1] = {
		killsRequired = 500,
		raceName = "Heroes",
		creatures = {
			"hero"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[2] = {
		killsRequired = 500,
		raceName = "Ancient Scarabs",
		creatures = {
			"ancient scarab"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[3] = {
		killsRequired = 500,
		raceName = "Minotaurs",
		creatures = {
			"minotaur",
			"minotaur guard",
			"minotaur mage"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[4] = {
		killsRequired = 500,
		raceName = "Wyrms",
		creatures = {
			"wyrm",
			"elder wyrm"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[5] = {
		killsRequired = 500,
		raceName = "Lizards",
		creatures = {
			"lizard high guard",
			"lizard legionnaire",
			"lizard dragon priest"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[6] = {
		killsRequired = 500,
		raceName = "Nightmares",
		creatures = {
			"nightmare scion",
			"nightmare"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[7] = {
		killsRequired = 500,
		raceName = "Vampire",
		creatures = {
			"vampire bride",
			"vampire viscount",
			"vampire"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[8] = {
		killsRequired = 500,
		raceName = "Frazzlemaw and Silencer Feyrist",
		creatures = {
			"weakened frazzlemaw",
			"enfeebled silencer"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[9] = {
		killsRequired = 500,
		raceName = "Glooth Bandit and Brigand",
		creatures = {
			"glooth bandit",
			"glooth brigand"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[10] = {
		killsRequired = 500,
		raceName = "Hellspawn",
		creatures = {
			"hellspawn"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[11] = {
		killsRequired = 500,
		raceName = "Hydra",
		creatures = {
			"hydra"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[12] = {
		killsRequired = 500,
		raceName = "Serpent Spawn and Medusa",
		creatures = {
			"serpent spawn",
			"medusa"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[13] = {
		killsRequired = 500,
		raceName = "Lizard Chosen",
		creatures = {
			"lizard chosen"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[14] = {
		killsRequired = 500,
		raceName = "Kollos",
		creatures = {
			"kollos",
			"spidris",
			"spidris elite"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[15] = {
		killsRequired = 500,
		raceName = "Ravenous Lava Lurker",
		creatures = {
			"ravenous lava lurker"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[16] = {
		killsRequired = 500,
		raceName = "Exotic Cave Spider",
		creatures = {
			"exotic cave spider"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[17] = {
		killsRequired = 500,
		raceName = "Pirat",
		creatures = {
			"pirat scoundrel",
			"pirat cutthroat"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[18] = {
		killsRequired = 500,
		raceName = "Stonerefiner",
		creatures = {
			"stonerefiner"
		},
		rewards = {
			{type = "exp", value = {1000000}},
			{type = "money", value = {100000}},
			{type = "storage", value = {BOSS_POINTS, 1}},
		}
	},
	[19] = {
		killsRequired = 500,
		raceName = "Crypt Warden",
		creatures = {
			"sphinx",
			"crypt warden"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[20] = {
		killsRequired = 500,
		raceName = "Werehyaena",
		creatures = {
			"werehyaena",
			"werehyaena shaman"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[21] = {
		killsRequired = 500,
		raceName = "Asuras",
		creatures = {
			"midnight asura",
			"dawnfire asura",
			"frost flower asura"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[22] = {
		killsRequired = 500,
		raceName = "Werelion",
		creatures = {
			"werelioness",
			"werelion"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[23] = {
		killsRequired = 500,
		raceName = "Flimsy Lost Soul",
		creatures = {
			"flimsy lost soul",
			"mean lost soul"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[24] = {
		killsRequired = 500,
		raceName = "Demon Outcast",
		creatures = {
			"demon outcast"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[25] = {
		killsRequired = 500,
		raceName = "Deathlings",
		creatures = {
			"deathling spellsinger",
			"deathling scout"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[26] = {
		killsRequired = 500,
		raceName = "Ripper Spectre",
		creatures = {
			"ripper spectre"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[27] = {
		killsRequired = 500,
		raceName = "Burster Spectre",
		creatures = {
			"burster spectre"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[28] = {
		killsRequired = 500,
		raceName = "Gazer Spectre",
		creatures = {
			"gazer spectre"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[29] = {
		killsRequired = 500,
		raceName = "Falcons",
		creatures = {
			"falcon knight",
			"falcon paladin"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[30] = {
		killsRequired = 500,
		raceName = "Cobras",
		creatures = {
			"cobra assassin",
			"cobra scout",
			"cobra vizier"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[31] = {
		killsRequired = 500,
		raceName = "Nightmare Isle",
		creatures = {
			"retching horror",
			"choking fear"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[32] = {
		killsRequired = 500,
		raceName = "Roshamuul",
		creatures = {
			"frazzlemaw",
			"guzzlemaw",
			"silencer"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[33] = {
		killsRequired = 500,
		raceName = "Ice Elfs",
		creatures = {
			"crazed winter vanguard",
			"crazed winter rearguard",
			"soul-broken harbinger"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[34] = {
		killsRequired = 500,
		raceName = "Fire Elfs",
		creatures = {
			"insane siren",
			"crazed summer vanguard",
			"crazed summer rearguard"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[35] = {
		killsRequired = 500,
		raceName = "Demon",
		creatures = {
			"demon"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[36] = {
		killsRequired = 500,
		raceName = "Hellspawn",
		creatures = {
			"hellspawn"
		},
		rewards = {
			{type = "exp", value = {10000000}},
			{type = "money", value = {1000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[37] = {
		killsRequired = 500,
		raceName = "Carnisylvans",
		creatures = {
			"dark carnisylvan",
			"poisonous carnisylvan"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 2}},
		}
	},
	[38] = {
		killsRequired = 500,
		raceName = "Bashmus",
		creatures = {
			"bashmu",
			"juvenile bashmu"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[39] = {
		killsRequired = 500,
		raceName = "Burning Gladiator",
		creatures = {
			"priestess of the wild sun",
			"black sphinx acolyte",
			"burning gladiator"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[40] = {
		killsRequired = 500,
		raceName = "Girtablilus",
		creatures = {
			"girtablilu warrior",
			"venerable girtablilu"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[41] = {
		killsRequired = 500,
		raceName = "True Asuras",
		creatures = {
			"true midnight asura",
			"true dawnfire asura",
			"true frost flower asura"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[42] = {
		killsRequired = 500,
		raceName = "Skeleton Elite Warrior",
		creatures = {
			"skeleton elite warrior",
			"undead elite gladiator"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[43] = {
		killsRequired = 500,
		raceName = "Many Faces",
		creatures = {
			"mirror image",
			"many faces",
			"distorted phantom"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[44] = {
		killsRequired = 500,
		raceName = "Infernal Demon",
		creatures = {
			"infernal demon",
			"brachiodemon",
			"infernal phantom"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[45] = {
		killsRequired = 500,
		raceName = "Bony Sea Devil",
		creatures = {
			"bony sea devil",
			"turbulent elemental",
			"capricious phantom",
			"hazardous phantom"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[46] = {
		killsRequired = 500,
		raceName = "Rotten Golem",
		creatures = {
			"rotten golem",
			"branchy crawler",
			"mould phantom"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	},
	[47] = {
		killsRequired = 500,
		raceName = "Library Books",
		creatures = {
			"energetic book",
			"icecold book",
			"squid warden",
			"animated feather",
			"cursed book",
			"rage squid",
			"burning book",
			"knowledge elemental",
			"energuardian of tales"
		},
		rewards = {
			{type = "exp", value = {50000000}},
			{type = "money", value = {2000000}},
			{type = "storage", value = {BOSS_POINTS, 3}},
		}
	}
}

function Player.getPawAndFurRank(self)
	return (self:getStorageValue(POINTSSTORAGE) >= 100
	and RANK_ELITEHUNTER or self:getStorageValue(POINTSSTORAGE) >= 70
	and RANK_TROPHYHUNTER or self:getStorageValue(POINTSSTORAGE) >= 40
	and RANK_BIGGAMEHUNTER or self:getStorageValue(POINTSSTORAGE) >= 20
	and RANK_RANGER or self:getStorageValue(POINTSSTORAGE) >= 10
	and RANK_HUNTSMAN or self:getStorageValue(JOIN_STOR) == 1
	and RANK_JOIN or RANK_NONE)
end

function Player.getPawAndFurPoints(self)
	return math.max(self:getStorageValue(POINTSSTORAGE), 0)
end

function getTaskByName(name, table)
	local t = (table and table or tasks)
	for k, v in pairs(t) do
		if v.name then
			if v.name:lower() == name:lower() then
				return k
			end
		else
			if v.raceName:lower() == name:lower() then
				return k
			end
		end
	end
	return false
end

function Player.getTasks(self)
	local canmake = {}
	local able = {}
	for k, v in pairs(tasks) do
		if self:getStorageValue(QUESTSTORAGE_BASE + k) < 1 then
			able[k] = true
			if able[k] then
				canmake[#canmake + 1] = k
			end
		end
	end
	return canmake
end

function Player.canStartTask(self, name, table)
	local v = ""
	local id = 0
	local t = (table and table or tasks)
	for k, i in pairs(t) do
		if i.name then
			if i.name:lower() == name:lower() then
				v = i
				id = k
				break
			end
		else
			if i.raceName:lower() == name:lower() then
				v = i
				id = k
				break
			end
		end
	end
	if v == "" then
		return false
	end
	if self:getStorageValue(QUESTSTORAGE_BASE + id) > 0 then
		return false
	end

	return true
end

function Player.getStartedTasks(self)
	local tmp = {}
	for k, v in pairs(tasks) do
		if self:getStorageValue(QUESTSTORAGE_BASE + k) > 0 and self:getStorageValue(QUESTSTORAGE_BASE + k) < 2 then
			tmp[#tmp + 1] = k
		end
	end
	return tmp
end

function getPlayerRank(cid) local p = Player(cid) return p and p:getPawAndFurRank() end
function getPlayerTasksPoints(cid) local p = Player(cid) return p and p:getPawAndFurPoints() end
function getTasksByPlayer(cid) local p = Player(cid) return p and p:getTasks() end
function canStartTask(cid, name, table) local p = Player(cid) return p and p:canStartTask(name, table) end
function getPlayerStartedTasks(cid) local p = Player(cid) return p and p:getStartedTasks() end
