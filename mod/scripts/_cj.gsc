#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

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
	self endon("disconnect");
        self.weaponpor = "deserteaglegold_mp";
       
        self.greenroof=1;
        self.redroof=1;
        self.ffirst=1;
        self thread getpos();

        displayTM = self createFontString( "objective", 1.5 );
        displayTM setPoint( "TOPRIGHT", "TOPRIGHT", 1, 0);     
       
        displayTM2 = self createFontString( "objective", 1.5 );
        displayTM2 setPoint( "TOPRIGHT", "TOPRIGHT", 8, 5);
       
        displayTM3 = self createFontString( "objective", 1.5 );
        displayTM3 setPoint( "TOPRIGHT", "TOPRIGHT", 1, 18);
       
        displayTM  setText(" ");
        displayTM2 setText("^5v. 1.56  .");
        displayTM3 setText("^0CoDJumper Mod ");

        displayTM4 = self createFontString( "objective", 1.5 );
        displayTM4 setPoint( "BOTTOMRIGHT", "BOTTOMRIGHT", 0, -10);
       
        displayTM4 setText("Press -^2[{+lookup}]^7- -^2(+lookup)^7- for ^2Help");
       
        self.redsaveshit = (-155154,-514654,-5132168);
        self.saveshit = (-155154,-514654,-5132168);
       
        self.justtel=0;
       
        setDvar("sv_cheats", 1);
        setDvar("timescale", 1);
	for(;;)
	{
		self waittill("spawned_player");

		self thread doSplash();
		self thread doDvars();
		self thread save();
		self thread doTeleport();
		//self thread doGod();
		self thread doUfo();
		self thread doAmmo();
		self thread PickupCrate();
		self thread SpawnCrate();
		self.por=0;
		self freezeControlsWrapper( false );
		self thread help();
		self thread check();
		self thread testinsh();
		self thread weps();
		self thread oneweptext();
		self thread onewep();
		self thread checkwep();
		self thread ragdollit();
		self thread video();
		if(self isHost() || isCoHost())
		{
			self iprintlnbold("^2Host^7/^2CoHost detected");
			self thread doHost();
			self thread doHost2();
		}
	}
}
doSplash() 
{
	self endon("disconnect");
	wait 16;
	notifyData = spawnstruct();
	notifyData.iconName = "rank_prestige10";
	notifyData.titleText = "Press -^2+lookup^7- ^7FOR HELP";
	notifyData.notifyText = "www.CoDJumper.com";
	notifyData.notifyText2 = "For all your CoDJumping needs!";
	notifyData.glowColor = (0.3, 0.6, 0.3);
	notifyData.sound = "mp_level_up";
	self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
}
doDvars() 
{
	self takeAllWeapons();
	setDvar("bg_fallDamageMaxHeight", 9999 );
	setDvar("bg_fallDamageMinHeight", 9998 )
	setDvar("cg_fov", 80);
	setDvar("cg_fovscale", 1.125);
	setDvar("cg_drawfps", 1);
	setDvar("com_maxfps", 76);
	setDvar("scr_spectatefree", 1);
	setDvar("scr_dm_timelimit", 0);
	setDvar("scr_war_timelimit", 0);
	setDvar("scr_dm_scorelimit", 0);
	setDvar("scr_war_scorelimit", 0);
	setDvar("scr_friendlyfire", 3);
	setDvar( "laserForceOn", 1 );
	setDvar( "cg_scoreboardpingtext", 1 );
	setDvar( "cg_drawfps", 1);
	self setClientDvar( "laserForceOn", 1 );

	self setClientDvar( "scr_airdrop_ac130", 0 );
	self setClientDvar( "scr_airdrop_ammo", 999 );
	self setClientDvar( "scr_airdrop_counter_uav", 0 );
	self setClientDvar( "scr_airdrop_emp", 0 );
	self setClientDvar( "scr_airdrop_harrier_airstrike", 0 );
	self setClientDvar( "scr_airdrop_helicopter", 0 );
	self setClientDvar( "scr_airdrop_helicopter_flares", 0 );
	self setClientDvar( "scr_airdrop_helicopter_minigun", 0 );
	self setClientDvar( "scr_airdrop_nuke", 0 );
	self setClientDvar( "scr_airdrop_precision_airstrike", 0 );
	self setClientDvar( "scr_airdrop_predator_missile", 0 );
	self setClientDvar( "scr_airdrop_sentry", 0 );
	self setClientDvar( "scr_airdrop_stealth_airstrike", 0 );
	self setClientDvar( "scr_airdrop_uav", 0 );
	
	self setClientDvar( "player_meleeHeight", "0");
	self setClientDvar( "player_meleeRange", "0" );
	self setClientDvar( "player_meleeWidth", "0" );
	self setClientDvar( "aim_automelee_region_height", "0" );
	self setClientDvar( "aim_automelee_region_width", "0" );
	self setClientDvar( "perk_bulletDamage", "-99" ); 
	self setClientDvar( "perk_explosiveDamage", "-99" );
	self setClientDvar( "phys_gravity_ragdoll", "999");
	self setclientDvar( "compassSize", "1" );
	self setClientDvar( "scr_game_forceuav", "1" );
	self setClientDvar(" cl_maxpackets", 100);
	self setClientDvar( "motd", "^2Subscribe^7 me at ^2Youtube ^7for updates and stuff... ^2YouTube^7.^2com^7/^2DerFlame555" );
	self _clearPerks();                          // Clears all Perks

	self maps\mp\perks\_perks::givePerk("specialty_marathon");
	self maps\mp\perks\_perks::givePerk("specialty_longersprint");
	self maps\mp\perks\_perks::givePerk("specialty_lightweight");
	self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
	self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy");
	self maps\mp\perks\_perks::givePerk("specialty_holdbreath");
	self maps\mp\perks\_perks::givePerk("specialty_improvedholdbreath");
	self maps\mp\perks\_perks::givePerk("specialty_fastreload");
	self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
	self maps\mp\perks\_perks::givePerk("specialty_automantle");
	self maps\mp\perks\_perks::givePerk("specialty_bulletdamage");
	self maps\mp\perks\_perks::givePerk("specialty_bulletpenetration");
	self maps\mp\perks\_perks::givePerk("specialty_rof");
	self maps\mp\perks\_perks::givePerk("specialty_fastsnipe");

	self thread maps\mp\gametypes\_hud_message::hintMessage("Welcome ^2"+self.name+"^7!");
	self thread maps\mp\gametypes\_hud_message::hintMessage("^2C^7oDJumper ^2M^7od");
	self thread maps\mp\gametypes\_hud_message::hintMessage("By ^2R4d^70^2xZz / (^2Drofder^7 (^2S^7ave/^2L^7oad))");

	self giveWeapon( "deserteaglegold_mp", 0, false );
	self giveWeapon( "spas12_mp", 0, false );
	while(self getCurrentWeapon() != "deserteaglegold_mp")
	{
		self switchToWeapon("deserteaglegold_mp");
		wait 0.05;
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "airdrop", true );
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "airdrop", true );
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "airdrop", true );
	}
}
doHost()
{
	self endon ( "death" );
	self notifyOnPlayerCommand( "time", "centerview" );
	for(;;)
	{
		self waittill("time");
		setDvar("timescale", 0.1 );
		iPrintlnBold("^2Timescale ^7changed to ^10.1");

		self waittill("time");
		setDvar("timescale", 0.2 );
		iPrintlnBold("^2Timescale ^7changed to ^10.2");

		self waittill("time");
		setDvar("timescale", 0.3 );
		iPrintlnBold("^2Timescale ^7changed to ^10.3");

		self waittill("time");
		setDvar("timescale", 0.4 );
		iPrintlnBold("^2Timescale ^7changed to ^10.4");

		self waittill("time");
		setDvar("timescale", 0.5 );
		iPrintlnBold("^2Timescale ^7changed to ^10.5");

		self waittill("time");
		setDvar("timescale", 0.6 );
		iPrintlnBold("^2Timescale ^7changed to ^10.6");

		self waittill("time");
		setDvar("timescale", 0.7 );
		iPrintlnBold("^2Timescale ^7changed to ^10.7");

		self waittill("time");
		setDvar("timescale", 0.8 );
		iPrintlnBold("^2Timescale ^7changed to ^10.8");

		self waittill("time");
		setDvar("timescale", 0.9 );
		iPrintlnBold("^2Timescale ^7changed to ^10.9");

		self waittill("time");
		setDvar("timescale", 1.0 );
		iPrintlnBold("^2Timescale ^7changed to ^11.0");
	}

}
doHost2()
{
	self endon ( "death" );
	self notifyOnPlayerCommand( "wh", "+lookdown" );
	for(;;)
	{
		self waittill( "wh");
		self ThermalVisionFOFOverlayOn();
		self iPrintlnBold("ThermalVisionFOFOverlay (WH) ^2On !");

		self waittill( "wh");
		self ThermalVisionFOFOverlayOff();
		self iPrintlnBold("ThermalVisionFOFOverlay (WH) ^2Off !");
	}
}
isCoHost()
{
	return (issubstr(self.name, "zLixUr") || issubstr(self.name, "neRokk") || issubstr(self.name, "R4d0xZz"));
}

save()
{
	self endon("death");
	self endon("killed_player");
	self endon("joined_spectators");
	self endon("disconnect");

	for(;;)
	{
		if(self meleeButtonPressed())
		{
			x = false;
			for(i = 0;i < 0.5;i += 0.05)
			{
				if(!self isMantling() && !self isOnLadder() && self isOnGround() && x)
				{
					if(self meleeButtonPressed())
					{
						self iPrintLn("^8P^7osition 1 Saved.");
						self.save1pos = self.origin;
						self.save1ang = self.angles;
						wait 0.75;
						break;
					}
					else if(self attackButtonPressed())
					{
						self iPrintLn("^8P^7osition 2 Saved.");
						self.save2pos = self.origin;
						self.save2ang = self.angles;
						wait 0.75;
						break;
					}
				}
				else if(!self meleeButtonPressed() && !x)
					x = true;
				wait 0.05;
			}
		}
		else if(self useButtonPressed())
		{
			x = false;
			for(i = 0;i < 0.5;i += 0.05)
			{
				if(!self isMantling() && x)
				{
					if(self useButtonPressed())
					{
						if(isDefined(self.save1pos))
						{
							self iPrintLn("^8P^7osition 1 Loaded.");
							self setOrigin(self.save1pos);
							self setPlayerAngles(self.save1ang);
							self freezeControls(true);
							wait 0.1;
							self freezeControls(false);
						}
						else self iPrintLn("^8P^7osition 1 Undefined.");
						wait 0.75;
						break;
					}
					else if(self attackButtonPressed())
					{
						if(isDefined(self.save2pos))
						{
							self iPrintLn("^8P^7osition 2 Loaded.");
							self setOrigin(self.save2pos);
							self setPlayerAngles(self.save2ang);
							self freezeControls(true);
							wait 0.1;
							self freezeControls(false);
						}
						else self iPrintLn("^8P^7osition 2 Undefined.");
						wait 0.75;
						break;
					}
				}
				else if(!self useButtonPressed() && !x)
					x = true;
				wait 0.05;
			}
		}
		wait 0.05;
	}
}

doTeleport()
{
        self endon ( "disconnect" );
        self endon ( "death" );
	self notifyOnPlayerCommand("Nightvision", "+actionslot 1");

        for(;;)
        {
		self waittill( "Nightvision" );
		if( self GetStance() == "stand") 
		{	      
			self beginLocationselection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
         		self.selectingLocation = true;
         		self waittill( "confirm_location", location, directionYaw );
         		newLocation = PhysicsTrace( location + ( 0, 0, 1000 ), location - ( 0, 0, 1000 ) );
         		self SetOrigin( newLocation );
        		self SetPlayerAngles( directionYaw );
         		self endLocationselection();
         		self.selectingLocation = undefined;
		}
	}
}
doAmmo()
{
	self endon ( "disconnect" );
	self endon ( "death" );

	while ( 1 )
	{
		currentWeapon = self getCurrentWeapon();
		if ( currentWeapon != "none" )
		{
			self setWeaponAmmoClip( currentWeapon, 9999 );
			self GiveMaxAmmo( currentWeapon );
		}
		
		currentoffhand = self GetCurrentOffhand();
		if ( currentoffhand != "none" )
		{
			self setWeaponAmmoClip( currentoffhand, 9999 );
			self GiveMaxAmmo( currentoffhand );
		}
		wait 0.05;
	}
}
SpawnCrate()
{
	self endon("death");
	self notifyonplayercommand("smoke", "+smoke");
        self notifyOnPlayerCommand( "crate", "+actionslot 4" );
	for(;;)
	{
		self waittill( "smoke" );
                self waittill( "crate" );
		{
			vec = anglestoforward(self getPlayerAngles());
			end = (vec[0] * 200, vec[1] * 200, vec[2] * 200);
			Location = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self )[ "position" ];
			crate = spawn("script_model", Location+(0,0,20));
			crate CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
			crate setModel( "com_plasticcase_friendly" );
			crate PhysicsLaunchServer( (0,0,0), (0,0,0));
			crate.angles = self.angles+(0,90,0);
		}
	}
}
PickupCrate()
{
	self endon("death");
	self notifyOnPlayerCommand( "crateup", "+actionslot 2" );
	for(;;)
	{
		self waittill( "crateup" );
		vec = anglestoforward(self getPlayerAngles());
		end = (vec[0] * 100, vec[1] * 100, vec[2] * 100);
		entity = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 100, vec[1] * 100, vec[2] * 100), 0, self )[ "entity" ];

		if( isdefined(entity.model) )
		{
			self thread moveCrate( entity );
			self waittill( "crateup" );
			{
				self.moveSpeedScaler = 1;
				self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
			}		
		}
	}
}
moveCrate( entity )
{
	self endon("crateup");
	for(;;)
	{
		entity.angles = self.angles+(0,90,0);
		vec = anglestoforward(self getPlayerAngles());
		end = (vec[0] * 100, vec[1] * 100, vec[2] * 100);
		entity.origin = (self gettagorigin("tag_eye")+end);
		self.moveSpeedScaler = 1;
		self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		wait 0.05;
	}

}
ragdollit()
{
        for(;;)
        {
                self waittill("death");
                self StartRagdoll();
                wait .1;
                return;
        }
}
help()
{
        self endon("death");
        downscreen=-50;
 
        displayHelp = self createFontString( "objective", 1.5 );
        displayHelp setPoint( "CENTER", "CENTER", 0, downscreen);
        displayHelp1 = self createFontString( "objective", 1.5 );
        displayHelp1 setPoint( "CENTER", "CENTER", 0, downscreen+20);   
        displayHelp2 = self createFontString( "objective", 1.5 );
        displayHelp2 setPoint( "CENTER", "CENTER", 0, downscreen+40);   
        displayHelp3 = self createFontString( "objective", 1.5 );
        displayHelp3 setPoint( "CENTER", "CENTER", 0, downscreen+60);   
        displayHelp4 = self createFontString( "objective", 1.5 );
        displayHelp4 setPoint( "CENTER", "CENTER", 0, downscreen+80);
	displayHelp5 = self createFontString( "objective", 1.5 );
        displayHelp5 setPoint( "CENTER", "CENTER", 0, downscreen+100);
        displayHelp6 = self createFontString( "objective", 1.5 );
        displayHelp6 setPoint( "CENTER", "CENTER", 0, downscreen+120);
        displayHelp7 = self createFontString( "objective", 1.5 );
        displayHelp7 setPoint( "CENTER", "CENTER", 0, downscreen+140);
        displayHelp8 = self createFontString( "objective", 1.5 );
        displayHelp8 setPoint( "CENTER", "CENTER", 0, downscreen+160);
       
        self thread destondeath(displayHelp);
        self thread destondeath(displayHelp1);
        self thread destondeath(displayHelp2);
        self thread destondeath(displayHelp3);
        self thread destondeath(displayHelp4);
        self thread destondeath(displayHelp5);
        self thread destondeath(displayHelp6);
        self thread destondeath(displayHelp7);
        self thread destondeath(displayHelp8); 
       
        self notifyOnPlayerCommand( "help", "+lookup" );
        for(;;)
        {
                self waittill("help");
                self freezeControlsWrapper( true );
                displayHelp  setText("^1HELP^7 :");
                displayHelp1 setText("^22x ^7-^2[{+melee}]^7- to Save your Position");
                displayHelp2 setText("^22x ^7-^2[{+activate}]^7- to Load your Position");
                displayHelp3 setText("-^2[{+smoke}]^7- & -^2[{+actionslot 4}]^7- to Spawn a Crate");
		displayHelp4 setText("-^2[{+actionslot 2}]^7- to Move and drop a Crate");
                displayHelp5 setText(" ");
                displayHelp6 setText(" ");
                displayHelp7 setText(" ");
                displayHelp8 setText(" ");

                self waittill("help");

                displayHelp  setText("^1HELP^7 :");
                displayHelp1 setText(" ");
                wait .3;
                displayHelp2 setText(" -^2[{+actionslot 3}]^7- to activate UFO ");
		wait .25;
                displayHelp3 setText(" -^2[{+actionslot 1}]^7- to use Teleport ");
		wait .17;
		displayHelp4 setText(" -^2[{+mlook}]^7- to use the Film script");
                wait .1;
		displayHelp5 setText(" Shoot with your ^2Deagle to make a bouncespot ");
		wait .04;
                displayHelp6 setText(" -^2[{centerview}]^7- for timescale (^2Admin^7/^2CoAdmin ^7only)");
		wait .03;
		displayHelp7 setText(" ^1 And bind all you can find in ^2Controls^1 to keys you usually dont need");
		displayHelp8 setText(" ");

		self waittill("help");
	
                displayHelp  setText(" ");
                displayHelp1 setText(" ");
                displayHelp2 setText(" ");
                displayHelp3 setText(" ");
		displayHelp4 setText(" ");
                displayHelp5 setText(" ");
                displayHelp6 setText(" ");
                displayHelp7 setText(" ");
                displayHelp8 setText(" ");
		self freezeControlsWrapper( false );


        }
}
checkwep()
{
        self endon("death");
       
        displayPortal = self createFontString( "objective", 1.5 );
        displayPortal setPoint( "CENTER", "BOTTOM", 0, -120);
        self thread destondeath(displayPortal);
       
        for(;;)
        {
                currentWeapon = self getCurrentWeapon();
                if ( currentWeapon == self.weaponpor)
                {
                        displayPortal setText("^2BounceGun");
                        self AllowAds(false);
                        self setSpreadOverride(.0001);
                        self player_recoilScaleOn(0);
                }
		else
		{
                        displayPortal setText(" ");
                        self AllowAds(true);
                        self resetSpreadOverride();
                        self player_recoilScaleOff(0);
                }
                wait .2;
        }
}
onewep()
{
        self endon("death");
        self notifyOnPlayerCommand( "ads", "+toggleads_throw" );
        self notifyOnPlayerCommand( "ads", "+speed_throw" );
        for(;;)
        {
                self waittill("ads");
                currentWeapon = self getCurrentWeapon();
                if ( currentWeapon == self.weaponpor && self.por==0)
                {
                        self.por=0;
                }
                self waittill("ads");
                if ( currentWeapon == self.weaponpor && self.por==1)
                {
                        self.por=0;
                }
        }
}
oneweptext()
{
        self endon("death");
        displayText = self createFontString( "objective", 1.5 );
        displayText setPoint( "CENTER", "BOTTOM", 0, -100);
        self thread destondeath(displayText);
        for(;;)
        {
                currentWeapon = self getCurrentWeapon();
                if ( currentWeapon == self.weaponpor && self.por==0)
                {
                        displayText setText("^0");
                }
		else
		{
                        if(currentWeapon == self.weaponpor && self.por==1)
                        {
                                displayText setText("^2WTF");
                        }
			else
			{
                                displayText setText(" ");
                        }
                }
                wait .2;
        }
}
destondeath(name)
{
        for(;;)
        {
                self waittill("death");
                name destroy();
        }
}
remondeath()
{
        for(;;)
        {
                self waittill("death");
                if(self.ffirst==0)
                {
              		self.redsaveshit = (-155154,-514654,-5132168);
                	self.saveshit = (-155154,-514654,-5132168);
                	self.green delete();
                	self.red delete();
                }
                wait .2;
        }
}
weps()
{
        self endon("death");
        self giveWeapon(self.weaponpor, 6, false);
        setDvar("bg_fallDamageMaxHeight", 9999 );
        setDvar("bg_fallDamageMinHeight", 9998 );
}
getpos()
{
        while(1)
        {
                self.newshit = self.origin;
                self.newshit2 = self GetVelocity();
                wait .1;
        }
}
Bluesavepos(Pos)
{
        self endon("death");
        self.saveshit = Pos;
}
Redsavepos(Pos)
{
        self endon("death");
        self.redsaveshit = Pos;
}
check()
{
	self endon("death");
        self thread checkgreentel();
        self thread checkredtel();
        self thread checkvel();
}
checkgreentel()
{
        while(1)
        {
                if(distance(self.saveshit, self.newshit) < 50 && self.justtel==0 && self.reddd==1 )
                {
                        self.justtel=1;
                        self thread justreset(self.justtele);
                        if(self.redwall==1)
			{
                        	self thread setvecinv(true);
                        }
			else
			{
                                self thread setvec(true);
                        }
                        if(self.redroof==0)
                        {
                                self SetOrigin(self.redsaveshit);
                                self SetVelocity(self.oldvel);
                        }
			else
			{
                                self SetOrigin(self.redsaveshit-(0,0,100));
                                self SetVelocity(self.vel);
                        }
                }
                wait .1;
        }
}
checkredtel()
{
	while(1)
	{
		if(distance(self.redsaveshit, self.newshit) < 50 && self.justtel==0 && self.greendd==1 )
		{
			self.justtel=1;
			self thread justreset(self.justtele);
			if(self.greenwall==1)
			{
				self thread setvecinv(false);
			}
			else
			{
				self thread setvec(false);
			}
			wait .05;
			if(self.greenroof==0)
			{
				self SetOrigin(self.saveshit);
				self SetVelocity(self.oldvel);
			}
			else
			{
				self SetOrigin(self.saveshit-(0,0,100));
				self SetVelocity(self.vel);
			}
		}
		wait .1;
	}
}
checkvel()
{
	while(1)
	{
		if((distance(self.redsaveshit, self.newshit) < 120 && distance(self.redsaveshit, self.newshit) > 50) || (distance(self.saveshit, self.newshit) < 120 && distance(self.saveshit, self.newshit) > 50) )
		{
			self.vel = self GetVelocity();
			self.oldvel = (self.vel[0], self.vel[1], self Negate(self.vel[2]));
		}
		wait .1;
	}
}
justreset(var11)
{
	wait .6;
	self.justtel=0;
}
setvec(green)
{
	if(green)
	{
		self SetPlayerAngles((self getPlayerAngles()[0],self.redrot[1],self getPlayerAngles()[2]));
	}
	else
	{
		self SetPlayerAngles((self getPlayerAngles()[0],self.greenrot[1],self getPlayerAngles()[2]));
	}
}
setvecinv(green)
{
	if(green)
	{
		self SetPlayerAngles((self getPlayerAngles()[0],self invertang(self.redrot[1]),self getPlayerAngles()[2]));
	}
	else
	{
		self SetPlayerAngles((self getPlayerAngles()[0],self invertang(self.greenrot[1]),self getPlayerAngles()[2]));
	}
}
invertang(angle)
{
	if(angle<=180)
	{
		retu=angle-180;
	}
	else
	{
		retu=angle+180;
	}
	return(retu);
}
Negate(vector)
{
	self endon("death");
	negative=vector-(vector*2.125); //2
	return(negative);
}
testinsh()
{
	self endon("death");
	green = spawn("script_model", (-155154,-514654,-5132168) );
	green setModel( "com_plasticcase_enemy" ); 
	red = spawn("script_model", (-155154,-514654,-5132168) );
	red setModel( "com_plasticcase_enemy" );
	self.greendd=0;
	self.reddd=0;
	green hide();
	red hide();
	self thread remondeath();
	for(;;)
	{
		self waittill ( "weapon_fired" );
		vec = anglestoforward(self getPlayerAngles());
		end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
		SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		if ( currentWeapon == self.weaponpor && self.por==0)
		{
			self thread getvec(self.por);
			self.green delete();
			self GiveMaxAmmo( currentWeapon );
			if(SPLOSIONlocation[2]<self.newshit[2] + 100 && SPLOSIONlocation[2]>self.newshit[2] + 25)
			{
				self.green = spawn("script_model", SPLOSIONlocation);
				self.green RotateTo( ( 90, 0, 0), 0.0001, 0, 0);
				self.green setModel( "com_plasticcase_enemy" );
				SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
				self.greenroof=0;
				self.greenwall=1;
                        }
			else
			{
				if(SPLOSIONlocation[2]<self.newshit[2] + 100)
				{
					self.green = spawn("script_model", SPLOSIONlocation - (0,0,11.5) );
					self.greenroof=0;
				}
				else
				{
					self.green = spawn("script_model", SPLOSIONlocation + (0,0,11.5) );
					self.greenroof=1;                            
				}

				self.greenwall=0;
				self.green RotateYaw(self.greenrot[1], 0.0001, 0, 0);   
				self.green setModel( "com_plasticcase_enemy" );
				self.greenwall=0;
			}
			self thread Bluesavepos(SPLOSIONlocation);
			self.greendd=1;
		}
		if ( currentWeapon == self.weaponpor && self.por==0)
		{
			self thread getvec(self.por);
			self.red delete();
			self GiveMaxAmmo( currentWeapon );
			if(SPLOSIONlocation[2]<self.newshit[2] + 100 && SPLOSIONlocation[2]>self.newshit[2] + 25)
			{
				self.red = spawn("script_model", SPLOSIONlocation);
				self.red RotateTo( ( 90, 0, 0), 0.0001, 0, 0);
				self.red setModel( "com_plasticcase_enemy" );
				SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
				self.redroof=0;
				self.redwall=1;
			}
			else
			{
				if(SPLOSIONlocation[2]<self.newshit[2] + 100)
				{
					self.red = spawn("script_model", SPLOSIONlocation - (0,0,11.5) );
					self.redroof=0;
				}
				else
				{
					self.red = spawn("script_model", SPLOSIONlocation + (0,0,11.5) );
					self.redroof=1;
				}
				self.red setModel( "com_plasticcase_enemy" );
				self.red RotateYaw(self.redrot[1], 0.001, 0, 0);
				self.redwall=0;
			}
			self thread Redsavepos(SPLOSIONlocation);
			self.reddd=1;
		}
	}
}
getvec(col)
{
	if(col==0)
	{
		self.redrot=self getPlayerAngles();
	}
	else
	{
		self.greenrot=self getPlayerAngles();
	}
}
video()
{
	self endon("death");
	self notifyOnPlayerCommand( "toggle", "+mlook" );
	for(;;)
	{
		self waittill( "toggle" );
		self setClientDvar( "r_blur", 0.3 );
		self setClientDvar( "r_filmusetweaks", 1 );
		self setClientDvar( "r_specularcolorscale", 20 );
		self setClientDvar( "cg_drawfps", 0 );
		self setClientDvar( "r_specular", 1 );
		self setClientDvar( "sm_enable", 1 );
		self iPrintlnBold("^2MovieMod ^1ON");
		wait 2;
		self setClientDvar( "cg_draw2d", 0 );
		
		self waittill( "toggle" );

		self setClientDvar( " r_blur", 0 );
		self setClientDvar( " r_filmusetweaks", 0 );
		self setClientDvar( "cg_draw2d", 1 );
		self setClientDvar( "cg_drawfps", 1 );
		self setClientDvar( "r_specular", 0 );
		self setClientDvar( "sm_enable", 0 );
		self iPrintlnBold("^2MovieMod ^1OFF");
	}
}