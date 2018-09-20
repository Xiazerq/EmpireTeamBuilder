/*
Drop Tables If Exist
*/

DROP TABLE IF EXISTS EmpireGuild;
DROP TABLE IF EXISTS WebHook;
DROP TABLE IF EXISTS EmpireGuildWebHook;
DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS Staging_Characters;

/*
Create and Populate EmpireGuild Table.
Executor is the only 0 color.  Need to know the rest.
The Field is COlor_DEC bcause that is the Decimal value of the color.  It is used the TW and Raid Webhooks.  Is this something that you'd use in the webpage?  If so, would you need the hex value?
I didn't add the GUild URL.  Because it wont be needed in the download process.  We can add it if we want to look good, probably just add the last extetion after the Guild ID

-Need to create view / proc to aggrage Profile Cnt, Member Cnt and Ship GP, Toon GP and Overall GP.
*/

CREATE TABLE EmpireGuild 
	(
		EmpGuiId int 
		, EmpGuiDisplayName VARCHAR(50)
		, EmpGuiColor_Dec int
		, EmpGuiDateModified datetime
		, primary key (EmpGuiId)
	);

insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (25666,'Chimaera',16007746,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (26170,'Devastator',0,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (26453,'Eclipse',0,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (44009,'Executor',0,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (33287,'Nemesis',0,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (15981,'Perilous',0,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (5973,'Predator',0,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (26040,'Ravager',65280,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (26384,'Reaper',12632256,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (36289,'Vanguard',65535,NOW());
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec, EmpGuiDateModified) values (35846,'Vengeance',8421568,NOW());



/*
I really need to get Chimaera on the Raid & TW Bots
There's a Cpt channel, and a channel for the rest.
*/

CREATE TABLE WebHook
	(
		WebHooId int AUTO_INCREMENT
		, WebHooType VARCHAR(50)
		, primary key (WebHooId)
	);


insert into WebHook (WebHooType) values ('TB');
insert into WebHook (WebHooType) values ('TW');
insert into WebHook (WebHooType) values ('Raid');
insert into WebHook (WebHooType) values ('Captain');


/*
This has the 4 guilds that use the Raid & TB Bots.  Rav, Reap, Exec and Vang
*/

CREATE TABLE EmpireGuildWebHook
	(
		EmGWeHId int AUTO_INCREMENT
		, EmpireGuildEmpGuiId int
		, WebHookWebHooId int
		, EmGWeHURL VARCHAR(100)
		, primary key (EmGWeHId)

	);


insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (44009,1,'https://discordapp.com/api/webhooks/481263923262128148/tJxH-3cxNDamcLPMKC_yGMXS0ILHP8ssIqrXqur4PlOEix2vJCVEJQSI13QgLwBK4LjY');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (44009,3,'https://discordapp.com/api/webhooks/481263601588371482/1gNohR7DBV4kiH-CbgZM1wy5Uu9prfC2rZRBLy5APVFFmVgSq7nidQfVD_X5nFoPMy1f');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (44009,4,'https://discordapp.com/api/webhooks/474580104849129494/og4ibJfsLjw6KVDZ4xmHCyahwGEVyJwemZU9eyw3M8B7ulN5XQfEoOSAHSSi1ZxYSI0J');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26040,1,'https://discordapp.com/api/webhooks/478579983028322304/96t8ant1OLb0b_ER98K-ty4x5QSR48j0u6CqmRInu0vahF_ZGljytTdGjnjdZgc6U7qj');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26040,3,'https://discordapp.com/api/webhooks/464903380171751424/aZ-uMo_N8wv6yx3XbbpioNvzmSbjcKyRZzmZ-TU8SRV8Xn6af8RGx4nFwm0PfN5G1xKc');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26040,4,'https://discordapp.com/api/webhooks/466750489757876265/M9qao3jJL4s7LXtl7zMqrJOCJ2DseYSDa7MJYckR-yI16zmjvUsWdRPb0hw6xZal7Eqc');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26384,1,'https://discordapp.com/api/webhooks/485131110599098369/7jU_GtFWyQrVduj8rbYWWnRVkg_IQKR821MkU__JKs3m8A9htvhu8ukn-WuucSgoBYC9');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26384,3,'https://discordapp.com/api/webhooks/464902461640146954/8kpVnjBVgCmM-s3yi1NU3nd0PTDrk_XNDoznOrW2otTNkFg1ToVZSrfeMRUwRpdZcpkc');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26384,4,'https://discordapp.com/api/webhooks/485130905426591744/jhlO7rA30rDA_xye9jGTQPcNi_c8ifbPUDTnpRYE7HR2EvaxY7dg7Rv57WDjBvkGpryI');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (36289,1,'https://discordapp.com/api/webhooks/383281809678401538/ugGpx5Ii4EROKKM-4pu2qYk-tHIWJx_TjLdcYFVOyzxdGme4naYZUylIUl-VZ0m_JAqr');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (36289,3,'https://discordapp.com/api/webhooks/464901303773167616/vw06-lyD6sRotBlOSPZGR4uAu8K4yoaP3V4jM5OfdYNc1w7SwNmwag6-YAYOZpt9SSip');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (36289,4,'https://discordapp.com/api/webhooks/474952596797521932/IvVcm9xq1xxDZZzwfpRZjuxGZARxDJjSDxww9U_qWgzvTsVHFpUunjpVtA7V55cauBiJ');


/*
ID will be the BaseID.  Image URL will be local URL. Desciption will contain full description.
Alignment, Categories and Abilities will be stored in a seperate table.
*/

CREATE TABLE Characters
	(
		CharacId varchar(50)
		, CharacName varchar(50)
		, CharacImageURL varchar(50)
		, CharacPower int
		, CharacDescription varchar(255)
		, CharacDateModified varchar(255)
		, primary key (CharacId)
	);


/*
This is the Staging Table for https://swgoh.gg/api/characters/.  I didnt add PK, SWGOH GG URL, Combat Type or Gear. Can add if needed.  
PK may be a good Unique ID, but the other API has the BaseID as the Unique ID.

Populating this table is my biggest hurdle!!!

*/

CREATE TABLE Staging_Characters
	(
		Base_Id varchar(50)
		, Name varchar(50)
		, Image varchar(50)
		, Power int
		, Description varchar(255)
		, Alignment varchar(255)
		, Categories varchar(255)
		, AbilityClasses varchar(255)
		, Role varchar(255)
	);


/*
Manual insert into the staging table.
Single quotes are a problem:  Qu'ir and Ur'rrurur'uru'ruorruogur are problems
*/

insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('AAYLASECURA','Aayla Secura','tex.charui_aaylasecura.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ADMIRALACKBAR','Admiral Ackbar','tex.charui_ackbaradmiral.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('AHSOKATANO','Ahsoka Tano','tex.charui_ahsoka.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FULCRUMAHSOKA','Ahsoka Tano (Fulcrum)','tex.charui_ahsokaadult.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('AMILYNHOLDO','Amilyn Holdo','tex.charui_holdo.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ASAJVENTRESS','Asajj Ventress','tex.charui_ventress.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('AURRA_SING','Aurra Sing','tex.charui_aurrasing.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('B2SUPERBATTLEDROID','B2 Super Battle Droid','tex.charui_b2.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BARRISSOFFEE','Barriss Offee','tex.charui_barriss_light.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BASTILASHAN','Bastila Shan','tex.charui_bastilashan.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BAZEMALBUS','Baze Malbus','tex.charui_bazemalbus.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BB8','BB-8','tex.charui_bb8.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BIGGSDARKLIGHTER','Biggs Darklighter','tex.charui_rebelpilot_biggs.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BISTAN','Bistan','tex.charui_bistan.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BOBAFETT','Boba Fett','tex.charui_bobafett.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BODHIROOK','Bodhi Rook','tex.charui_bodhi.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('BOSSK','Bossk','tex.charui_bossk.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CADBANE','Cad Bane','tex.charui_cadbane.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HOTHHAN','Captain Han Solo','tex.charui_hoth_han.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('PHASMA','Captain Phasma','tex.charui_phasma.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CASSIANANDOR','Cassian Andor','tex.charui_cassian.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CC2224','CC-2224 "Cody"','tex.charui_trooperclone_cody.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CHIEFCHIRPA','Chief Chirpa','tex.charui_ewok_chirpa.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CHIEFNEBIT','Chief Nebit','tex.charui_jawa_nebit.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CHIRRUTIMWE','Chirrut Îmwe','tex.charui_chirrut.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CHOPPERS3','Chopper','tex.charui_chopper.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CLONESERGEANTPHASEI','Clone Sergeant - Phase I','tex.charui_trooperclonegreen.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CLONEWARSCHEWBACCA','Clone Wars Chewbacca','tex.charui_chewbacca.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('COLONELSTARCK','Colonel Starck','tex.charui_colonel_stark.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('COMMANDERLUKESKYWALKER','Commander Luke Skywalker','tex.charui_lukebespin.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CORUSCANTUNDERWORLDPOLICE','Coruscant Underworld Police','tex.charui_coruscantpolice.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('COUNTDOOKU','Count Dooku','tex.charui_dooku.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CT210408','CT-21-0408 "Echo"','tex.charui_trooperclone_echo.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CT5555','CT-5555 "Fives"','tex.charui_trooperclone_fives.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('CT7567','CT-7567 "Rex"','tex.charui_trooperclone_rex.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('MAUL','Darth Maul','tex.charui_maul.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DARTHNIHILUS','Darth Nihilus','tex.charui_nihilus.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DARTHSIDIOUS','Darth Sidious','tex.charui_sidious.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DARTHSION','Darth Sion','tex.charui_sion.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DARTHTRAYA','Darth Traya','tex.charui_traya.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('VADER','Darth Vader','tex.charui_vader.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DATHCHA','Dathcha','tex.charui_jawa_dathcha.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DEATHTROOPER','Death Trooper','tex.charui_trooperdeath.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DENGAR','Dengar','tex.charui_dengar.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DIRECTORKRENNIC','Director Krennic','tex.charui_krennic.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('EETHKOTH','Eeth Koth','tex.charui_eethkoth.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('EMBO','Embo','tex.charui_embo.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('EMPERORPALPATINE','Emperor Palpatine','tex.charui_palpatineemperor.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ENFYSNEST','Enfys Nest','tex.charui_enfys.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('EWOKELDER','Ewok Elder','tex.charui_ewok_chief.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('EWOKSCOUT','Ewok Scout','tex.charui_ewok_scout.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('EZRABRIDGERS3','Ezra Bridger','tex.charui_ezra_s3.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FINN','Finn','tex.charui_finnjakku.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FIRSTORDEREXECUTIONER','First Order Executioner','tex.charui_firstorder_executioner.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FIRSTORDEROFFICERMALE','First Order Officer','tex.charui_firstorderofficer.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FIRSTORDERSPECIALFORCESPILOT','First Order SF TIE Pilot','tex.charui_firstorder_pilot.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FIRSTORDERTROOPER','First Order Stormtrooper','tex.charui_firstordertrooper.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('FIRSTORDERTIEPILOT','First Order TIE Pilot','tex.charui_firstordertiepilot.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GAMORREANGUARD','Gamorrean Guard','tex.charui_gamorreanguard.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GARSAXON','Gar Saxon','tex.charui_gar_saxon.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ZEBS3','Garazeb "Zeb" Orrelios','tex.charui_zeb_s3.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GRIEVOUS','General Grievous','tex.charui_grievous.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GENERALKENOBI','General Kenobi','tex.charui_obiwangeneral.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('VEERS','General Veers','tex.charui_veers.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GEONOSIANSOLDIER','Geonosian Soldier','tex.charui_geonosian_soldier.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GEONOSIANSPY','Geonosian Spy','tex.charui_geonosian_spy.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GRANDADMIRALTHRAWN','Grand Admiral Thrawn','tex.charui_thrawn.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GRANDMASTERYODA','Grand Master Yoda','tex.charui_yodagrandmaster.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GRANDMOFFTARKIN','Grand Moff Tarkin','tex.charui_tarkinadmiral.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('GREEDO','Greedo','tex.charui_greedo.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HANSOLO','Han Solo','tex.charui_han.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HERASYNDULLAS3','Hera Syndulla','tex.charui_hera_s3.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HERMITYODA','Hermit Yoda','tex.charui_yodahermit.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HK47','HK-47','tex.charui_hk47.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HOTHREBELSCOUT','Hoth Rebel Scout','tex.charui_rebelhothscout.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HOTHREBELSOLDIER','Hoth Rebel Soldier','tex.charui_rebelhoth.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('MAGNAGUARD','IG-100 MagnaGuard','tex.charui_magnaguard.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('IG86SENTINELDROID','IG-86 Sentinel Droid','tex.charui_ig86.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('IG88','IG-88','tex.charui_ig88.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('IMAGUNDI','Ima-Gun Di','tex.charui_imagundi.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('IMPERIALPROBEDROID','Imperial Probe Droid','tex.charui_probedroid.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('IMPERIALSUPERCOMMANDO','Imperial Super Commando','tex.charui_imperial_super_commando.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JANGOFETT','Jango Fett','tex.charui_jangofett.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JAWA','Jawa','tex.charui_jawa_jawa.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JAWAENGINEER','Jawa Engineer','tex.charui_jawa_engineer.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JAWASCAVENGER','Jawa Scavenger','tex.charui_jawa_scavenger.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JEDIKNIGHTCONSULAR','Jedi Consular','tex.charui_jedi_consular_03.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ANAKINKNIGHT','Jedi Knight Anakin','tex.charui_anakinknight.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JEDIKNIGHTGUARDIAN','Jedi Knight Guardian','tex.charui_jedi_guardian_01.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JOLEEBINDO','Jolee Bindo','tex.charui_joleebindo.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('JYNERSO','Jyn Erso','tex.charui_jyn.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('K2SO','K-2SO','tex.charui_k2so.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('KANANJARRUSS3','Kanan Jarrus','tex.charui_kanan_s3.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('KITFISTO','Kit Fisto','tex.charui_kitfisto.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('KYLOREN','Kylo Ren','tex.charui_kyloren.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('KYLORENUNMASKED','Kylo Ren (Unmasked)','tex.charui_kylo_unmasked.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('L3_37','L3-37','tex.charui_l337.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ADMINISTRATORLANDO','Lando Calrissian','tex.charui_landobespin.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('LOBOT','Lobot','tex.charui_lobot.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('LOGRAY','Logray','tex.charui_ewok_logray.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('LUKESKYWALKER','Luke Skywalker (Farmboy)','tex.charui_luke_ep4.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('LUMINARAUNDULI','Luminara Unduli','tex.charui_luminara.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('MACEWINDU','Mace Windu','tex.charui_macewindu.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('MAGMATROOPER','Magmatrooper','tex.charui_trooperstorm_magma.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('MISSIONVAO','Mission Vao','tex.charui_mission.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HUMANTHUG','Mob Enforcer','tex.charui_thug_female_01.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('MOTHERTALZIN','Mother Talzin','tex.charui_nightsisters_talzin.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('NIGHTSISTERACOLYTE','Nightsister Acolyte','tex.charui_nightsister_acolyte.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('NIGHTSISTERINITIATE','Nightsister Initiate','tex.charui_nightsister_initiate.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('NIGHTSISTERSPIRIT','Nightsister Spirit','tex.charui_nightsisters_wraith.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('NIGHTSISTERZOMBIE','Nightsister Zombie','tex.charui_nightsisters_zombie.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('NUTEGUNRAY','Nute Gunray','tex.charui_nutegunray.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('OLDBENKENOBI','Obi-Wan Kenobi (Old Ben)','tex.charui_obiwanep4.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('DAKA','Old Daka','tex.charui_daka.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('PAO','Pao','tex.charui_pao.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('PAPLOO','Paploo','tex.charui_ewok_paploo.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('PLOKOON','Plo Koon','tex.charui_plokoon.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('POE','Poe Dameron','tex.charui_poe.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('POGGLETHELESSER','Poggle the Lesser','tex.charui_geonosian_poggle.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('PRINCESSLEIA','Princess Leia','tex.charui_leia_princess.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('QIRA','Qi''ra','tex.charui_qira.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('QUIGONJINN','Qui-Gon Jinn','tex.charui_quigon.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('R2D2_LEGENDARY','R2-D2','tex.charui_astromech_r2d2.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('RANGETROOPER','Range Trooper','tex.charui_trooperranger.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('HOTHLEIA','Rebel Officer Leia Organa','tex.charui_leiahoth.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('RESISTANCEPILOT','Resistance Pilot','tex.charui_resistancepilot.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('RESISTANCETROOPER','Resistance Trooper','tex.charui_resistancetrooper.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('REYJEDITRAINING','Rey (Jedi Training)','tex.charui_rey_tlj.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('REY','Rey (Scavenger)','tex.charui_reyjakku.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ROSETICO','Rose Tico','tex.charui_rose.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ROYALGUARD','Royal Guard','tex.charui_royalguard.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SABINEWRENS3','Sabine Wren','tex.charui_sabine_s3.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SAVAGEOPRESS','Savage Opress','tex.charui_savageopress.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SCARIFREBEL','Scarif Rebel Pathfinder','tex.charui_rebel_scarif.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SHORETROOPER','Shoretrooper','tex.charui_troopershore.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SITHASSASSIN','Sith Assassin','tex.charui_sithassassin.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SITHMARAUDER','Sith Marauder','tex.charui_sithmarauder.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SITHTROOPER','Sith Trooper','tex.charui_sithtrooper.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SNOWTROOPER','Snowtrooper','tex.charui_troopersnow.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('STORMTROOPER','Stormtrooper','tex.charui_trooperstorm.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('STORMTROOPERHAN','Stormtrooper Han','tex.charui_trooperstorm_han.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SUNFAC','Sun Fac','tex.charui_geonosian_sunfac.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('T3_M4','T3-M4','tex.charui_t3m4.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('TALIA','Talia','tex.charui_nightsister_talia.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('TEEBO','Teebo','tex.charui_ewok_teebo.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('TIEFIGHTERPILOT','TIE Fighter Pilot','tex.charui_tiepilot.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('TUSKENRAIDER','Tusken Raider','tex.charui_tuskenraider.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('TUSKENSHAMAN','Tusken Shaman','tex.charui_tuskenshaman.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('UGNAUGHT','Ugnaught','tex.charui_ugnaught.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('URORRURRR','URoRRuR''R''R','tex.charui_urorrurrr.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('YOUNGCHEWBACCA','Vandor Chewbacca','tex.charui_chewbacca_vandor.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SMUGGLERCHEWBACCA','Veteran Smuggler Chewbacca','tex.charui_tfa_chewbacca.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('SMUGGLERHAN','Veteran Smuggler Han Solo','tex.charui_tfa_han.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('VISASMARR','Visas Marr','tex.charui_visas.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('WAMPA','Wampa','tex.charui_wampa.png',0,'Dark Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('WEDGEANTILLES','Wedge Antilles','tex.charui_rebelpilot_wedge.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('WICKET','Wicket','tex.charui_ewok_wicket.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('YOUNGHAN','Young Han Solo','tex.charui_han_young.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('YOUNGLANDO','Young Lando Calrissian','tex.charui_younglando.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ZAALBAR','Zaalbar','tex.charui_zaalbar.png',0,'Light Side');
insert into Staging_Characters (Base_ID, Name, Image, Power, Alignment) values ('ZAMWESELL','Zam Wesell','tex.charui_zamwesell.png',0,'Dark Side');



/*
Drop Procs if they exist
*/

DROP PROCEDURE IF EXISTS usp_GuildList;
DROP PROCEDURE IF EXISTS usp_ReturnWebHookURL; 


/*
All procs will start with usp_  (User Stored Procedure, its a habbit)
This will return the list all the Guilds Names and their Guild ID, ordered alphabatically.
This will most likely be used for the Guild Headings or Dropdown.  If DDL, ID should be Value.
*/

CREATE PROCEDURE usp_GuildList() NOT DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER 
SELECT EmpGuiId, EmpGuiDisplayName FROM EmpireGuild WHERE 1 order by EmpGuiDisplayName;


/*
This will return the WebHook URL.  Currently meant to be used with my TB Bots.
Pass in the GUild ID, and Webhook ID
*/

CREATE PROCEDURE usp_ReturnWebHookURL(IN `EmpGuiId` INT, IN `WebHooId` INT) NOT 
DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER SELECT EmGWeHURL FROM `EmpireGuildWebHook` WHERE 
EmpireGuildEmpGuiId = EmpGuiId and WebHookWebHooId = WebHooId;


/*
Work on this.  


CREATE PROC usp_DataMove_Characters() NOT DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER 

INSERT INTO t1 (a, b)
  SELECT Base_ID, Name, Image, Power, Alignment FROM t2
  UNION
  SELECT e, f FROM t3
ON DUPLICATE KEY UPDATE b = b + c;
*/






/*
Examples on how to use the procs. Webhook gets Rav TW Webhook.
*/
CALL usp_GuildList();
CALL usp_ReturnWebHookURL (26040,1);










