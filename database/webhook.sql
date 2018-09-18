DROP TABLE EmpireGuild;
CREATE TABLE EmpireGuild 
(
    EmpGuiId int 
    , EmpGuiDisplayName VARCHAR(50)
    , EmpGuiColor_Dec int
    , primary key (EmpGuiId)
);

insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (25666,'Chimaera',16007746);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (26170,'Devastator',0);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (26453,'Eclipse',0);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (44009,'Executor',0);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (33287,'Nemesis',0);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (15981,'Perilous',0);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (5973,'Predator',0);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (26040,'Ravager',65280);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (26384,'Reaper',12632256);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (36289,'Vanguard',65535);
insert into EmpireGuild (EmpGuiId, EmpGuiDisplayName, EmpGuiColor_Dec) values (35846,'Vengeance',8421568);

DROP TABLE WebHook;
CREATE TABLE WebHook
(
    WebHooId int AUTO_INCREMENT
    , WebHooType VARCHAR(50)
    , primary key (WebHooId)
);

insert into WebHook (WebHooType) values ('TB');
insert into WebHook (WebHooType) values ('TW');
insert into WebHook (WebHooType) values ('Raid');

DROP TABLE EmpireGuildWebHook;
CREATE TABLE EmpireGuildWebHook
(
    EmGWeHId int AUTO_INCREMENT
    , EmpireGuildEmpGuiId int
    , WebHookWebHooId int
    , EmGWeHURL VARCHAR(100)
    , primary key (EmGWeHId)
);

insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (44009,1,'https://discordapp.com/api/webhooks/481263923262128148/tJxH-3cxNDamcLPMKC_yGMXS0ILHP8ssIqrXqur4PlOEix2vJCVEJQSI13QgLwBK4LjY');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26040,1,'https://discordapp.com/api/webhooks/478579983028322304/96t8ant1OLb0b_ER98K-ty4x5QSR48j0u6CqmRInu0vahF_ZGljytTdGjnjdZgc6U7qj');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (26384,1,'https://discordapp.com/api/webhooks/485131110599098369/7jU_GtFWyQrVduj8rbYWWnRVkg_IQKR821MkU__JKs3m8A9htvhu8ukn-WuucSgoBYC9');
insert into EmpireGuildWebHook (EmpireGuildEmpGuiId, WebHookWebHooId, EmGWeHURL) values (36289,1,'https://discordapp.com/api/webhooks/383281809678401538/ugGpx5Ii4EROKKM-4pu2qYk-tHIWJx_TjLdcYFVOyzxdGme4naYZUylIUl-VZ0m_JAqr');

DROP PROCEDURE IF EXISTS usp_GuildList;

CREATE PROCEDURE usp_GuildList() NOT DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER SELECT EmpGuiId, EmpGuiDisplayName FROM EmpireGuild WHERE 1 order by EmpGuiDisplayName

CALL usp_GuildList();