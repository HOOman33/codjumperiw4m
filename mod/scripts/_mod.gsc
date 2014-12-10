#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

init()
{
	level thread onPlayerConnect();
}
onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread onPlayerSpawned();
	}
}
onPlayerSpawned()
{
	self endon( "disconnect" );

	for(;;)
	{
		self waittill( "spawned_player" );
		self thread doMod();
	}
}	
doMod() 
{
	self _clearPerks();
	self takeAllWeapons();
	
	self endon( "disconnect" );
	self endon( "death" );

	self _clearPerks();
	self takeAllWeapons();
	self GiveWeapon( "usp_tactical_mp" );
	wait .05;
	self switchToWeapon( "usp_tactical_mp" );
	
	self maps\mp\perks\_perks::givePerk( "specialty_marathon" );
	self maps\mp\perks\_perks::givePerk( "specialty_lightweight" );
	self maps\mp\perks\_perks::givePerk( "specialty_fastsprintrecovery" );
	self maps\mp\perks\_perks::givePerk( "specialty_jumpdive" );
	self maps\mp\perks\_perks::givePerk( "specialty_fastmantle" );

	
	self setClientDvar( "bg_falldamageminheight", 9999 );
	self setClientDvar( "bg_falldamagemaxheight", 9999 );

	self setClientDvar( "lowAmmoWarningNoAmmoColor2", 0, 0, 0, 0 );
	self setClientDvar( "lowAmmoWarningNoAmmoColor1", 0, 0, 0, 0 );

	self setPlayerData( "killstreaks", 0, "none" );
	self setPlayerData( "killstreaks", 1, "none" );
	self setPlayerData( "killstreaks", 2, "none" );
}