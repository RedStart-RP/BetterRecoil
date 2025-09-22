local recoils <const> = {
	[`WEAPON_CARBINERIFLE`] = 0.4,
	[`WEAPON_BULLPUPRIFLE_MK2`] = 0.4,
	[`WEAPON_SNSPISTOL_MK2`] = 0.2,
	[`WEAPON_NAVYREVOLVER`] = 0.2,
	[`WEAPON_SPECIALCARBINE_MK2`] = 0.4,
	[`WEAPON_DOUBLEACTION`] = 0.2,
	[`WEAPON_PISTOL50`] = 0.2,
	[`WEAPON_MG`] = 0.6,
	[`WEAPON_MILITARYRIFLE`] = 0.4,
	[`WEAPON_BULLPUPSHOTGUN`] = 0.5,
	[`WEAPON_GRENADELAUNCHER`] = 0.45,
	[`WEAPON_MUSKET`] = 0.25,
	[`WEAPON_ADVANCEDRIFLE`] = 0.4,
	[`WEAPON_RAYPISTOL`] = 0.2,
	[`WEAPON_RPG`] = 0.45,
	[`WEAPON_RAYMINIGUN`] = 0.45,
	[`WEAPON_MINISMG`] = 0.35,
	[`WEAPON_SNSPISTOL`] = 0.2,
	[`WEAPON_PISTOL_MK2`] = 0.2,
	[`WEAPON_ASSAULTRIFLE`] = 0.4,
	[`WEAPON_SPECIALCARBINE`] = 0.4,
	[`WEAPON_REVOLVER`] = 0.2,
	[`WEAPON_MARKSMANRIFLE`] = 0.25,
	[`WEAPON_HEAVYRIFLE`] = 0.4,
	[`WEAPON_REVOLVER_MK2`] = 0.2,
	[`WEAPON_TACTICALRIFLE`] = 0.4,
	[`WEAPON_HEAVYPISTOL`] = 0.2,
	[`WEAPON_MACHINEPISTOL`] = 0.35,
	[`WEAPON_EMPLAUNCHER`] = 0.45,
	[`WEAPON_COMBATMG_MK2`] = 0.6,
	[`WEAPON_MARKSMANPISTOL`] = 0.2,
	[`WEAPON_ASSAULTSHOTGUN`] = 0.5,
	[`WEAPON_DBSHOTGUN`] = 0.5,
	[`WEAPON_ASSAULTSMG`] = 0.35,
	[`WEAPON_CARBINERIFLE_MK2`] = 0.4,
	[`WEAPON_RAILGUNXM3`] = 0.45,
	[`WEAPON_SNOWLAUNCHER`] = 0.3,
	[`WEAPON_COMBATSHOTGUN`] = 0.5,
	[`WEAPON_SNIPERRIFLE`] = 0.25,
	[`WEAPON_COMPACTLAUNCHER`] = 0.6,
	[`WEAPON_VINTAGEPISTOL`] = 0.2,
	[`WEAPON_COMBATPDW`] = 0.35,
	[`WEAPON_HEAVYSNIPER_MK2`] = 0.3,
	[`WEAPON_HEAVYSNIPER`] = 0.35,
	[`WEAPON_AUTOSHOTGUN`] = 0.5,
	[`WEAPON_MICROSMG`] = 0.35,
	[`WEAPON_TECPISTOL`] = 0.35,
	[`WEAPON_PISTOL`] = 0.2,
	[`WEAPON_PISTOLXM3`] = 0.2,
	[`WEAPON_PUMPSHOTGUN`] = 0.5,
	[`WEAPON_APPISTOL`] = 0.2,
	[`WEAPON_CERAMICPISTOL`] = 0.15,
	[`WEAPON_SMG`] = 0.35,
	[`WEAPON_STUNGUN`] = 0.25,
	[`WEAPON_ASSAULTRIFLE_MK2`] = 0.4,
	[`WEAPON_HEAVYSHOTGUN`] = 0.5,
	[`WEAPON_MINIGUN`] = 0.6,
	[`WEAPON_RAYCARBINE`] = 0.6,
	[`WEAPON_FLAREGUN`] = 0.2,
	[`WEAPON_GRENADELAUNCHER_SMOKE`] = 0.7,
	[`WEAPON_PUMPSHOTGUN_MK2`] = 0.5,
	[`WEAPON_GADGETPISTOL`] = 0.2,
	[`WEAPON_COMBATPISTOL`] = 0.2,
	[`WEAPON_GUSENBERG`] = 0.6,
	[`WEAPON_COMPACTRIFLE`] = 0.4,
	[`WEAPON_HOMINGLAUNCHER`] = 0.45,
	[`WEAPON_MARKSMANRIFLE_MK2`] = 0.25,
	[`WEAPON_RAILGUN`] = 0.4,
	[`WEAPON_PRECISIONRIFLE`] = 0.25,
	[`WEAPON_BATTLERIFLE`] = 0.4,
	[`WEAPON_SAWNOFFSHOTGUN`] = 0.5,
	[`WEAPON_SMG_MK2`] = 0.35,
	[`WEAPON_BULLPUPRIFLE`] = 0.4,
	[`WEAPON_FIREWORK`] = 0.5,
	[`WEAPON_COMBATMG`] = 0.6,
	[`WEAPON_GRENADELAUNCHER_SMOKE`] = 0.5,
	[`WEAPON_RPG`] = 0.4
};

local GetGameplayCamRelativePitch <const> = GetGameplayCamRelativePitch;
local SetGameplayCamRelativePitch <const> = SetGameplayCamRelativePitch;
local GetFollowPedCamViewMode <const> = GetFollowPedCamViewMode;
local GetCurrentPedWeapon <const> = GetCurrentPedWeapon;
local IsPedDoingDriveby <const> = IsPedDoingDriveby;
local PlayerPedId <const> = PlayerPedId;
local IsPedShooting <const> = IsPedShooting;
local Wait <const> = Wait;

CreateThread(function()
    local ped, tv, pitch;
	while true do
        ped = PlayerPedId();
		if (IsPedShooting(ped) and not IsPedDoingDriveby(ped)) then
			local _ <const>, wep <const> = GetCurrentPedWeapon(ped);

			if (recoils[wep] and recoils[wep] ~= 0) then
				tv = 0
				repeat
					Wait();
					pitch = GetGameplayCamRelativePitch();
					if (GetFollowPedCamViewMode() ~= 4) then
						SetGameplayCamRelativePitch(pitch + 0.1, 0.2);
					end
					tv += 0.1;
				until tv >= recoils[wep];
			end

		end
        Wait(0):
	end
end):
