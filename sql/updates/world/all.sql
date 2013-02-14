UPDATE `version` SET `db_version`='TDB 335.50', `cache_id`=50 LIMIT 1;
UPDATE `game_event` SET `start_time`='2013-01-27 00:01:00',`length`=20160 WHERE `eventEntry`=7; -- Lunar Festival
UPDATE `game_event` SET `start_time`='2013-02-10 00:01:00' WHERE `eventEntry`=8;  -- Love is in the Air
UPDATE `game_event` SET `start_time`='2013-03-31 00:01:00' WHERE `eventEntry`=9;  -- Noblegarden
UPDATE `game_event` SET `start_time`='2013-04-28 00:01:00' WHERE `eventEntry`=10; -- Children's Week
UPDATE `game_event` SET `start_time`='2013-06-21 00:01:00' WHERE `eventEntry`=1;  -- Midsummer Fire Festival
UPDATE `game_event` SET `start_time`='2013-09-13 00:01:00' WHERE `eventEntry`=11; -- Harvest Festival
UPDATE `game_event` SET `start_time`='2013-09-19 00:01:00' WHERE `eventEntry`=50; -- Pirates' Day
UPDATE `game_event` SET `start_time`='2013-09-20 00:01:00' WHERE `eventEntry`=24; -- Brewfest
UPDATE `game_event` SET `start_time`='2013-10-18 01:00:00' WHERE `eventEntry`=11; -- Hallow's End
UPDATE `game_event` SET `start_time`='2013-11-01 01:00:00' WHERE `eventEntry`=51; -- Day of the Dead
UPDATE `game_event` SET `start_time`='2013-11-24 01:00:00' WHERE `eventEntry`=26; -- Pilgrim's Bounty
UPDATE `game_event` SET `start_time`='2013-12-15 06:00:00' WHERE `eventEntry`=2;  -- Winter Veil
RENAME TABLE ip2nationcountries TO ip2nationcountries_temp,
             ip2nationcountries_temp TO ip2nationCountries;
-- Valves
UPDATE `gameobject` SET `spawntimesecs`=300,`animprogress`=100,`state`=1 WHERE `guid`=151895;
UPDATE `gameobject` SET `spawntimesecs`=300,`animprogress`=100 WHERE `guid`=221;

-- Max Blasto: Spawn point
UPDATE `event_scripts` SET `x`=4029.0,`y`=4883.078,`z`=-12.71482,`o`=1.310609 WHERE `id`=17207 AND `command`=10 AND `datalong`=25832;
-- Max Blasto: SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25832;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25832 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`action_type`,`action_param1`,`target_type`,`target_param1`,`comment`) VALUE
(25832,0,54,49,0,21,20,'Max Blasto - Just summoned - Start attack'),
(25832,1,4,1,0,0,0,'Max Blasto - On aggro - Say');
-- Max Blasto: Texts
DELETE FROM `creature_text` WHERE `entry`=25832;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`probability`,`comment`) VALUE
(25832,0,0,'I am the herald of Mechazod. You will be decursed!',12,100,'Max Blasto - Just summoned'); -- Proofed from video: https://www.youtube.com/watch?v=-hi6a70U3gM

-- The Grinder: Spawn point
UPDATE `event_scripts` SET `x`=3781.2,`y`=4832.596,`z`=-13.04141,`o`=5.141372 WHERE `id`=17208 AND `command`=10 AND `datalong`=25833;
-- The Grinder: SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25833;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25833 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`action_type`,`action_param1`,`target_type`,`target_param1`,`comment`) VALUE
(25833,0,54,49,0,21,20,'The Grinder - Just summoned - Start attack'),
(25833,1,4,1,0,0,0,'The Grinder - On aggro - Say');
-- The Grinder: Texts
DELETE FROM `creature_text` WHERE `entry`=25833;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`probability`,`comment`) VALUE
(25833,0,0,'Your meddling is at an end. Mechazod will relieve your curse once I am done with you.',12,100,'The Grinder - Just summoned');

-- ED-210: Spawn point
UPDATE `event_scripts` SET `x`=4208.38,`y`=4807.071,`z`=-12.7529,`o`=5.809316 WHERE `id`=16909 AND `command`=10 AND `datalong`=25831;
-- ED-210: SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25831;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25831 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`action_type`,`action_param1`,`target_type`,`target_param1`,`comment`) VALUE
(25831,0,54,49,0,21,20,'ED-210 - Just summoned - Start attack'),
(25831,1,4,1,0,0,0,'ED-210 - On aggro - Say');
-- ED-210: Texts
DELETE FROM `creature_text` WHERE `entry`=25831;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`probability`,`comment`) VALUE
(25831,0,0,'ED-210 online!',12,100,'ED-210 - Just summoned');

-- Twonky: Spawn point
UPDATE `event_scripts` SET `x`=4118.113,`y`=5087.803,`z`=-1.433036,`o`=2.253069 WHERE `id`=16904 AND `command`=10 AND `datalong`=25830;
-- Twonky: SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25830;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25830 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`action_type`,`action_param1`,`target_type`,`target_param1`,`comment`) VALUE
(25830,0,54,49,0,21,20,'Twonky - Just summoned - Start attack'),
(25830,1,4,1,0,0,0,'Twonky - On aggro - Say');
-- Twonky: Texts
DELETE FROM `creature_text` WHERE `entry`=25830;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`probability`,`comment`) VALUE
(25830,0,0,'Twonky!',12,100,'Twonky - On aggro');
SET @CGUID :=43501;
SET @ENTRY :=25233; -- Lunk-tusk

UPDATE `creature_template` SET `unit_flags`=33536 WHERE `entry`=@ENTRY;

DELETE FROM `creature` WHERE `id`=@ENTRY;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID, @ENTRY, 571, 1, 1, 1230.617, -3349.278, 203.7188, 3.385939, 120, 0, 0);

DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@ENTRY, 0, 0x1, 0x1, '');
-- Vilebranch Speaker
UPDATE `creature_template` SET `AIName`= '', `ScriptName`= 'mob_vilebranch_speaker' WHERE `entry`=11391;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=11391;

-- NPC talk text for Bloodlord Mandokir from sniff
DELETE FROM `creature_text` WHERE `entry`=11382 AND `groupid`=4;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(11382,4,0, '%s goes into a rage after seeing his raptor fall in battle!',16,0,100,0,0,0, 'Bloodlord Mandokir - Ohgan Dead');

-- Bloodlord Mandokir path from sniff
SET @PATH := 492861;
DELETE FROM `creature_template_addon` WHERE `entry`=11382;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`bytes2`,`auras`) VALUES (11382,@PATH,1, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12312.66,-1889.255,131.5301,0,1,0,100,0),
(@PATH,2,-12368.16,-1861.005,131.5301,0,1,0,100,0),
(@PATH,3,-12352.66,-1875.505,131.5301,0,1,0,100,0),
(@PATH,4,-12351.41,-1876.505,130.7801,0,1,0,100,0),
(@PATH,5,-12347.41,-1877.505,131.0301,0,1,0,100,0),
(@PATH,6,-12343.16,-1877.505,131.2801,0,1,0,100,0),
(@PATH,7,-12334.91,-1879.755,131.5301,0,1,0,100,0),
(@PATH,8,-12329.91,-1889.505,131.0301,0,1,0,100,0),
(@PATH,9,-12328.66,-1892.255,131.0301,0,1,0,100,0),
(@PATH,10,-12326.41,-1894.255,131.2801,0,1,0,100,0),
(@PATH,11,-12318.16,-1896.255,131.2801,0,1,0,100,0),
(@PATH,12,-12301.41,-1896.255,131.5301,0,1,0,100,0),
(@PATH,13,-12293.16,-1899.005,131.7801,0,1,0,100,0),
(@PATH,14,-12292.16,-1899.005,131.7801,0,1,0,100,0),
(@PATH,15,-12291.16,-1899.005,131.7801,0,1,0,100,0),
(@PATH,16,-12289.41,-1900.505,131.7801,0,1,0,100,0),
(@PATH,17,-12287.41,-1902.505,131.7801,0,1,0,100,0),
(@PATH,18,-12285.41,-1904.755,131.7801,0,1,0,100,0),
(@PATH,19,-12280.66,-1906.755,131.7801,0,1,0,100,0),
(@PATH,20,-12276.41,-1907.755,131.7801,0,1,0,100,0),
(@PATH,21,-12275.41,-1908.755,131.7801,0,1,0,100,0),
(@PATH,22,-12272.41,-1917.255,131.7801,0,1,0,100,0),
(@PATH,23,-12268.16,-1921.255,131.5301,0,1,0,100,0),
(@PATH,24,-12259.91,-1919.255,131.0301,0,1,0,100,0),
(@PATH,25,-12255.66,-1919.255,130.5301,0,1,0,100,0);
UPDATE `game_event` SET `start_time`='2013-10-18 01:00:00' WHERE `eventEntry`=12; -- Hallow's End
-- Reconnaissance Flight (12671)

SET @QUEST          := 12671;
SET @PLANE          := 28710; -- Vic's Flying Machine
SET @PILOT          := 28646; -- Pilot Vic
SET @VIC            := 28746; -- Pilot Vic
SET @SPELL_PLANE    := 52256; -- Vic's Flying Machine Validate (must have condition to target player)
SET @SPELL_ROCKETS  := 52254; -- Air-to-Air Rockets
SET @NPC_SCREECHER  := 28170; -- Frosthowl Screecher
SET @TEMP_LANDING   := 300215; -- TEMP Landing Pad

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@VIC;
UPDATE `creature_template` SET `spell1`='52254',`spell2`='52226',`ScriptName`='npc_vics_flying_machine' WHERE `entry`=@PLANE;

DELETE FROM `creature_template_addon` WHERE `entry`=@PLANE;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@PLANE,0,0,0,1,0,'52211 52260'); -- Flight -- Vic's Flying Machine Aggro Periodic

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@VIC,@PLANE) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@VIC,0,0,0,19,0,100,0,@QUEST,0,0,0,11,@SPELL_PLANE,0,0,0,0,0,7,0,0,0,0,0,0,0,"On quest accept - Cast spell - Invoker");

DELETE FROM `waypoint_data` WHERE `id`=@PLANE;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PLANE,1,5494.87,4747.031,-187.8783,0,0,0,0,100,0),
(@PLANE,2,5485.906,4740.681,-184.5172,0,0,0,0,100,0),
(@PLANE,3,5472.882,4732.441,-172.1562,0,0,0,0,100,0),
(@PLANE,4,5460.913,4712.542,-157.8784,0,0,0,0,100,0),
(@PLANE,5,5452.147,4673.518,-137.8906,0,0,0,0,100,0),
(@PLANE,6,5449.777,4630.711,-126.6684,0,0,0,0,100,0),
(@PLANE,7,5507.432,4506.089,-126.6684,0,0,0,0,100,0),
(@PLANE,8,5586.811,4465.319,-126.6684,0,0,0,0,100,0),
(@PLANE,9,5676.111,4437.874,-126.6684,0,0,0,0,100,0),
(@PLANE,10,5756.449,4391.051,-91.25155,0,0,0,0,100,0),
(@PLANE,11,5817.163,4269.269,-91.25155,0,0,0,0,100,0),
(@PLANE,12,5856.145,4202.824,-68.29334,0,0,0,0,100,0),
(@PLANE,13,5921.523,4105.534,-68.29334,0,0,0,0,100,0),
(@PLANE,14,5995.021,4029.883,-13.97897,0,0,0,0,100,0),
(@PLANE,15,6118.298,3883.733,94.11866,0,0,0,0,100,0),
(@PLANE,16,6132.932,3750.75,176.5123,0,0,0,0,100,0),
(@PLANE,17,6165.863,3748.196,198.9567,0,0,0,0,100,0),
(@PLANE,18,6208.277,3782.189,196.8455,0,0,0,0,100,0),
(@PLANE,19,6227.615,3836.871,191.6234,0,0,0,0,100,0),
(@PLANE,20,6218.483,3885.17,191.6234,0,0,0,0,100,0),
(@PLANE,21,6197.045,3890.053,191.6234,0,0,0,0,100,0),
(@PLANE,22,6168.752,3864.161,191.6234,0,0,0,0,100,0),
(@PLANE,23,6204.037,3807.239,191.6234,0,0,0,0,100,0),
(@PLANE,24,6232.975,3820.852,191.6234,0,0,0,0,100,0),
(@PLANE,25,6219.879,3854.341,166.6234,0,0,0,0,100,0),
(@PLANE,26,6210.428,3855.185,154.4848,0,0,0,0,100,0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@PLANE;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@PLANE,46598,1,1);

DELETE FROM `vehicle_template_accessory` WHERE `entry`=@PLANE;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(@PLANE,@PILOT,0,1,'Pilot Vic',7,0);

DELETE FROM `creature_text` WHERE `entry` IN (@PILOT,@PLANE);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@PILOT,0,0,'We''re off!  Watch out for those vines!',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PILOT,1,0,'Looks like the Scourge have hit the area ahead pretty bad...',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PILOT,2,0,'You see that?  She''s... huge!',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PILOT,3,0,'Here we go!  Hold on tight -- there''s rough wind ahead!',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PILOT,4,0,'The glacier is seeping in from Icecrown... and undead everywhere!  Wait ''til the professor gets a hold of this!',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PILOT,5,0,'They''re coming at us!  Be quick with those rockets!',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PILOT,6,0,'Aggggh!  I''m hit!  You''re going to have to get us back!  Quick, before the plane explodes!',12,0,100,0,0,0,'Pilot Vic to Vic''s Flying Machine'),
(@PLANE,0,0,'The engine''s blown!  Fly Vic''s Flying Machine back to Lakeside Landing!',41,0,100,0,0,0,'Vic''s Flying Machine to Pilot Vic');

DELETE FROM `conditions` WHERE `SourceEntry`=@SPELL_ROCKETS AND `SourceTypeOrReferenceId`=13;
DELETE FROM `conditions` WHERE `SourceEntry`=52226 AND `SourceTypeOrReferenceId`=17;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_ROCKETS,0,0,31,0,3,28170,0,0,0,0,'','Air-to-Air Rockets can target Frosthowl Screecher'),
-- because vehicles ignore spell focus we add an extra condition to fill in for this
(17,0,52226,0,0,30,0,300215,10,0,0,0,0,'','Requires TEMP Landing Pad near to cast Land Flying Machine');

-- guessed position
DELETE FROM `gameobject` WHERE `id`=@TEMP_LANDING;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(3552,@TEMP_LANDING,571,1,1,5505.58,4748.35,-194.434,0,0,0,0,0,300,0,1);

-- Frosthowl Screecher
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_SCREECHER;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@NPC_SCREECHER;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_SCREECHER;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_SCREECHER,0,0,0,0,0,100,0,3000,4000,3000,4000,11,52257,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt');
UPDATE `game_event` SET `start_time`='2013-09-13 00:01:00' WHERE `eventEntry`=11; -- Harvest Festival
DELETE FROM `creature_addon` WHERE guid=49286;
DELETE FROM `spell_script_names` WHERE `spell_id`=24314;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(24314, 'spell_threatening_gaze');
-- Add some missing go gossip
DELETE FROM `gossip_menu` WHERE `entry` IN (6448,6449,6450,6451);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(6448,7669),(6449,7670),(6450,7673),(6451,7674);
-- Text for Crushridge Warmonger
SET @ENTRY := 2287;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Raaar!!! Me smash $R',12,0,100,0,0,0,'Crushridge Warmonger'),
(@ENTRY,0,1,'Me smash! You die!',12,0,100,0,0,0,'Crushridge Warmonger'),
(@ENTRY,0,2,'I''ll crush you!',12,0,100,0,0,0,'Crushridge Warmonger');
-- proper faction for Bran in Halls of Stone
UPDATE `creature_template` SET `faction_A`=1665,`faction_H`=1665 WHERE `entry` IN (28070,31366);
-- Spawn 4 missing Zul'Gurub Panther Triggers
SET @GUID := 48311;
DELETE FROM `creature` WHERE `guid` IN (@GUID,@GUID+1,@GUID+2,@GUID+3);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`, `position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID,15091,309,1,1,0,0,-11518.29,-1649.965,41.38264,5.131268,7200,0,0,1,0,0,0,0,0),
(@GUID+1,15091,309,1,1,0,0,-11518.51,-1649.303,41.38264,5.864306,7200,0,0,1,0,0,0,0,0),
(@GUID+2,15091,309,1,1,0,0,-11518.46,-1651.542,41.38264,0.2617994,7200,0,0,1,0,0,0,0,0),
(@GUID+3,15091,309,1,1,0,0,-11516.86,-1604.25,41.38264,5.288348,7200,0,0,1,0,0,0,0,0);
SET @BRANN  := 29579;
SET @SNOW_TARGET := 29599;
SET @QUEST  := 12920;
SET @GOSSIP := 9853;

UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP, `minlevel`=80,`maxlevel`=80,`npcflag`=`npcflag`|1,`unit_flags`=`unit_flags`|32776, `AIName` = 'SmartAI', `equipment_id`=2485 WHERE `entry`=@BRANN;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`=@SNOW_TARGET;
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=26356;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@BRANN,@SNOW_TARGET);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@BRANN,0,0,2,0, ''),
(@SNOW_TARGET,0,0,1,0, '54717');
DELETE FROM `creature_equip_template` WHERE `entry`=2485;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(2485,0,0,25972);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@BRANN;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@BRANN,46598,1,1);
DELETE FROM `vehicle_template_accessory` WHERE `entry`=@BRANN;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(@BRANN,@SNOW_TARGET,0,1,'Brann Snow Target',7,0);

DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=13641;
DELETE FROM `gossip_menu` WHERE `entry`=10145 AND `text_id`=14089;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GOSSIP,13641),(10145,14089);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id` IN (0,1);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,0,'Do you understand me? We should be able to understand each other now.',1,1,0,0,0,0,''),
(@GOSSIP,1,0,'What kind of help do you require?',1,1,10145,0,0,0,'');

DELETE FROM `creature_text` WHERE `entry`=@BRANN;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@BRANN,0,0,"I... I can understand you now! Well, now that we can talk to each other, you have some explaining to do!",12,0,100,5,0,0,'Brann Bronzebeard text0'),
(@BRANN,1,0,"How did you get my communicator from the Explorers League?",12,0,100,5,0,0,'Brann Bronzebeard text1'),
(@BRANN,2,0,"If the Explorers League sent men, I didn't see any trace of them. I found your note buried in a camp overrun by iron dwarves.",12,0,100,0,0,0,'Player text2'),
(@BRANN,3,0,"You have my thanks for dispatching the iron dwarves. But why would the Horde have an interest in me?",12,0,100,6,0,0,'Brann Bronzebeard text3'),
(@BRANN,4,0,"A scout found the remains of your journal in Thor Modan. We've been looking for you ever since.",12,0,100,0,0,0,'Player text4'),
(@BRANN,5,0,"That wouldn't be Scout Vor'takh, would it? Even I know of his reputation for ruthlessness. He means to abduct me, then?",12,0,100,5,0,0,'Brann Bronzebeard text5'),
(@BRANN,6,0,"If you've seen the journal, then you know what I've been discovering. The titans' own creations are at war with each other!",12,0,100,5,0,0,'Brann Bronzebeard text6'),
(@BRANN,7,0,"Loken and his iron dwarf minions have ousted the Earthen from Ulduar and taken over the city.",12,0,100,5,0,0,'Brann Bronzebeard text7'),
(@BRANN,8,0,"If we spend our time and strength fighting with each other, Loken will use Ulduar's resources to destroy both Horde and Alliance.",12,0,100,6,0,0,'Brann Bronzebeard text8'),
(@BRANN,9,0,"Speak to the commander at your post, lad, and persuade him to abandon Vor'takh's foolish plan.",12,0,100,6,0,0,'Brann Bronzebeard Text10');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@BRANN,@SNOW_TARGET);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@BRANN*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BRANN,0,0,1,62,0,100,0,@GOSSIP,0,0,0,11,55579,2,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard - On gossip select - Spellcast Trigger Brann Signal'),
(@BRANN,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard - On gossip select - Close gossip'),
(@BRANN,0,2,0,8,0,100,0,55578,0,0,0,80,@BRANN*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On spellhit Brann Signal to Self - Start script'),
(@SNOW_TARGET,0,0,0,11,0,100,0,0,0,0,0,3,0,26241,0,0,0,0,1,0,0,0,0,0,0,0,'Brann Snow Target - On spawn - Morph to model'),
(@BRANN*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text0'),
(@BRANN*100,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text0'),
(@BRANN*100,9,2,0,0,0,100,0,3100,3100,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,'Brann Bronzebeard script - Play emote point'),
(@BRANN*100,9,3,0,0,0,100,0,3200,3200,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text1'),
(@BRANN*100,9,4,0,0,0,100,0,5600,5600,0,0,84,2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Player say text2'),
(@BRANN*100,9,5,0,0,0,100,0,6300,6300,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text3'),
(@BRANN*100,9,6,0,0,0,100,0,7200,7200,0,0,84,4,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Player say text4'),
(@BRANN*100,9,7,0,0,0,100,0,6400,6400,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text5'),
(@BRANN*100,9,8,0,0,0,100,0,7200,7200,0,0,1,6,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text6'),
(@BRANN*100,9,9,0,0,0,100,0,7200,7200,0,0,1,7,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text7'),
(@BRANN*100,9,10,0,0,0,100,0,7200,7200,0,0,1,8,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text8'),
(@BRANN*100,9,11,0,0,0,100,0,7100,7100,0,0,1,9,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Say text9'),
(@BRANN*100,9,12,0,0,0,100,0,3000,3000,0,0,33,@BRANN,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brann Bronzebeard script - Quest credit');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=55578;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,55578,0,31,3,@BRANN,0,0,'', 'Spell Brann Signal to Self targets Brann'),
(15,@GOSSIP,0,0,9,@QUEST,0,0,0,'', 'Show gossip menu option if player has quest 12920'),
(15,@GOSSIP,1,0,9,12926,0,0,0,'', 'Show gossip menu option if player has quest 12926');
-- remove auras that are already applied in SAI
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry` IN (
215, -- Defias Night Runner
579, -- Shadowhide Assassin
938, -- Kurzen Commando
1040, -- Fen Creeper
8550, -- Shadowmage
9299, -- Gaeriyan
10414, -- Patchwork Horror
10426, -- Crimson Inquisitor
10471, -- Scholomance Acolyte
11885, -- Blighthound
16017, -- Patchwork Golem
16375, -- Sewage Slime
21080, -- Dormant Infernal
22853, -- Illidari Defiler
24818, -- Anvilrage Taskmaster
25596, -- Infected Kodo Beast
25781, -- Oil Pool
26624, -- Wretched Belcher
26782, -- Crystalline Keeper
28161); -- Chicken Escapee
-- delete 632 creature_template_addon data that contain no information (bytes2=1 is the default)
DELETE FROM `creature_template_addon` WHERE `entry` IN (
890, -- Fawn
6827, -- Crab
8996, -- Voidwalker Minion
9396, -- Ground Pounder
10928, -- Succubus Minion
15475, -- Beetle
15547, -- Spectral Charger
15548, -- Spectral Stallion
15974, -- Dread Creeper
15975, -- Carrion Spinner
15979, -- Tomb Horror
16017, -- Patchwork Golem
16020, -- Mad Scientist
16021, -- Living Monstrosity
16022, -- Surgical Assistant
16025, -- Stitched Giant
16030, -- Maggot
16036, -- Frenzied Bat
16037, -- Plagued Bat
16056, -- Diseased Maggot
16057, -- Rotting Maggot
16067, -- Deathcharger Steed
16068, -- Larva
16137, -- Naxxramas Military Sub-Boss Trigger
16145, -- Death Knight Captain
16154, -- Risen Squire
16156, -- Dark Touched Warrior
16165, -- Necro Knight
16171, -- Coldmist Widow
16173, -- Shadowbat
16174, -- Greater Shadowbat
16175, -- Vampiric Shadowbat
16176, -- Shadowbeast
16177, -- Dreadbeast
16178, -- Phase Hound
16194, -- Unholy Axe
16211, -- Naxxramas Combat Dummy
16215, -- Unholy Staff
16216, -- Unholy Swords
16244, -- Infectious Ghoul
16297, -- Mutated Grub
16375, -- Sewage Slime
16412, -- Ghostly Baker
16459, -- Wanton Hostess
16460, -- Night Mistress
16481, -- Ghastly Haunt
16482, -- Trapped Soul
16485, -- Arcane Watchman
16488, -- Arcane Anomaly
16489, -- Chaotic Sentience
16491, -- Mana Feeder
16492, -- Syphoner
16506, -- Naxxramas Worshipper
16525, -- Spell Shade
16529, -- Magical Horror
16530, -- Mana Warp
16539, -- Homunculus
16545, -- Ethereal Spellfilcher
16595, -- Fleshbeast
17260, -- Nightbane Helper Target
17316, -- Chess Square, OUTSIDE BLACK (DND)
17467, -- Skunk
17644, -- Infernal Target
17645, -- Infernal Relay
17660, -- Skeletal Gryphon
18955, -- Camera Shaker - 30-90 seconds
20061, -- Frostbite Invisible Stalker
21080, -- Dormant Infernal
21728, -- Skettis Surger
21804, -- Skettis Kaliri
21921, -- Chess - Sound Bunny
22519, -- Chess Piece: Karazhan Invisible Stalker
22520, -- Chess Piece: Status Bar
22523, -- Karazhan - Chess, Victory Dummy Tool
22986, -- Skettis - Invis Raven Stone
22991, -- Monstrous Kaliri Egg Trigger
23225, -- Netherwing Drake Escape Point
23638, -- Longtusk Fisherman
23643, -- Unstable Mur'ghoul
23644, -- Mur'ghoul Flesheater
23645, -- Mur'ghoul Corrupter
23667, -- Winterskorn Rune-Seer
23668, -- Winterskorn Rune-Caster
23669, -- Winterskorn Oracle
23670, -- Winterskorn Elder
23674, -- Iron Rune Sage
23677, -- Frost Nymph
23678, -- Chill Nymph
23755, -- Blockade Pirate
23771, -- Blockade Cannon
23809, -- Vengeance Landing Cannoneer
23810, -- Blockade Explosion Bunny
23821, -- Valgarde Harpoon Target
23867, -- Vengeance Landing Combatant Trigger
23870, -- Ember Clutch Ancient
23874, -- Thornvine Creeper
23876, -- Spore
23884, -- Vengeance Landing Crossbow Trigger
23885, -- Lyana Trigger
23886, -- Bull Lion Seal
23887, -- Lion Seal
23915, -- Westguard Cannon Trigger
23916, -- Westguard Cannon Trigger (Water)
23917, -- Cannon Source Trigger
23919, -- Ice Elemental
23929, -- Giant Tidecrawler
23930, -- Trained Plaguehound
23934, -- North Fleet Salvager
24076, -- Winterskorn Worg
24082, -- Proto-Drake Handler
24084, -- Tunneling Ghoul
24104, -- New Agamand Deathguard
24110, -- ELM General Purpose Bunny Large
24174, -- Fjord Rat
24177, -- Decomposing Ghoul
24182, -- Winterskorn Dwelling Credit
24184, -- Winterskorn Barracks Credit
24340, -- Rampaging Earth Elemental
24439, -- Sack of Relics
24440, -- Gjalerbron Gargoyle
24469, -- Magnataur Huntress
24562, -- Nerub'ar Invader
24567, -- Den Vermin
24613, -- Mammoth Calf
24614, -- Wooly Mammoth
24633, -- Rabid Brown Bear
24635, -- Dragonflayer Harpooner
24637, -- Great Reef Shark
24642, -- Drunken Northsea Pirate
24653, -- Flying Machine
24673, -- Frostwing Chimaera
24676, -- Crazed Northsea Slaver
24677, -- Spearfang Worg
24681, -- Island Shoveltusk
24694, -- Vrykul Harpoon Gun (Wyrmskull)
24846, -- Iron Dwarf
24862, -- Mage Hunter Target
24863, -- Frosthorn Kid
24871, -- Risen Vrykul Ancestor
24872, -- Blood Shade
24883, -- Rodin Lightning Enabler
24901, -- Maddened Frosthorn
25198, -- Winterfin Gatherer
25201, -- Winterfin Tadpole
25204, -- Glimmer Bay Orca
25215, -- Winterfin Shorestriker
25216, -- Winterfin Oracle
25217, -- Winterfin Warrior
25225, -- Practice Dummy
25350, -- Risen Longrunner
25351, -- Ghostly Sage
25355, -- Beryl Hound
25362, -- Warsong Swine
25377, -- Brittle Skeleton
25378, -- En'kilah Necromancer
25383, -- En'kilah Abomination
25390, -- En'kilah Hatchling
25391, -- En'kilah Focus Crystal
25393, -- En'kilah Ghoul
25396, -- Naxxanar Skeletal Mage
25415, -- Enraged Tempest
25417, -- Raging Boiler
25419, -- Boiling Spirit
25422, -- Mystical Webbing
25428, -- Magmoth Shaman
25429, -- Magmoth Forager
25431, -- Kaskala Ancestor
25432, -- Mate of Magmothregar
25433, -- Offspring of Magmothregar
25452, -- Scourged Mammoth
25454, -- Tundra Crawler
25464, -- Bloodspore Moth
25468, -- Bloodspore Roaster
25501, -- Gammoth Tender
25534, -- En'kilah Blood Globe
25600, -- Unliving Swine
25610, -- Scourge Prisoner
25615, -- Plagued Magnataur
25623, -- Harvest Collector
25651, -- Cultist Necrolyte
25660, -- Festering Ghoul
25668, -- Vengeful Taunka Spirit
25670, -- ELM General Purpose Bunny (scale x3)
25675, -- Tundra Wolf
25677, -- Borean Frog
25684, -- Talramas Abomination
25685, -- Gorloc Waddler
25686, -- Gorloc Gibberer
25687, -- Gorloc Steam Belcher
25699, -- Gorloc Mud Splasher
25700, -- Gorloc Hunter
25701, -- Gorloc Dredger
25707, -- Magic-bound Ancient
25709, -- Glacial Ancient
25713, -- Blue Drakonid Supplicant
25715, -- Frozen Elemental
25717, -- Coldarra Scalesworn
25718, -- Coldarra Mage Slayer
25719, -- Coldarra Spellbinder
25721, -- Arcane Serpent
25722, -- Coldarra Spellweaver
25724, -- Ascended Mage Hunter
25728, -- Coldarra Wyrmkin
25781, -- Oil Pool
25829, -- Marsh Fawn
25843, -- Northsea Thug
25880, -- Minion of Kaw
25981, -- Scourged Footman
26047, -- Warsong Worg
26126, -- Bone Warrior
26161, -- Farshire Grain Credit
26175, -- Coldarra - Drake Hunt Invisman
26189, -- Fleeing Cultist
26199, -- Snowfall Glade Den Mother
26200, -- Snowfall Glade Pup
26201, -- Snowfall Glade Shaman
26202, -- Ziggurat Defender
26402, -- Anub'ar Ambusher
26411, -- Deranged Indu'le Villager
26413, -- Anub'ar Dreadweaver
26418, -- Longhoof Grazer
26435, -- Taunka Move Trigger
26446, -- Ice Serpent
26455, -- Moonrest Highborne
26458, -- Drakkari Plaguebringer
26461, -- Scourge Corpserender
26472, -- Highland Mustang
26480, -- Magnataur Youngling
26481, -- Magnataur Alpha
26482, -- Arctic Grizzly
26488, -- Taunka Pack Kodo
26492, -- Wastes Digger
26525, -- Cockroach
26555, -- Scourge Hulk
26606, -- Anub'ar Slayer
26624, -- Wretched Belcher
26625, -- Darkweb Recluse
26628, -- Drakkari Scytheclaw
26636, -- Risen Drakkari Soulmage
26644, -- Ursus Mauler
26646, -- Saronite Horror
26658, -- Reckless Scavenger
26662, -- Azjol-anak Battleguard
26669, -- Ymirjar Savage
26670, -- Ymirjar Flesh Hunter
26675, -- Spider Summon Target
26705, -- Snowplain Disciple
26706, -- Infected Grizzly Bear
26711, -- Injured Mammoth
26712, -- Crystal Channel Target
26728, -- Mage Hunter Initiate
26729, -- Steward
26782, -- Crystalline Keeper
26792, -- Crystalline Protector
26793, -- Crystalline Frayer
26889, -- The End of the Line Area Trigger Kill Credit Bunny
26891, -- Undead Miner
26937, -- Gong Bunny
26948, -- Hulking Atrocity
27165, -- Drained Moonrest Highborne
27230, -- Silvercoat Stag
27247, -- Devout Bodyguard
27254, -- Emerald Lasher
27283, -- Risen Wintergarde Mage
27286, -- Dreadbone Invader
27290, -- Hungering Dead
27358, -- Burning Depths Necromancer
27363, -- Smoldering Geist
27375, -- Risen Gryphon Rider Target
27402, -- Bone Target Bunny
27403, -- Strange Ore Target
27408, -- Duskhowl Prowler
27418, -- Rothin's Spell Bunny
27421, -- Fern Feeder Moth
27438, -- Rainbow Trout
27449, -- Neltharion's Flame Fire Bunny
27452, -- Invisible Stalker Grizzly Hills
27460, -- Mother of Bambina
27496, -- Refurbished Shredder
27513, -- Covetous Geist
27551, -- Enraged Apparition
27552, -- Reanimated Noble
27607, -- Plague Wagon
27633, -- Azure Inquisitor
27635, -- Azure Spellbinder
27636, -- Azure Ley-Whelp
27639, -- Ring-Lord Sorceress
27640, -- Ring-Lord Conjurer
27641, -- Centrifuge Construct
27685, -- Frigid Ghoul Attacker
27686, -- Frigid Geist Attacker
27688, -- Alliance Lumberboat
27689, -- Alliance Lumberboat Explosions
27702, -- Horde Lumberboat
27725, -- Ruby Guardian
27737, -- Risen Zombie
27745, -- Lordaeron Footman
27746, -- Lordaeron Knight
27747, -- High Elf Mage-Priest
27752, -- High Elf Sorceress
27823, -- Naxxramas Dreadguard
27824, -- Naxxramas Shade
27827, -- Grain Crate Helper
27836, -- Wailing Soul
27852, -- Wintergrasp Control Arms
27869, -- Wintergrasp Detection Unit
27909, -- Darkweb Victim
27927, -- Dragonflayer Guardian
27965, -- Dark Rune Shaper
27970, -- Raging Construct
27971, -- Unrelenting Construct
28001, -- Dreadsaber
28002, -- Mangal Crocolisk
28003, -- Bittertide Hydra
28005, -- Wastes Scavenger
28008, -- Galakrond Spell Dummy
28010, -- Stranded Thresher
28011, -- Emperor Cobra
28016, -- Drakuru
28024, -- Rainspeaker Warrior
28025, -- Rainspeaker Oracle
28130, -- Invis Lightning Stalker
28161, -- Chicken Escapee
28169, -- Stratholme Resident
28170, -- Frosthowl Screecher
28202, -- Zul'Drak Rat
28217, -- Injured Rainspeaker Oracle
28218, -- Snowblind Ghoul
28220, -- Frostbitten Corpse
28221, -- Trapdoor Crawler
28231, -- Crystalline Tender
28233, -- Zul'Drak Bat
28234, -- Tribunal of the Ages
28242, -- Risen Reaver
28246, -- Sky Terror
28254, -- Mistwhisper Lightning Target
28268, -- Scourged Argent Footman
28274, -- Plague Sprayer
28277, -- Harry's Bomber
28351, -- Flame Breath Trigger (Skadi)
28367, -- Acherus Dummy
28407, -- Fjord Penguin
28417, -- Priest of Rhunok
28419, -- Frenzied Geist
28440, -- Tundra Penguin
28452, -- Elemental Rift
28466, -- Fruit Tosser
28492, -- Drak'Tharon - Drakuru Event Invisman 00
28498, -- The Lich King
28504, -- Jin'Alai Medicine Man
28519, -- Withered Troll
28523, -- Nass Target KC Bunny
28559, -- Citizen of New Avalon
28560, -- Citizen of New Avalon
28584, -- Unbound Firestorm
28585, -- Slag
28605, -- Havenshire Stallion
28627, -- Wood Pile Dummy
28643, -- Rain of Darkness Dummy
28655, -- Sky Darkener Target
28660, -- Citizen of Havenshire
28662, -- Citizen of Havenshire
28717, -- Overlord Drakuru
28733, -- Anub'ar Shadowcaster
28739, -- Blight Cauldron Bunny 00
28745, -- Alarmed Blightguard
28750, -- Blight Geist
28751, -- Geist WP Bunny
28769, -- Shadowy Tormentor
28778, -- Scourgewagon Bunny
28789, -- Explosion Guy
28804, -- Plague Spreader
28826, -- Stormfury Revenant
28833, -- Scarlet Cannon
28835, -- Stormforged Construct
28839, -- Scarlet Cover Dummy
28850, -- Scarlet Land Cannon
28901, -- Acherus Deathcharger
28903, -- Scourge Plaguehound
28905, -- Gluttonous Geist
28906, -- Scourge Gryphon
28920, -- Stormforged Giant
28931, -- Blightblood Troll
28932, -- Blight Effect Bunny
28935, -- Acherus Dummy
28960, -- Totally Generic Bunny (JSB)
29013, -- Perch Guardian
29026, -- Kolramas Slime
29027, -- Wild Growth Stalker
29036, -- Servant of Freya
29048, -- Ulduar Monitor
29104, -- Scarlet Ballista
29128, -- Anub'ar Prime Guard
29189, -- Howling Geist
29301, -- Camp Winterhoof Wayfarer
29326, -- Ichoron Summon Target
29328, -- Arctic Hare
29392, -- Ravenous Jaws
29395, -- Erekem Guard
29444, -- Drakkari Snake
29449, -- Vargul Deathwaker
29450, -- Vargul Runelord
29452, -- Vargul Blighthound
29461, -- Icetip Crawler
29466, -- Goblin Prisoner
29479, -- Shoveltusk Forager
29483, -- K3 Perimeter Turret
29485, -- Dolomite Giant
29486, -- Tamed Shoveltusk
29487, -- Wild Shoveltusk
29504, -- Seething Revenant
29517, -- Darkmender's Ghoul
29521, -- Unworthy Initiate Anchor
29549, -- Brunnhildar Riding Bear
29551, -- Brunnhildar Bearhandler
29558, -- Frost Giant Target Bunny
29559, -- Lion Seal Whelp
29562, -- Icemaw Bear
29614, -- Onslaught Darkweaver
29630, -- Fanged Pit Viper
29682, -- Slad'ran Summon Target
29697, -- Drakuru Prophet
29700, -- Drakuru Shackles
29710, -- Onslaught Destrier
29730, -- Frostborn Stormrider
29746, -- Databank
29752, -- Databank Core
29774, -- Spitting Cobra
29798, -- Hyldsmeet Proto-Drake
29805, -- Captive Proto Drake Beam Bunny
29811, -- Frostborn Scout
29820, -- Drakkari God Hunter
29822, -- Drakkari Fire Weaver
29826, -- Drakkari Medicine Man
29830, -- Living Mojo
29832, -- Drakkari Golem
29912, -- Obedience Crystal
29920, -- Ruins Dweller
29958, -- Tundra Ram
29960, -- Earthen Stoneguard
30012, -- Victorious Challenger
30046, -- Yulda the Stormspeaker
30066, -- Valkyrion Harpoon Gun
30071, -- Stitched Colossus
30078, -- [DND]Wyrmrest Temple Beam Target
30172, -- Ahn'kahar Swarm Egg
30173, -- Ahn'kahar Guardian Egg
30181, -- Jedoga Controller
30236, -- Argent Cannon
30250, -- Valhalas Vargul
30277, -- Ahn'kahar Slasher
30278, -- Ahn'kahar Spell Flinger
30286, -- Frostbringer
30298, -- Invisible Stalker (Float, Uninteractible, LargeAOI)
30312, -- Shadow Vault Boneguard
30335, -- Shadow Vault Gryphon
30416, -- Bound Fire Elemental
30418, -- Bound Air Elemental
30419, -- Bound Water Elemental
30430, -- Sentry Worg
30576, -- Vile Like Fire! Kill Credit Bunny
30599, -- Vile Like Fire! Fire Bunny
30633, -- Water Terror
30640, -- [DND] Icecrown Airship (A) - Cannon Target
30642, -- Water Terror
30649, -- [DND] Icecrown Airship (H) - Cannon Target
30651, -- [DND] Icecrown Airship (A) - Cannon, Odd
30675, -- Argent Champion
30687, -- Skeletal Constructor
30689, -- Chained Abomination
30701, -- Vile Creeper
30842, -- Wandering Shadow
30845, -- Living Lasher
30848, -- Whispering Wind
30857, -- Defense Dummy Target
30887, -- Scourge Package
30894, -- Lithe Stalker
30897, -- Marnak
30898, -- Kaddrak
30899, -- Abedneum
30900, -- Argent Mason
30920, -- Lumbering Atrocity
30947, -- Eidolon Watcher
30951, -- Restless Lookout
30952, -- Hungering Plaguehound
30960, -- Risen Soldier
30985, -- Summoned Soldier
31041, -- Dispirited Ent
31043, -- Reanimated Crusader
31049, -- Geist Return Bunny
31075, -- Scourge Bomb
31077, -- Safirdrang's Chill Target
31126, -- Agitated Stratholme Citizen
31127, -- Agitated Stratholme Resident
31131, -- Containment Crystal
31140, -- Hulking Abomination
31142, -- Icy Ghoul
31145, -- Shadow Adept
31147, -- Vicious Geist
31150, -- Plagued Fiend
31155, -- Malefic Necromancer
31205, -- Risen Alliance Soldier
31233, -- Sinewy Wolf
31245, -- Invisible Ooze Stalker
31250, -- Ebon Blade Defender
31251, -- Shadow Vault Skirmisher
31262, -- Blight Falconer
31266, -- Shadow Vault Assaulter
31280, -- Ymirheim Spear Gun
31328, -- Fleeing Horde Soldier
31330, -- Fleeing Horde Soldier
31353, -- [DND] Icecrown Airship (N) - Attack Controller
31411, -- Hulking Horror
31438, -- Shadow Vault Abomination
31554, -- Restless Lookout
31556, -- Hungering Plaguehound
31644, -- Cosmetic Trigger - Phase 1 - LAB
31685, -- Borean Marmot
31718, -- Frostbrood Whelp
31731, -- Wyrm Reanimator
31738, -- Cultist Corrupter
31747, -- Necrotic Webspinner
31754, -- Glacial Bonelord
31779, -- Skeletal Archmage
31780, -- Fallen Spiderlord
31783, -- Vrykul Necrolord
31786, -- Oil Slick
31797, -- Ancient Sentinel
31812, -- Decomposed Ghoul
31813, -- Frostskull Magus
31836, -- Blue Dragon Egg
31847, -- Scavenging Geist
31900, -- Scourge Banner-Bearer
31915, -- Horde Transport Dropoff Bunny
32149, -- Fallen Hero's Spirit
32155, -- Destroyed War Machine
32161, -- Scourge War Engineer
32202, -- Desolation KC Bunny
32236, -- Dark Subjugator
32250, -- Overseer Faedris
32255, -- Converted Hero
32257, -- Scourge Converter
32258, -- Gold Beetle
32260, -- Enslaved Minion
32262, -- Shadow Channeler
32264, -- Aldur'thar Channel Bunny
32278, -- Harbinger of Horror
32280, -- Corp'rethar Guardian
32284, -- Scourge Soulbinder
32349, -- Cultist Shard Watcher
32469, -- Ebon Blade Geist
32479, -- Bone Guard
32482, -- Pustulent Colossus
32490, -- Scourge Deathcharger
32498, -- Glacier Penguin
32502, -- Ravaged Ghoul
32505, -- Vargul Wanderer
32507, -- Cultist Acolyte
32520, -- Totally Generic Bunny (All Phase)
32541, -- Initiate's Training Dummy
32542, -- Disciple's Training Dummy
32543, -- Veteran's Training Dummy
32545, -- Initiate's Training Dummy
32546, -- Ebon Knight's Training Dummy
32593, -- Skittering Swarmer
32647, -- Warsong Hold Practice Dummy
32720, -- Violetta
32770, -- Enraged Fleshrender
32771, -- Stitched Brute
32772, -- Skeletal Footsoldier
32874, -- Iron Ring Guard
32875, -- Iron Honor Guard
32879, -- Thorim Controller
32885, -- Captured Mercenary Soldier
32892, -- Thorim Event Bunny
32922, -- Dark Rune Champion
32923, -- Dark Rune Commoner
32924, -- Dark Rune Evoker
32925, -- Dark Rune Warbringer
33140, -- Thorim Golem Right Hand Bunny
33141, -- Thorim Golem Left Hand Bunny
33229, -- Melee Target
33337, -- XT-Toy Pile
33378, -- Thunder Orb
33430, -- Guardian Lasher
33431, -- Forest Swarmer
33500, -- Vezax Bunny
33525, -- Mangrove Ent
33526, -- Ironroot Lasher
33527, -- Nature's Blade
33575, -- Channel Stalker Freya
33661, -- Armsweep Stalker Kologarn
33699, -- Storm Tempered Keeper
33722, -- Storm Tempered Keeper
33772, -- Faceless Horror
33809, -- Rubble Stalker Kologarn
33818, -- Twilight Adherent
33819, -- Twilight Frost Mage
33820, -- Twilight Pyromancer
33822, -- Twilight Guardian
33824, -- Twilight Shadowblade
33838, -- Enslaved Fire Elemental
33856, -- Bot Summon Trigger
34014, -- Sanctum Sentry
34069, -- Molten Colossus
34133, -- Champion of Hodir
34134, -- Winter Revenant
34135, -- Winter Rumbler
34137, -- Winter Jormungar
34144, -- Expedition Mercenary
34145, -- Expedition Engineer
34146, -- Snow Mound (4)
34150, -- Snow Mound (6)
34151, -- Snow Mound (8)
34184, -- Clockwork Mechanic
34190, -- Hardened Iron Golem
34191, -- Trash
34196, -- Rune Etched Sentry
34198, -- Iron Mender
34267, -- Parts Recovery Technician
34271, -- XD-175 Compactobot
34273, -- XB-488 Disposalbot
34300, -- Mature Lasher
34319, -- [DND] Champion Go-To Bunny
34716, -- Captive Aspirant
34907, -- Kvaldir Harpooner
35106, -- Black Knight Caster
35473, -- Argent Tournament Post
35482, -- Hungry Jormungar
36829, -- Deathspeaker High Priest
40091, -- Orb Rotation Focus
40146); -- Halion Controller
UPDATE `creature_text` SET `sound`=5802 WHERE `entry`=4832 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Just...Dust…',`sound`=5803 WHERE `entry`=4832 AND `groupid`=2;
UPDATE `creature_text` SET `text`='Who dares disturb my meditation!' WHERE `entry`=4832 AND `groupid`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=35475;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 7, 35475, 0, 0, 27, 0, 80, 2, 0, 0, 0, 0, '', 'Drums of War - level restriction');
UPDATE `creature_text` SET `text`='Just...Dust...' WHERE `entry`=4832 AND `groupid`=2;
UPDATE `creature_addon` SET `auras`='' WHERE `guid` IN (
9785,9784,9771, -- Devotion Aura On Dragonmaw Swamprunner, Centurion, Bonewarder
5056, -- Unholy Shield on Morbent Fel
16707,16719,16733,16735,16737,16751,16754,16771,16796,16863,16962,16963,16987,17004,17005,17006,17010,17013,17017,17018,17021,17028, -- Stealth on Syndicate Spy
16709,16880,16881,16882,16883,16901,16985,17031,17032,17044,17047,17048,17051,17097, -- Stealth on Syndicate Assassin
11547,11550,11577,11608,11612,11654,11696,11812,11976,12904,12910,12912,13251,13303,13304,13310,13311,13313,13315, -- Stealth on Syndicate Highwayman
14652, -- Shadow Channeling on Marez Cowl
13594,13598, -- Defensive Stance on Bael'dun Excavator
14055, -- Stealth on Mad Magglish
33157,33158,33159,33160,33161,33162, -- Stealth on Felmusk Shadowstalker
34187,34189,34191, -- Bear form on Cenarion Protector
32349, -- Sleep visual on Relara Whitemoon
40101,40087,40055,40050,40042,40030,40012,40001, -- Inner Fire on Scarlet Chaplain
31208,31214,31360,31385,31387,31390,31391,31393,31463,31473,31607,31608,31617,31619,31622, -- Fire Shield on Fireman Scalebane
81447,81446,81444,81440,43695,42624,42622,42607,42605, -- Demon Skin on Sandfury Shadowcaster
91931,92324,92513,92665,92670,92671, -- Disease Cloud on Stiched Golem
48477,48563,48585,48761,48765,48768,48769,48772,48809,48816,48818,48827,48832,48836,48837,48921,48922,48923,48924,48926,48983,48987,48993,48999,91411,91412,91415, -- Disease Cloud on Diseased Ghoul
81927,81931,81940,81987,81995,82301,82316,82341,82355,82378,82394,82396,82397,82413,82426,82479,82510,82611,82612,82613,82615,82662,82763,82771, -- Draining Touch on Vampiric Mistbat
61856,61928,61931,61940, -- Thorns on Barbed Crawler
67462,67465,67468,67469, -- Arcane Shield on Warp Aberration
74883, -- Freeze Anim on Legion Hold Fel Reaver
132572, -- Shroud of Death on Time-Lost Skettis High Priest
76348,76349,76351,76353,76355,76356,76358,76359,76360,76362,76363,76364,76365,76366,76368,76369,76370,76371,76372,76373,76374,76376, -- Ghostly Facade on Cleric of Karabor
12803,12802,12801,12800,12799,12798, -- Lightning Shield on Ashtongue Stormcaller
132849,132850,132852,132853,132855,132851,132854,132856,132857, -- Phasing Invisibility on Blackwind Warp Chaser
32943, -- Cat form on Becanna Edune
132863, -- Oil coat on Oil-Stained Wolf
126539,126542,126553,126556,126562,126564,126567,126568,126569,126572,126574,126579,126582, -- Arcane Missiles on Crazed Mana-Wraith
127067); -- Head Crack on Drakkari Earthhshaker
UPDATE `creature_text` SET `text`='Who dares disturb my meditation?' WHERE `entry`=4832 AND `groupid`=0;
-- delete 31 creature_addon data that contain no information (bytes2=1 is the default)
DELETE FROM `creature_addon` WHERE `guid` IN (132572,126539,126542,126553,126556,126562,126564,126567,126568,126569,126572,126574,126579,126582,127067,132849,132850,132851,132852,132853,132854,132855,132856,132857,132863,108034,108035,108036,108037,203372,203373);
UPDATE `quest_template` SET `PrevQuestId`=12872 WHERE `Id` IN (12871,12885);
UPDATE `quest_template` SET `PrevQuestId`=12928 WHERE `Id` IN (12929,13273);

UPDATE `gameobject_template` SET `flags`=`flags`|4 WHERE `entry` IN 
(188364,188501,188502,188503,186684,186390,186950,186954,186955,186912,186662,186618,186587,186595,186607,186938,187027,186427,187026,187022,187023,188702,188703,188705,189983,186632,186619,186591,186397,
186640,186679,186828,186830,186832,186885,186886,187033,187381,187577,187683,187684,187685,187686,187687,187885,187886,188015,188016,188017,188066,188120,188462,188489,188646,188650,188658,188659,189288,
189293,189295,189298,189306,190127,190189,190354,190483,190484,190578,190612,190613,190614,190623,190624,190625,190643,190696,190720,191179,191567,191814,191815,192058,192171,192172,192556,192676,192693,
193091,193092,193196,193197,193404,193560,193561,193767,193792,193793,193943,193945,193946,194158,194159,194238,194340,194341,194423,194424,195022,195037,195274,195344,201367,201384,201794,201937);

UPDATE `gameobject_template` SET `flags`=`flags`|16 WHERE `entry` IN
(193603,193905,193967,194158,194159,195046,195047,195323,195324,195374,195375,195631,195632,195633,195635,195709,195710,201710,201959);

UPDATE `gameobject_template` SET `faction`=94 WHERE `entry` IN (195046,195047,195631,195632,195633,195635);
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry` IN (201710,201959);
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 820 AND 842;
INSERT INTO `trinity_string`(`entry`,`content_default`) VALUES
(820,'* has gossip (%u)'),
(821,'* is quest giver (%u)'),
(822,'* is class trainer (%u)'),
(823,'* is profession trainer(%u)'),
(824,'* is ammo vendor (%u)'),
(825,'* is food vendor(%u)'),
(826,'* is poison vendor (%u)'),
(827,'* is reagent vendor (%u)'),
(828,'* can repair (%u)'),
(829,'* is flight master (%u)'),
(830,'* is spirit healer (%u)'),
(831,'* is spirit guide (%u)'),
(832,'* is innkeeper (%u)'),
(833,'* is banker (%u)'),
(834,'* is petitioner (%u)'),
(835,'* is tabard designer (%u)'),
(836,'* is battle master (%u)'),
(837,'* is auctioneer (%u)'),
(838,'* is stable master (%u)'),
(839,'* is guild banker (%u)'),
(840,'* has spell click (%u)'),
(841,'* is mailbox (%u)'),
(842,'* is player vehicle (%u)');

UPDATE `trinity_string` SET `content_default`='* is vendor (%u)' WHERE `entry`=545;
UPDATE `trinity_string` SET `content_default`='* is trainer (%u)' WHERE `entry`=546;
UPDATE `smart_scripts` SET `event_type`=25,`event_flags`=0,`event_param1`=0,`event_param2`=0 WHERE `entryorguid`=16029 AND `source_type`=0 AND `id`=0; -- Sludge Belcher
UPDATE `creature_text` SET `sound`=14344 WHERE `entry`=29310 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `sound`=14345 WHERE `entry`=29310 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='Yogg-Saron! Grant me your power!', `sound`=14346 WHERE `entry`=29310 AND `groupid`=2 AND `id`=0;
UPDATE `creature_text` SET `sound`=14347 WHERE `entry`=29310 AND `groupid`=2 AND `id`=1;
UPDATE `creature_text` SET `sound`=14348 WHERE `entry`=29310 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `sound`=14349 WHERE `entry`=29310 AND `groupid`=3 AND `id`=1;
UPDATE `creature_text` SET `sound`=14351 WHERE `entry`=29310 AND `groupid`=4;
UPDATE `creature_text` SET `sound`=14354 WHERE `entry`=29310 AND `groupid`=5 AND `id`=2;
UPDATE `creature_text` SET `sound`=14355 WHERE `entry`=29310 AND `groupid`=5 AND `id`=3;
UPDATE `creature_text` SET `text`='The faithful shall be exalted, but there is more work to be done. We will press on until all of Azeroth lies beneath his shadow!', `sound`=14356 WHERE `entry`=29310 AND `groupid`=5 AND `id`=4;
UPDATE `creature_text` SET `sound`=14430, `type`=14 WHERE `entry`=29306 AND `groupid`=0;
UPDATE `creature_text` SET `sound`=14431, `type`=14 WHERE `entry`=29306 AND `groupid`=4;
UPDATE `creature_text` SET `sound`=14432, `type`=14 WHERE `entry`=29306 AND `groupid`=5;
UPDATE `creature_text` SET `sound`=14433, `type`=14 WHERE `entry`=29306 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `sound`=14434, `type`=14  WHERE `entry`=29306 AND `groupid`=3 AND `id`=1;
UPDATE `creature_text` SET `sound`=14435, `type`=14 WHERE `entry`=29306 AND `groupid`=3 AND `id`=2;
UPDATE `creature_text` SET `sound`=14436, `type`=14 WHERE `entry`=29306 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `sound`=14437, `type`=14, `text`='Who needs gods when we ARE gods?' WHERE `entry`=29306 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `sound`=14438, `type`=14 WHERE `entry`=29306 AND `groupid`=1 AND `id`=2;
UPDATE `creature_text` SET `sound`=14439, `type`=14 WHERE `entry`=29306 AND `groupid`=2;
-- Moorabi 
UPDATE `creature_text` SET `sound`=14721, `text`='We fought back da Scourge. What chance joo thinkin'' JOO got?' WHERE `entry`=29305 AND `groupid`=0;
UPDATE `creature_text` SET `sound`=14722 WHERE `entry`=29305 AND `groupid`=3;
UPDATE `creature_text` SET `sound`=14723, `text`='Da ground gonna swallow you up!' WHERE `entry`=29305 AND `groupid`=4;
UPDATE `creature_text` SET `sound`=14726, `text`='Who gonna stop me? You?' WHERE `entry`=29305 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `sound`=14727, `text`='Not so tough now!!' WHERE `entry`=29305 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `sound`=14728, `text`='If our gods can die... den so can we....' WHERE `entry`=29305 AND `groupid`=2;

-- Slad'ran
UPDATE `creature_text` SET `sound`=14444, `type`=14 WHERE `entry`=29304 AND `groupid`=3;
UPDATE `creature_text` SET `sound`=14445, `type`=14, `text`='A thousssand fangsss gonna rend your flesh!' WHERE `entry`=29304 AND `groupid`=4;
UPDATE `creature_text` SET `sound`=14446, `type`=14, `text`='You not breathin''? Good.' WHERE `entry`=29304 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `sound`=14447, `type`=14 WHERE `entry`=29304 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `sound`=14448, `type`=14, `text`='I eat you next, mon.' WHERE `entry`=29304 AND `groupid`=1 AND `id`=2;
UPDATE `creature_text` SET `sound`=14449, `type`=14, `text`='I sssee now... Ssscourge wasss not... our greatessst enemy....' WHERE `entry`=29304 AND `groupid`=2;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (
48792, -- spell_dk_icebound_fortitude
59754, -- spell_dk_rune_tap_party
55233, -- spell_dk_vampiric_blood
-1850, -- spell_dru_dash
48391, -- spell_dru_owlkin_frenzy
29166, -- spell_dru_innervate
34246, -- spell_dru_idol_lifebloom
60779, -- spell_dru_idol_lifebloom
-1079, -- spell_dru_rip
-61391,-- spell_dru_typhoon
63845, -- spell_gen_create_lance
28702, -- spell_gen_netherbloom
28720, -- spell_gen_nightmare_vine
26400, -- spell_item_arcane_shroud
8342,  -- spell_item_goblin_jumper_cables
22999, -- spell_item_goblin_jumper_cables_xl
54732, -- spell_item_gnomish_army_knife
17512, -- spell_item_piccolo_of_the_flaming_fire
48129, -- spell_item_scroll_of_recall
60320, -- spell_item_scroll_of_recall
60321, -- spell_item_scroll_of_recall
28862, -- spell_item_the_eye_of_diminution
-543,  -- spell_mage_fire_frost_ward
-6143, -- spell_mage_fire_frost_ward
-11426,-- spell_mage_ice_barrier
-1463, -- spell_mage_mana_shield
1038,  -- spell_pal_hand_of_salvation
58597, -- spell_pal_sacred_shield
-7001, -- spell_pri_lightwell_renew
-17,   -- spell_pri_power_word_shield
-1943, -- spell_rog_rupture
-51490,-- spell_sha_thunderstorm
-7235, -- spell_warl_shadow_ward
5246,  -- spell_warr_intimidating_shout
-772,  -- spell_warr_rend
64380, -- spell_warr_shattering_throw
65941, -- spell_warr_shattering_throw
50725, -- spell_warr_vigilance_trigger
26275  -- spell_winter_veil_px_238_winter_wondervolt
);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(48792, 'spell_dk_icebound_fortitude'),
(59754, 'spell_dk_rune_tap_party'),
(55233, 'spell_dk_vampiric_blood'),
(-1850, 'spell_dru_dash'),
(48391, 'spell_dru_owlkin_frenzy'),
(29166, 'spell_dru_innervate'),
(34246, 'spell_dru_idol_lifebloom'),
(60779, 'spell_dru_idol_lifebloom'),
(-1079, 'spell_dru_rip'),
(-61391,'spell_dru_typhoon'),
(63845, 'spell_gen_create_lance'),
(28702, 'spell_gen_netherbloom'),
(28720, 'spell_gen_nightmare_vine'),
(26400, 'spell_item_arcane_shroud'),
(8342,  'spell_item_goblin_jumper_cables'),
(22999, 'spell_item_goblin_jumper_cables_xl'),
(54732, 'spell_item_gnomish_army_knife'),
(17512, 'spell_item_piccolo_of_the_flaming_fire'),
(48129, 'spell_item_scroll_of_recall'),
(60320, 'spell_item_scroll_of_recall'),
(60321, 'spell_item_scroll_of_recall'),
(28862, 'spell_item_the_eye_of_diminution'),
(-543,  'spell_mage_fire_frost_ward'),
(-6143, 'spell_mage_fire_frost_ward'),
(-11426,'spell_mage_ice_barrier'),
(-1463, 'spell_mage_mana_shield'),
(1038,  'spell_pal_hand_of_salvation'),
(58597, 'spell_pal_sacred_shield'),
(-7001, 'spell_pri_lightwell_renew'),
(-17,   'spell_pri_power_word_shield'),
(-1943, 'spell_rog_rupture'),
(-51490,'spell_sha_thunderstorm'),
(-7235, 'spell_warl_shadow_ward'),
(5246,  'spell_warr_intimidating_shout'),
(-772,  'spell_warr_rend'),
(64380, 'spell_warr_shattering_throw'),
(65941, 'spell_warr_shattering_throw'),
(50725, 'spell_warr_vigilance_trigger'),
(26275, 'spell_winter_veil_px_238_winter_wondervolt');
-- Text for Crushridge Warmonger	
SET @ENTRY := 2287;	
DELETE FROM `creature_text` WHERE `entry`=@ENTRY AND `groupid`=1;	
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,1,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Crushridge Warmonger');

UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid` = 12236 AND `id`=9;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid` = 2428 AND `id`=10;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid` = 2287 AND `id`=1;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid` = 2287 AND `id`=3;
UPDATE `smart_scripts` SET `action_param1`=1 WHERE `entryorguid` = 2287 AND `id`=4;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid` = 8561 AND `id`=11;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=14390 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=2587 AND `source_type`=0 AND `id`=8;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=4064 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `link`=3 WHERE `entryorguid`=29181 AND `source_type`=0 AND `id`=2;
UPDATE `smart_scripts` SET `link`=0,`event_type`=61,`event_param2`=0,`event_param3`=0 WHERE `entryorguid`=29181 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29186 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29199 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29199 AND `source_type`=0 AND `id`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29204 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29204 AND `source_type`=0 AND `id`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29200 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29200 AND `source_type`=0 AND `id`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29176 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=500 AND `source_type`=0 AND `id`=10;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=4462 AND `source_type`=0 AND `id`=10;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=14467 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=2719 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=6004 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=23580 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=17270 AND `source_type`=0 AND `id`=13;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=29836 AND `source_type`=0 AND `id`=13;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=578 AND `source_type`=0 AND `id`=8;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=1397 AND `source_type`=0 AND `id`=14;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=1123 AND `source_type`=0 AND `id`=10;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=1123 AND `source_type`=0 AND `id`=16;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=3142 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=15641 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=424 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=19507 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=3643 AND `source_type`=1 AND `id`=0;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=1162 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=1162 AND `source_type`=0 AND `id`=10;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=3987 AND `source_type`=0 AND `id`=1;

UPDATE `smart_scripts` SET `event_flags`=0 WHERE `entryorguid`=6066 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid`=8477 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_flags`=0 WHERE `entryorguid`=29206 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_flags`=0 WHERE `entryorguid`=29182 AND `source_type`=0 AND `id` IN (0,1);
UPDATE `smart_scripts` SET `event_flags`=0 WHERE `entryorguid`=29177 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid`=29684 AND `source_type`=0 AND `id` IN (0,1);
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid`=15631 AND `source_type`=0 AND `id`=0;
-- Image of Commander Ameer <The Protectorate> (22919)
SET @GUID := 43492;

UPDATE `creature_template` SET `npcflag`=`npcflag`|2,`unit_flags`=`unit_flags`&~33554432 WHERE `entry`=22919;

DELETE FROM `creature` WHERE `guid`=@GUID;
INSERT INTO `creature` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`) VALUES
(@GUID,22919,530,3866.55,5978.68,291.792,4.10061,300,6986);

DELETE FROM `creature_questrelation` WHERE `id`=22919;
INSERT INTO `creature_questrelation` (`id`,`quest`) VALUES
(22919,10981), -- Nexus-Prince Shaffar's Personal Chamber
(22919,10975), -- Purging the Chambers of Bash'ir
(22919,10977), -- Stasis Chambers of the Mana-Tombs
(22919,10976); -- The Mark of the Nexus-King

DELETE FROM `creature_involvedrelation` WHERE `id`=22919;
INSERT INTO `creature_involvedrelation` (`id`,`quest`) VALUES
(22919,10981), -- Nexus-Prince Shaffar's Personal Chamber
(22919,10975), -- Purging the Chambers of Bash'ir
(22919,10974), -- Stasis Chambers of Bash'ir
(22919,10977), -- Stasis Chambers of the Mana-Tombs
(22919,10982), -- The Eye of Haramad
(22919,10976); -- The Mark of the Nexus-King
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=234 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=2554 AND `source_type`=0 AND `id`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=12265 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=12265 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=16704 AND `source_type`=0 AND `id`=13;
UPDATE `smart_scripts` SET `link`=0,`event_type`=61 WHERE `entryorguid`=13601 AND `source_type`=0 AND `id`=4;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=13601 AND `source_type`=0 AND `id`=10;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=17670 AND `source_type`=0 AND `id`=13;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=11878 AND `source_type`=0 AND `id`=13;
-- Add missing spells to spell_dbc
DELETE FROM `spell_dbc` WHERE `Id` IN (24211,24246,24235,7939);
INSERT INTO `spell_dbc` (`Id`,`SchoolMask`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`Comment`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`EffectMiscValueB1`) VALUES
(24211,0,0,0,256,0,4,0,0,0,0,0,1,0,0,101,0,0,0,0,0,0,0,-1,0,0,63,0,0,1,0,0,0,0,0,4999,0,0,0,0,0,22,0,0,0,0,0,7,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Mark of Arlokk',0,0,0,0,0,0,0,1,0,0,0),
(24246,0,0,0,256,0,0,0,0,0,0,0,1,0,0,101,0,0,0,0,6,0,0,-1,0,0,28,0,0,1,0,0,0,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,15101,0,0,0,0,0,'Summon Zulian Prowler',0,0,0,0,0,0,0,1,0,0,64),
(24235,0,0,0,272,268435456,0,0,0,0,0,0,1,0,0,101,0,0,0,0,1,0,0,-1,0,0,6,0,0,0,0,0,0,0,0,9999,0,0,0,0,0,1,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Super Invis',0,0,0,0,0,0,0,1,1,1,0),
(7939,0,5,0,402915728,268435456,0,0,0,0,0,0,1,6147,0,101,0,0,1,1,21,1,0,-1,-1,0,6,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Sneak Rank 1',0,0,0,0,0,0,0,-1,1,1,0);

-- Add script name to Zulian Prowler
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_zulian_prowler' WHERE `entry`=15101;

-- Remove SmartAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=15101;

-- Add condition for Mark of Arlokk
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=24211;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,24211,0,0,0,31,3,15101,0,0,0,0, '', 'Mark of Arlokk - Targets Zulian Prowler');
UPDATE `spell_dbc` SET `EffectImplicitTargetB1`=7,`EffectRadiusIndex1`=18 WHERE `Id`=24211;
UPDATE `conditions` SET `ConditionTypeOrReference`=31,`ConditionTarget`=0 WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=24211;
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14 WHERE `entry`=22920;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=16459 AND `source_type`=0 AND `id`=2;
UPDATE `smart_scripts` SET `event_flags`=0 WHERE `entryorguid`=5263 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=19255 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=5888 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=10828 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=29181 AND `source_type`=0 AND `id`=1;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=16403 AND `source_type`=0 AND `id`=9;
DELETE FROM `command` WHERE `name`='mmap' OR `name` LIKE 'mmap%';
DELETE FROM `command` WHERE `name` LIKE 'disable add mmap' OR `name` LIKE 'disable remove mmap';
INSERT INTO `command` (`name`, `security`, `help`) VALUES 
('mmap', 3, 'Syntax: Syntax: .mmaps $subcommand Type .mmaps to see the list of possible subcommands or .help mmaps $subcommand to see info on subcommands'),
('mmap path', 3, 'Syntax: .mmap path to calculate and show a path to current select unit'),
('mmap loc', 3, 'Syntax: .mmap loc to print on which tile one is'),
('mmap loadedtiles', 3, 'Syntax: .mmap loadedtiles to show which tiles are currently loaded'),
('mmap stats', 3, 'Syntax: .mmap stats to show information about current state of mmaps'),
('mmap testarea', 3, 'Syntax: .mmap testarea to calculate paths for all nearby npcs to player'),
('disable add mmap', '3', 'Syntax: .disable add mmap $entry $flag $comment'),
('disable remove mmap', '3', 'Syntax: .disable remove mmap $entry');
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid`=20882 AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=20896 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=20900 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `link`=0,`event_type`=61 WHERE `entryorguid`=4063 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=2245 AND `source_type`=0 AND `id`=8;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=7038 AND `source_type`=0 AND `id`=17;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=2345 AND `source_type`=0 AND `id`=11;

DELETE FROM `smart_scripts` WHERE `entryorguid`=314 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(314, 0, 1, 0, 11, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 0 - On spawn - Prevent combat movement'),
(314, 0, 2, 3, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 0 - On aggro - Say'),
(314, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 0 - On aggro - Set phase 1'),
(314, 0, 4, 0, 9, 1, 100, 0, 0, 40, 0, 0, 11, 20819, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - In combat - Cast Frostbolt'),
(314, 0, 5, 0, 9, 1, 100, 0, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - 0 to 5 yards - Activate combat movement'),
(314, 0, 6, 0, 9, 1, 100, 0, 5, 35, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - 5 to 35 yards - Deactivate combat movement'),
(314, 0, 7, 0, 9, 1, 100, 0, 35, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - 35 to 80 yards - Activate combat movement'),
(314, 0, 8, 0, 0, 1, 100, 0, 4100, 6400, 72300, 72300, 11, 3107, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - In combat - Summon Elizas Guard'),
(314, 0, 9, 0, 0, 1, 100, 0, 2100, 2900, 12500, 36300, 11, 11831, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - In combat - Cast Frost Nova'),
(314, 0, 10, 12, 3, 1, 100, 0, 0, 7, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - At 7% mana - Start combat movement'),
(314, 0, 11, 0, 61, 1, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 1 - At 7% mana - Set phase 2'),
(314, 0, 12, 0, 3, 2, 100, 0, 15, 100, 100, 100, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Phase 2 - At 15% mana - Set phase 1');
-- readd flight aura on Wyrmrest Defender npcs
UPDATE `creature_template_addon` SET `auras`='50069' WHERE `entry`=27629;

-- correct SAI on Nerub'ar Broodkeeper
UPDATE `smart_scripts` SET `event_param1`=0 WHERE `entryorguid`=36725 AND `source_type`=0 AND `id`=1;
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 1145 AND 1148;
INSERT INTO `trinity_string` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES
(1145,'%s is already in a group!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1146,'%s joined %s''s group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1147,'%s is not in a group!',NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1148,'Group is full!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM `command` WHERE `name`='group join';
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('group join',3,'Syntax: .group join $AnyCharacterNameFromGroup [$CharacterName] \r\nAdds to group of player $AnyCharacterNameFromGroup player $CharacterName (or selected).');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (
70871,  -- spell_blood_queen_essence_of_the_blood_queen
69383,  -- spell_the_lich_king_dark_hunger
50453,  -- spell_dk_blood_gorged
-48496, -- spell_dru_living_seed
48504,  -- spell_dru_living_seed_proc
28764,  -- spell_gen_adaptive_warding
27539,  -- spell_gen_obsidian_armor
34074,  -- spell_hun_ascpect_of_the_viper
64411,  -- spell_item_blessing_of_ancient_kings
71875,  -- spell_item_necrotic_touch
71877,  -- spell_item_necrotic_touch
71169,  -- spell_item_shadows_fate
71903,  -- spell_item_shadowmourne
71905,  -- spell_item_shadowmourne_soul_fragment
-44449, -- spell_mage_burnout
54646,  -- spell_mage_focus_magic
-11119, -- spell_mage_ignite
-29074, -- spell_mage_master_of_elements
-9799,  -- spell_pal_eye_for_an_eye
20154,  -- spell_pal_seal_of_righteousness
21084,   -- spell_pal_seal_of_righteousness
-47509, -- spell_pri_divine_aegis
55680,  -- spell_pri_glyph_of_prayer_of_healing
28305,  -- spell_pri_mana_leech
13877,  -- spell_rog_blade_flurry
33735,  -- spell_rog_blade_flurry
51211,  -- spell_rog_blade_flurry
65956,  -- spell_rog_blade_flurry
57934,  -- spell_rog_tricks_of_the_trade
59628,  -- spell_rog_tricks_of_the_trade_proc
-974,   -- spell_sha_earth_shield
-47230, -- spell_warl_fel_synergy
63108,  -- spell_warl_siphon_life
-58872, -- spell_warr_damage_shield
12328,  -- spell_warr_sweeping_strikes
18765,  -- spell_warr_sweeping_strikes
35429   -- spell_warr_sweeping_strikes
);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(70871,  'spell_blood_queen_essence_of_the_blood_queen'),
(69383,  'spell_the_lich_king_dark_hunger'),
(50453,  'spell_dk_blood_gorged'),
(-48496, 'spell_dru_living_seed'),
(48504,  'spell_dru_living_seed_proc'),
(28764,  'spell_gen_adaptive_warding'),
(27539,  'spell_gen_obsidian_armor'),
(34074,  'spell_hun_ascpect_of_the_viper'),
(64411,  'spell_item_blessing_of_ancient_kings'),
(71875,  'spell_item_necrotic_touch'),
(71877,  'spell_item_necrotic_touch'),
(71169,  'spell_item_shadows_fate'),
(71903,  'spell_item_shadowmourne'),
(71905,  'spell_item_shadowmourne_soul_fragment'),
(-44449, 'spell_mage_burnout'),
(54646,  'spell_mage_focus_magic'),
(-11119, 'spell_mage_ignite'),
(-29074, 'spell_mage_master_of_elements'),
(-9799,  'spell_pal_eye_for_an_eye'),
(20154,  'spell_pal_seal_of_righteousness'),
(21084,  'spell_pal_seal_of_righteousness'),
(-47509, 'spell_pri_divine_aegis'),
(55680,  'spell_pri_glyph_of_prayer_of_healing'),
(28305,  'spell_pri_mana_leech'),
(13877,  'spell_rog_blade_flurry'),
(33735,  'spell_rog_blade_flurry'),
(51211,  'spell_rog_blade_flurry'),
(65956,  'spell_rog_blade_flurry'),
(57934,  'spell_rog_tricks_of_the_trade'),
(59628,  'spell_rog_tricks_of_the_trade_proc'),
(-974,   'spell_sha_earth_shield'),
(-47230, 'spell_warl_fel_synergy'),
(63108,  'spell_warl_siphon_life'),
(-58872, 'spell_warr_damage_shield'),
(12328,  'spell_warr_sweeping_strikes'),
(18765,  'spell_warr_sweeping_strikes'),
(35429,  'spell_warr_sweeping_strikes');
SET @AETHER_RAY          := 22181;
SET @WRANGLED_RAY        := 23343;
SET @WRANGLE_SPELL       := 40856;
SET @WRANGLED_FORCE_CAST := 40917;
SET @WRANGLED_AURA       := 40926;
SET @QUEST_GIVER         := 23335;

DELETE FROM `creature_text` WHERE `entry`=@AETHER_RAY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@AETHER_RAY,1,0,'The Aether Ray appears ready to be wrangled.',16,0,100,0,0,0,'Aether Ray');

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@AETHER_RAY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@AETHER_RAY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@AETHER_RAY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@AETHER_RAY, 0, 0, 0, 0, 0, 100, 0, 5000, 6000, 8000, 9000, 11, 35333, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - IC - Cast Tail Swipe'),
(@AETHER_RAY, 0, 1, 0, 2, 0, 100, 1, 0, 40, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - On 40 % HP - Say emote'),
(@AETHER_RAY, 0, 2, 3, 8, 0, 100, 0, @WRANGLE_SPELL, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - On spellcast - Despawn'),
(@AETHER_RAY, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, @WRANGLED_FORCE_CAST, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - Link with 2 - Summon Wrangled Aether Ray');

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WRANGLED_RAY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WRANGLED_RAY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@WRANGLED_RAY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@WRANGLED_RAY, 0, 0, 1, 54, 0, 100, 1, 0, 0, 0, 0, 85, @WRANGLED_AURA, 3, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On spawn - Cast Wrangled Aura - Action Invoker'),
(@WRANGLED_RAY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, @QUEST_GIVER, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wrangled Ray - Link with 0 - Follow Player'),
(@WRANGLED_RAY, 0, 2, 0, 65, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wrangled Ray - On follow complete - Despawn');

DELETE FROM `conditions` WHERE `SourceEntry`=@WRANGLE_SPELL;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, @WRANGLE_SPELL, 0, 0, 31, 1, 3, 22181, 0, 0, 0, 0, '', 'Spell only hits Aether Rey'),
(17, 0, @WRANGLE_SPELL, 0, 0, 38, 1, 40, 4, 0, 0, 0, 0, '', 'Spell only hits if at or below 40%');
-- Update text's with creature_text.type old format values - some missing texts should be fixed.
-- based on http://collab.kpsn.org/display/tc/Creature+text+tc2#Creaturetexttc2-type
UPDATE `creature_text` SET `type`=12 WHERE `type`=0; -- Say
UPDATE `creature_text` SET `type`=14 WHERE `type`=1; -- Yell
UPDATE `creature_text` SET `type`=16 WHERE `type`=2; -- Emote
UPDATE `creature_text` SET `type`=41 WHERE `type`=3; -- Boss Emote
UPDATE `creature_text` SET `type`=15 WHERE `type`=4; -- Whisper
UPDATE `creature_text` SET `type`=42 WHERE `type`=5; -- Boss Whisper
UPDATE `creature_classlevelstats` SET `basehp1`=9741 WHERE `level`=82 AND `class`=1;
UPDATE `creature_classlevelstats` SET `basehp0`=5971, `basehp1`=10300 WHERE `level`=84 AND `class`=1;
UPDATE `creature_classlevelstats` SET `basehp0`=6141 WHERE `level`=85 AND `class`=1;

UPDATE `creature_classlevelstats` SET `basehp1`=1006 WHERE `level`=31 AND `class`=2;
UPDATE `creature_classlevelstats` SET `basemana`=4081 WHERE `level`=81 AND `class`=2;
UPDATE `creature_classlevelstats` SET `basemana`=4363 WHERE `level`=84 AND `class`=2;
UPDATE `creature_classlevelstats` SET `basehp2`=15498, `basemana`=4454 WHERE `level`=85 AND `class`=2;
UPDATE `creature_classlevelstats` SET `basehp2`=16515, `basemana`=4735 WHERE `level`=88 AND `class`=2;

UPDATE `creature_classlevelstats` SET `basemana`=9328 WHERE `level`=83 AND `class`=8;
UPDATE `creature_classlevelstats` SET `basemana`=9512 WHERE `level`=84 AND `class`=8;
UPDATE `creature_classlevelstats` SET `basehp0`=4299, `basemana`=9697 WHERE `level`=85 AND `class`=8;
UPDATE `creature_classlevelstats` SET `basemana`=10232 WHERE `level`=88 AND `class`=8;
-- Kalaran Windblade: SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=8479 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES 
(8479,0,1,62,1321,0,26,3441,7,'Kalaran Windblade - On gossip select - Quest credit'),
(8479,1,0,61,0,0,72,0,7,'Kalaran Windblade - On gossip select - Close gossip'),
(8479,2,3,62,1323,2,11,19797,7,'Kalaran Windblade - On gossip select - Cast 19797'),
(8479,3,0,61,0,0,72,0,7,'Kalaran Windblade - On gossip select - Close gossip'),
(8479,4,0,62,1323,3,80,847900,1,'Kalaran Windblade - On gossip select - Run script');

-- Kalaran Windblade: SAI action list
DELETE FROM `smart_scripts` WHERE `entryorguid`=847900 AND `source_type`=9;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(847900,9,0,0,0,72,0,7,'Kalaran Windblade - Action 0 - Close gossip'),
(847900,9,1,0,0,83,3,1,'Kalaran Windblade - Action 1 - Remove NPC flags'),
(847900,9,2,1000,1000,1,0,1,'Kalaran Windblade - Action 2 - Say 0'),
(847900,9,3,1000,1000,17,69,1,'Kalaran Windblade - Action 3 - Emote state use standing'),
(847900,9,4,60000,60000,17,0,1,'Kalaran Windblade - Action 4 - Emote state none'),
(847900,9,5,1000,1000,15,3453,7,'Kalaran Windblade - Action 5 - Give quest credit'),
(847900,9,6,1000,1000,82,3,1,'Kalaran Windblade - Action 6 - Add NPC flags');

-- Kalaran Windblade: Creature text
DELETE FROM `creature_text` WHERE `entry`=8479;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`probability`,`comment`) VALUE 
(8479,0,0,'Be patient, $N. The torch is almost complete.',12,100,'Kalaran Windblade - Smart AI');

-- Captured Mountaineer: SAI 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=2211;
DELETE FROM `smart_scripts` WHERE `entryorguid`=2211 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`event_param1`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUE
(2211,0,20,492,80,221100,2,1,'Captured Mountaineer - On quest reward - Start timed action list');

-- Captured Mountaineer: SAI action list
DELETE FROM `smart_scripts` WHERE `entryorguid`=221100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(221100,9,0,1000,1000,1,0,1,'Captured Mountaineer - Action 0 - Say 0'),
(221100,9,1,4000,4000,37,0,1,'Captured Mountaineer - Action 2 - Suicide');

-- Captured Mountaineer: Creature text
DELETE FROM `creature_text` WHERE `entry`=2211;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`probability`,`emote`,`comment`) VALUE
(2211,0,0,'I raise my brew and hope to be rid of the likes of you! Cheers, you no good scoundrel, $N!',12,100,7,'Captured Mountaineer - Reward quest 492');
DELETE FROM `trinity_string` WHERE `entry` IN (1149,1150);
INSERT INTO `trinity_string` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES
(1149,'Group type: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1150,'Name: %s (%s), GUID: %u, Flags: %s, Roles: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM `command` WHERE `name`='group list';
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('group list',3,'Syntax: .group list [$CharacterName] \r\nLists all the members of the group/party the player is in.');
-- Coren Direbrew ( http://old.wowhead.com/npc=23872 ) loot fix by dele
DELETE FROM `creature_loot_template` WHERE `entry`=23872 AND `item` IN (38280,38281);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(23872,38280,100,1,0,1,1), -- Direbrew's Dire Brew Alliance version
(23872,38281,100,1,0,1,1); -- Direbrew's Dire Brew Horde version 
-- Add reference for Zone Drop Netherstorm Blues
DELETE FROM `reference_loot_template` WHERE `entry`=14501;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(14501,31940,0,1,1,1,1), -- Ethereum Torque
(14501,31936,0,1,1,1,1), -- Fiery Cloak
(14501,31565,0,1,1,1,1), -- Skystalker's Boots
(14501,31573,0,1,1,1,1), -- Mistshroud Boots
(14501,31557,0,1,1,1,1), -- Windchanneller's Boots
(14501,31937,0,1,1,1,1), -- Living Cloak
(14501,31928,0,1,1,1,1), -- Dark Band
(14501,31581,0,1,1,1,1), -- Slatesteel Boots
(14501,31929,0,1,1,1,1), -- Enigmatic Band
(14501,31938,0,1,1,1,1), -- Enigmatic Cloak
(14501,31943,0,1,1,1,1), -- Ethereum Band
(14501,31939,0,1,1,1,1), -- Dark Cloak
(14501,31925,0,1,1,1,1), -- Fiery Band
(14501,31926,0,1,1,1,1), -- Frigid Band
(14501,31927,0,1,1,1,1), -- Living Band
(14501,32520,0,1,1,1,1), -- Manaforged Sphere
(14501,31935,0,1,1,1,1); -- Frigid Cloak
-- Add loot for Protectorate Treasure Cache
UPDATE `item_template` SET `minMoneyLoot`=10000,`maxMoneyLoot`=10000 WHERE `entry`=32064;
DELETE FROM `item_loot_template` WHERE `entry`=32064;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(32064,1,80,1,1,-24013,1), -- one from greens
(32064,2,20,1,1,-14501,1); -- one from blue items
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (18431,17731);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Bellowing Roar
(13, 2, 18431, 0, 0, 31, 0, 5, 176838, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176837, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176835, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176834, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176832, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176831, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176833, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176825, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176824, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176823, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176819, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176813, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176812, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176809, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176515, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176514, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176513, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176911, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176910, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176909, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176908, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176842, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176841, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176840, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176839, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176836, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176826, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176811, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176810, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176922, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176921, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176920, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176919, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176915, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176914, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176913, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176912, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176830, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176829, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176828, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176827, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176822, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176821, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176820, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176818, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176817, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176816, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176815, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176814, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176918, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176917, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
(13, 2, 18431, 0, 0, 31, 0, 5, 176916, 0, 0, 0, 0, '', 'Bellowing Roar - Lava Fissure'),
-- Eruption
(13, 2, 17731, 0, 0, 31, 0, 5, 176838, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176837, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176835, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176834, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176832, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176831, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176833, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176825, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176824, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176823, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176819, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176813, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176812, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176809, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176515, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176514, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176513, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176911, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176910, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176909, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176908, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176842, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176841, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176840, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176839, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176836, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176826, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176811, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176810, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176922, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176921, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176920, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176919, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176915, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176914, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176913, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176912, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176830, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176829, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176828, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176827, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176822, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176821, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176820, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176818, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176817, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176816, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176815, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176814, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176918, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176917, 0, 0, 0, 0, '', 'Eruption - Lava Fissure'),
(13, 2, 17731, 0, 0, 31, 0, 5, 176916, 0, 0, 0, 0, '', 'Eruption - Lava Fissure');
-- Change loot in Mithril Bound Trunk to always give an item
DELETE FROM `item_loot_template` WHERE `entry`=21228;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Group1: Leather @ 70%
(21228,4304,40,1,1,2,4), -- Thick Leather
(21228,8170,30,1,1,1,2), -- Rugged Leather
-- Group2: Cloth @ 70%
(21228, 4339,40,1,2,1,3), -- Bolt of Mageweave
(21228,14048,30,1,2,1,2), -- Bolt of Runecloth
-- Ungrouped:
(21228,6149,20,1,0,1,2), -- Greater Mana Potion
(21228,3928,20,1,0,1,2), -- Superior Healing Potion
(21228,34109,50,1,0,1,1), -- Weather-Beaten Journal
(21228, 3914, 1,1,0,1,1), -- Journeyman's Backpack
(21228,7976,0.05,1,0,1,1), -- Plans: Mithril Shield Spike
(21228,7909,0.4,1,0,1,1), -- Aquamarine
(21228,7910,0.3,1,0,1,1), -- Star Ruby
(21228,1613,0.3,1,0,1,1), -- Spiritchaser Staff
(21228,9295,0.3,1,0,1,1), -- Recipe: Invisibility Potion
(21228,7468,0.2,1,0,1,1), -- Regal Robe
(21228,9291,0.2,1,0,1,1), -- Field Plate Leggings
(21228,9910,0.2,1,0,1,1), -- Royal Gloves
(21228,10320,0.2,1,0,1,1), -- Pattern: Red Mageweave Headband
(21228,15245,0.2,1,0,1,1), -- Vorpal Dagger
(21228,8281,0.2,1,0,1,1), -- Valorous Pauldrons
(21228,1685,0.2,1,0,1,1), -- Troll-hide Bag
(21228,8163,0.2,1,0,1,1), -- Jouster's Pauldrons
(21228,8141,0.2,1,0,1,1), -- Chromite Greaves
(21228,8121,0.2,1,0,1,1); -- Heraldic Gloves
DELETE FROM `trinity_string` WHERE `entry`=749;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(749, 'Guild: %s (%u) Rank: %s Note: %s OffNote: %s');

UPDATE `command` SET `help`='Syntax: .pinfo [$player_name/#GUID]\r\n\r\nOutput account information and guild information for selected player or player find by $player_name or #GUID.' WHERE `name`='pinfo';
-- Issue 5882: Dire Maul Arena Rare Bosses
-- Spawnlocations are from YTDB need to be checked!
SET @GUID := 45758; -- set the guid for spawning
SET @POOL := 358; -- set the poolid for the spawn
DELETE FROM `creature` WHERE `id` IN (11447,11497,11498);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID  ,11447,1,1,1,0,0,-3799.62,1063.83,132.806,1.20424,21600,0,0,60000,    0,0,0,0,0),
(@GUID+1,11497,1,1,1,0,0,-3731.22,1061.32,132.345,1.78150,21600,0,0,73000,24340,0,0,0,0),
(@GUID+2,11498,1,1,1,0,0,-3690.96,1077.14,131.969,2.65172,21600,0,0,57000,    0,0,0,0,0);
DELETE FROM `pool_template` WHERE `entry`=@POOL;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL,1,'Max 1 Rare in Dire Maul Arena');
DELETE FROM `pool_creature` WHERE `pool_entry`=@POOL;
INSERT INTO `pool_creature` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(@GUID  ,@POOL,0, 'Rare Spawn Dire Maul Arena'),
(@GUID+1,@POOL,0, 'Rare Spawn Dire Maul Arena'),
(@GUID+2,@POOL,0, 'Rare Spawn Dire Maul Arena');
-- Issue 5925: Missing Sand Shark from Durotar
-- Thx Mogale for sniffing
DELETE FROM `creature` WHERE `id`=5435;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(43494,5435,1,1,1,0,0,-1144.251,-4336.333,-8.457234,4.602825,900,4,0,741,0,1,0,0,0); 
-- Issue 8498: Fix 2 centaurs stuck in the ground (by Baric)
UPDATE creature SET position_z=93.67 WHERE guid IN (14007, 20588);
-- Issue 568: No Mercy for the Captured
-- Gossip Menu Options
DELETE FROM `gossip_menu_option` WHERE  `menu_id` IN (9510,9509,9508,9507);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
-- Chancellor
(9510,0,0, 'No, chancellor.. I wouldn''t say that I''m here to ''rescue'' you, per se.',1,1,0,0,0,0,NULL),
(9510,1,0, 'Where is Senior Scrivener Barriga being held?'         ,1,1,50424,0,0,0,NULL),
(9510,2,0, 'Did you see where they took Sanitation Engineer Burke?',1,1,50426,0,0,0,NULL),
(9510,3,0, 'Any idea where they''re keeping Deathguard Schneider?' ,1,1,50425,0,0,0,NULL),
-- Engineer
(9509,0,0, 'Affraid not. Your days as a sanitation engineer are coming to an end',  1,1,    0,0,0,0,NULL),
(9509,1,0, 'Can you tell me where they have Chancellor Amai caged?',1,1,50423,0,0,0,NULL),
(9509,2,0, 'Where is Senior Scrivener Barriga being held?'         ,1,1,50424,0,0,0,NULL),
(9509,3,0, 'Any idea where they''re keeping Deathguard Schneider?' ,1,1,50425,0,0,0,NULL),
-- Scrivener
(9508,0,0, 'Not today, senior scrivener!'                          ,1,1,    0,0,0,0,NULL),
(9508,1,0, 'Can you tell me where they have Chancellor Amai caged?',1,1,50423,0,0,0,NULL),
(9508,2,0, 'Did you see where they took Sanitation Engineer Burke?',1,1,50426,0,0,0,NULL),
(9508,3,0, 'Any idea where they''re keeping Deathguard Schneider?' ,1,1,50425,0,0,0,NULL),
-- Schneider
(9507,0,0, 'I''m affraid not. Schneider. Your time has come!'       ,1,1,    0,0,0,0,NULL),
(9507,1,0, 'Can you tell me where they have Chancellor Amai caged?',1,1,50423,0,0,0,NULL),
(9507,2,0, 'Where is Senior Scrivener Barriga being held?'         ,1,1,50424,0,0,0,NULL),
(9507,3,0, 'Did you see where they took Sanitation Engineer Burke?',1,1,50426,0,0,0,NULL);
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (50423,50424,50425,50426);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(50423,12833), -- I think I saw them take him over by the north side of the abbey, near the archery targets.
(50424,12827), -- I think they put him in a cage over near the lumbermill.
(50425,12832), -- I think they have her down near the gallows.
(50426,12830); -- I think he's on the south side of the abbey.
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27376,27378,27379,27381) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2737600,2737800,2737900,2738100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Deathguard Schneider
(27376  ,0,0,0,62,0,100,0,9507,0,0,0,80,2737600,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - On Gossip Option Select - Start Script"),
(27376  ,0,1,0,10,0,100,0,0,10,180000,300000,1,1,0,0,0,0,0,17,0,10,0,0.0,0.0,0.0,0.0,"Deathguard Schneider - On LoS with Player Near - Say Line 1"),
(2737600,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Close Gossip"),
(2737600,9,1,0,0,0,100,0,200,200,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Say line 0"),
(2737600,9,2,0,0,0,100,0,5000,5000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Set facton 14 (Hostile)"),
(2737600,9,3,0,0,0,100,0,2500,2500,0,0,46,1,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Move"),
-- Senior Scrivener Barriga
(27378  ,0,0,0,62,0,100,0,9508,0,0,0,80,2737800,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Senior Scrivener Barriga - On Gossip Option Select - Start Script"),
(27378  ,0,1,0,10,0,100,0,0,10,180000,300000,1,1,0,0,0,0,0,17,0,10,0,0.0,0.0,0.0,0.0,"Senior Scrivener Barriga - On LoS with Player Near - Say Line 1"),
(2737800,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Close Gossip"),
(2737800,9,1,0,0,0,100,0,200,200,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Senior Scrivener Barriga - Say line 0"),
(2737800,9,2,0,0,0,100,0,5000,5000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Senior Scrivener Barriga - Set facton 14"),
(2737800,9,3,0,0,0,100,0,2500,2500,0,0,46,1,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Senior Scrivener Barriga - Move"),
-- Engineer Burke
(27379  ,0,0,0,62,0,100,0,9509,0,0,0,80,2737900,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Engineer Burke - On Gossip Option Select - Start Script"),
(27379  ,0,1,0,10,0,100,0,0,10,180000,300000,1,1,0,0,0,0,0,17,0,10,0,0.0,0.0,0.0,0.0,"Engineer Burke - On LoS with Player Near - Say Line 1"),
(2737900,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Close Gossip"),
(2737900,9,1,0,0,0,100,0,200,200,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Engineer Burke - Script - Say line 0"),
(2737900,9,2,0,0,0,100,0,5000,5000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Engineer Burke - Script - Set facton 14"),
(2737900,9,3,0,0,0,100,0,2500,2500,0,0,46,1,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Engineer Burke - Script - Move"),
-- Chancellor Amai
(27381  ,0,0,0,62,0,100,0,9510,0,0,0,80,2738100,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Chancellor Amai - On Gossip Option Select - Start Script"),
(27381  ,0,1,0,10,0,100,0,0,10,180000,300000,1,1,0,0,0,0,0,17,0,10,0,0.0,0.0,0.0,0.0,"Chancellor Amai - On LoS with Player Near - Say Line 1"),
(2738100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0, "Deathguard Schneider - Script - Close Gossip"),
(2738100,9,1,0,0,0,100,0,200,200,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Chancellor Amai - Script - Say line 0"),
(2738100,9,2,0,0,0,100,0,5000,5000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Chancellor Amai - Script - Set facton 14"),
(2738100,9,3,0,0,0,100,0,2500,2500,0,0,46,1,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Chancellor Amai - Script - Move");
-- Creature Texts
DELETE FROM `creature_text` WHERE `entry` IN (27376,27378,27379,27381);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(27376,0,0, 'What do you mean my time has come? I''ll kill you where you stand!',12,0,100,0,0,0, 'Deathguard Schneider before going hostile'),
(27376,1,0, 'Hey, over here!',12,0,100,0,0,0, 'Deathguard Schneider upon LoS'),
(27378,0,0, 'You can''t possibly mean to.... I''ll write you up for this, $C!',12,0,100,0,0,0, 'Senior Scrivener Barriga before going hostile'),
(27378,1,0, 'If you''d be so kind, please let me out of here!',12,0,100,0,0,0, 'Senior Scrivener Barriga upon LoS'),
(27379,0,0, 'No! I beg you! Please don''t kill me!',12,0,100,0,0,0, 'Engineer Burke before going hostile'),
(27379,1,0, 'Can Someone let me out of here? I need to get back to Venomspite and finish my shift.',12,0,100,0,0,0, 'Engineer Burke upon LoS'),
(27381,0,0, 'What is the meaning of this? Stop! I''ll double whatever they''re paying you!',12,0,100,0,0,0, 'Chancellor Amai before going hostile'),
(27381,1,0, 'I just arrived in Venomspite. How could i have possibly wronged you?',12,0,100,0,0,0, 'Chancellor Amai upon Los');
-- Conditions
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (9507,9508,9509,9510);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,9507,0,0,9,12245,0,0,0, '', 'Deathguard Schneider: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9507,1,0,9,12245,0,0,0, '', 'Deathguard Schneider: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9507,2,0,9,12245,0,0,0, '', 'Deathguard Schneider: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9507,3,0,9,12245,0,0,0, '', 'Deathguard Schneider: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9508,0,0,9,12245,0,0,0, '', 'Senior Scivener Barriga: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9508,1,0,9,12245,0,0,0, '', 'Senior Scivener Barriga: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9508,2,0,9,12245,0,0,0, '', 'Senior Scivener Barriga: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9508,3,0,9,12245,0,0,0, '', 'Senior Scivener Barriga: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9509,0,0,9,12245,0,0,0, '', 'Engineer Burke: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9509,1,0,9,12245,0,0,0, '', 'Engineer Burke: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9509,2,0,9,12245,0,0,0, '', 'Engineer Burke: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9509,3,0,9,12245,0,0,0, '', 'Engineer Burke: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9510,0,0,9,12245,0,0,0, '', 'Chancellor Amai: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9510,1,0,9,12245,0,0,0, '', 'Chancellor Amai: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9510,2,0,9,12245,0,0,0, '', 'Chancellor Amai: Show Gossip only if on quest "No Mercy for the Captured" '),
(15,9510,3,0,9,12245,0,0,0, '', 'Chancellor Amai: Show Gossip only if on quest "No Mercy for the Captured" ');
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=1019;
DELETE FROM `gameobject_template` WHERE `entry`=175984;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `WDBVerified`) VALUES
(175984, 8, 216, 'Cauldron', '', '', '', 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 15354);
DELETE FROM `smart_scripts` WHERE `entryorguid`=3094 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(3094,0,0,0,11,0,100,0,0,0,0,0,11,4986,2,0,0,0,0,1,0,0,0,0,0,0,0,'Unseen - On Respawn - Cast Unseen'); 
-- Spawns for Unseen from Sniffs
SET @GUID:=100173;
DELETE FROM `creature` WHERE `id`=3094;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID   ,3094,0,1,1,0,0,-10694.8,345.662,44.4895,2.09338,300,0,0,2215,0,0,0,0,0),
(@GUID+01,3094,0,1,1,0,0,-10702.9,360.152,39.7227,4.04982,300,0,0,2215,0,0,0,0,0),
(@GUID+02,3094,0,1,1,0,0,-10707.4,314.112,40.1481,4.46221,300,0,0,2215,0,0,0,0,0),
(@GUID+03,3094,0,1,1,0,0,-11096.8,-960.518,65.3837,0.650136,300,0,0,2292,0,0,0,0,0),
(@GUID+04,3094,0,1,1,0,0,-10800.4,-655.44,41.3178,0.206699,300,0,0,2292,0,0,0,0,0),
(@GUID+05,3094,0,1,1,0,0,-10782.8,-635.116,42.1594,2.53933,300,0,0,2138,0,0,0,0,0),
(@GUID+06,3094,0,1,1,0,0,-10806.6,-616.345,40.0752,4.601,300,0,0,2138,0,0,0,0,0),
(@GUID+07,3094,0,1,1,0,0,-10837.1,-573.623,36.5976,6.13188,300,0,0,2292,0,0,0,0,0),
(@GUID+08,3094,0,1,1,0,0,-10823,-564.998,37.4107,1.71623,300,0,0,2138,0,0,0,0,0),
(@GUID+10,3094,0,1,1,0,0,-10924,446.213,46.2609,5.96992,300,0,0,2138,0,0,0,0,0),
(@GUID+11,3094,0,1,1,0,0,-10747.1,257.103,42.0292,1.18606,300,0,0,2215,0,0,0,0,0),
(@GUID+12,3094,0,1,1,0,0,-10759.6,343.884,38.3282,5.24523,300,0,0,2138,0,0,0,0,0),
(@GUID+13,3094,0,1,1,0,0,-10731.5,364.135,37.2459,4.06321,300,0,0,2138,0,0,0,0,0),
(@GUID+14,3094,0,1,1,0,0,-10701.5,347.995,39.7227,3.22043,300,0,0,2215,0,0,0,0,0),
(@GUID+15,3094,0,1,1,0,0,-10694.8,344.219,39.7097,2.706,300,0,0,2292,0,0,0,0,0),
(@GUID+16,3094,0,1,1,0,0,-10715.6,263.155,43.9056,2.1562,300,0,0,2292,0,0,0,0,0),
(@GUID+17,3094,0,1,1,0,0,-11091.8,-954.163,65.348,1.59261,300,0,0,2215,0,0,0,0,0),
(@GUID+18,3094,0,1,1,0,0,-10937.8,-936.044,76.878,1.18113,300,0,0,2292,0,0,0,0,0),
(@GUID+19,3094,0,1,1,0,0,-10964.1,-949.174,71.1917,2.08064,300,0,0,2292,0,0,0,0,0),
(@GUID+20,3094,0,1,1,0,0,-10934.9,-928.656,72.1262,3.08437,300,0,0,2215,0,0,0,0,0),
(@GUID+21,3094,0,1,1,0,0,-10929.6,-936.748,72.126,2.29741,300,0,0,2292,0,0,0,0,0),
(@GUID+22,3094,0,1,1,0,0,-10798.5,-635.655,41.1281,1.31804,300,0,0,2292,0,0,0,0,0),
(@GUID+23,3094,0,1,1,0,0,-10830.1,-616.585,38.7076,3.76848,300,0,0,2292,0,0,0,0,0),
(@GUID+24,3094,0,1,1,0,0,-10677.6,314.27,33.6022,1.28606,300,0,0,2292,0,0,0,0,0),
(@GUID+25,3094,0,1,1,0,0,-10684.3,314.55,40.7586,3.14353,300,0,0,2138,0,0,0,0,0),
(@GUID+26,3094,0,1,1,0,0,-10368.7,-1258.33,35.9096,0.448286,300,0,0,2138,0,0,0,0,0),
(@GUID+27,3094,0,1,1,0,0,-10347.4,-1287.13,35.3003,1.44967,300,0,0,2138,0,0,0,0,0),
(@GUID+28,3094,0,1,1,0,0,-10368.6,-1290.02,35.303,0.263719,300,0,0,2292,0,0,0,0,0);
DELETE FROM `gameobject_template` WHERE `entry`=181073;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `WDBVerified`) VALUES
(181073, 2, 216, 'Fragrant Cauldron', '', '', '', 93, 7244, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 15211);
-- Doors should be closed
UPDATE `gameobject` SET `state`=1 WHERE `guid` IN (150074, 150073, 150077);

-- Duplicated Gameobject
DELETE FROM `gameobject` WHERE `guid`=150081;

-- Fix loots
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry` IN (27310, 27239);
DELETE FROM `gameobject_loot_template` WHERE `entry`=24524 AND `item`=52676;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(24524,52676,100,1,0,1,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=4 AND `SourceGroup`=24524 AND `SourceEntry`=52676;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(4,24524,52676,0,0,1,0,72221,0,0,0,0,0,'','Loot Cache of the Ley-Guardian only when aura Luck of the Draw applied');
UPDATE `achievement_criteria_data` SET `value1`=2 WHERE `criteria_id`=12979 AND `type`=12;
UPDATE `achievement_criteria_data` SET `value1`=1 WHERE `criteria_id`=12971 AND `type`=12;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=27310 AND `item`=47035;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=27239 AND `item`=46364;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=24589 AND `item`=43697;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=26666 AND `item`=44319;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=26667 AND `item`=44320;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=26668 AND `item`=44321;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=26878 AND `item`=45062;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=27725 AND `item`=49648;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=27723 AND `item`=49678;
DELETE FROM `gameobject` WHERE `id`=180184;
-- loot for Prismatic Black Diamond
DELETE FROM `spell_loot_template` WHERE `entry`=62941;
INSERT INTO `spell_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(62941, 23094, 0, 1, 1, 1, 1),
(62941, 23095, 0, 1, 1, 1, 1),
(62941, 28595, 0, 1, 1, 1, 1),
(62941, 23116, 0, 1, 1, 1, 1),
(62941, 23118, 0, 1, 1, 1, 1),
(62941, 23119, 0, 1, 1, 1, 1),
(62941, 23120, 0, 1, 1, 1, 1),
(62941, 23114, 0, 1, 1, 1, 1),
(62941, 23115, 0, 1, 1, 1, 1);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_marrowgar_bone_slice';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(69055,'spell_marrowgar_bone_slice'),
(70814,'spell_marrowgar_bone_slice');
UPDATE `npc_text` SET `WDBVerified`=1 WHERE `ID` IN (16777215, 31023);
UPDATE `gameobject_template` SET `WDBVerified`=1 WHERE `entry` IN (401003, 300238, 300212, 300209, 300208, 300207, 300204, 300203, 300200, 300199, 300190, 300188, 300187, 300185, 300182, 300175, 300170, 300033);
ALTER TABLE `lfg_entrances` CHARACTER SET utf8 COLLATE utf8_general_ci, ENGINE MyISAM;
-- Something Stinks (A:24655 H:24536)
SET @GUID           := 85637; -- set by TDB (need 10)(85637,85638,85639,85640,85641,85642,85643,85644,85645,85646,43498,43502,45075,45099)
SET @EVENT          := 8; -- Love is in the Air

SET @BUNNY          := 38288; -- Love Guard Perfume Bunny
SET @GUARD_SW       := 68; -- Stormwind City Guard
SET @PATROOLER_SW   := 1976; -- Stormwind City Patroller
SET @GUARD_ORG      := 3296; -- Orgrimmar Grunt
SET @ELITE_ORG      := 14304; -- Kor'kron Elite

SET @SPELL_PULSE    := 71520; -- Heavily Perfumed Pulse
SET @SPELL_BUFF     := 71507; -- Heavily Perfumed
SET @SPELL_ANALYSIS := 70192; -- Fragrant Air Analysis


DELETE FROM `creature` WHERE `id`=@BUNNY;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@BUNNY,0,1,1,0,0,-8825.604,629.3108,94.1137,0,300,0,0,1,0,0,0,0,0), -- sw trade district
(@GUID+1,@BUNNY,0,1,1,0,0,-8988.889,849.4149,105.9425,0,300,0,0,1,0,0,0,0,0), -- sw mage quarter
(@GUID+2,@BUNNY,0,1,1,0,0,-8737.654,1051.887,90.8816,0,300,0,0,1,0,0,0,0,0), -- sw the park
(@GUID+3,@BUNNY,0,1,1,0,0,-8625.038,780.0799,96.73399,0,300,0,0,1,0,0,0,0,0), -- sw cathedral square
(@GUID+4,@BUNNY,0,1,1,0,0,-8433.189,607.2205,95.13025,0,300,0,0,1,0,0,0,0,0), -- sw dwarven district
(@GUID+5,@BUNNY,0,1,1,0,0,-8486.955,390.5139,108.4689,0,300,0,0,1,0,0,0,0,0), -- sw stormwind keep
(@GUID+6,@BUNNY,0,1,1,0,0,-8676.724,444.5052,99.73087,0,300,0,0,1,0,0,0,0,0), -- sw old town
--
(@GUID+7,@BUNNY,1,1,1,0,0,1573.92,-4397.11,16.00813,0,300,0,0,1,0,0,0,0,0), -- org valley of strength
(@GUID+8,@BUNNY,1,1,1,0,0,1893.24,-4507.31,24.94853,0,300,0,0,1,0,0,0,0,0), -- org the drag
(@GUID+9,@BUNNY,1,1,1,0,0,2015.27,-4687.4,28.61023,0,300,0,0,1,0,0,0,0,0); -- org valley of honor

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_PULSE;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL_BUFF;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_PULSE,0,0,31,0,3,@GUARD_SW,0,0,0,0,'',"Heavily Perfumed Pulse target Stormwind City Guard"),
(13,1,@SPELL_PULSE,0,1,31,0,3,@PATROOLER_SW,0,0,0,0,'',"Heavily Perfumed Pulse target Stormwind City Patroller"),
(13,1,@SPELL_PULSE,0,2,31,0,3,@GUARD_ORG,0,0,0,0,'',"Heavily Perfumed Pulse target Orgrimmar Grunt"),
(13,1,@SPELL_PULSE,0,3,31,0,3,@ELITE_ORG,0,0,0,0,'',"Heavily Perfumed Pulse target Kor'kron Elite"),
(17,0,@SPELL_BUFF,0,0,1,0,@SPELL_BUFF,0,0,1,0,0,'',"Apply Heavily Perfumed only when missing");

UPDATE `creature_template` SET `AIName`='SmartAI',`InhabitType`=4,`flags_extra`=`flags_extra`|128 WHERE `entry`=@BUNNY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BUNNY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BUNNY,0,0,0,60,0,100,0,0,0,600000,600000,11,@SPELL_PULSE,0,0,0,0,0,1,0,0,0,0,0,0,0,"On update(each 10 min) - Cast - Self");

-- ussing this because dummy effect #1 of spell 70192 is to remove the buff
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@SPELL_ANALYSIS;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@SPELL_ANALYSIS,-@SPELL_BUFF,1,'Remove Heavily Perfumed on Fragrant Air Analysis hit');

DELETE FROM `game_event_creature` WHERE `eventEntry`=@EVENT AND `guid` BETWEEN @GUID+0 AND @GUID+9;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(@EVENT,@GUID+0),
(@EVENT,@GUID+1),
(@EVENT,@GUID+2),
(@EVENT,@GUID+3),
(@EVENT,@GUID+4),
(@EVENT,@GUID+5),
(@EVENT,@GUID+6),
(@EVENT,@GUID+7),
(@EVENT,@GUID+8),
(@EVENT,@GUID+9);
-- Ragnaros
UPDATE `creature_text` SET `text`='TOO SOON! YOU HAVE AWAKENED ME TOO SOON, EXECUTUS! WHAT IS THE MEANING OF THIS INTRUSION???' WHERE `entry`=11502 AND `groupid`=1;
UPDATE `creature_text` SET `text`='FOOL! YOU ALLOWED THESE INSECTS TO RUN RAMPANT THROUGH THE HALLOWED CORE? AND NOW YOU LEAD THEM TO MY VERY LAIR? YOU HAVE FAILED ME, EXECUTUS! JUSTICE SHALL BE MET, INDEED!' WHERE `entry`=11502 AND `groupid`=3;
UPDATE `creature_text` SET `text`='NOW FOR YOU, INSECTS! BOLDLY, YOU SOUGHT THE POWER OF RAGNAROS. NOW YOU SHALL SEE IT FIRSTHAND!' WHERE `entry`=11502 AND `groupid`=4;
UPDATE `creature_text` SET `text`='DIE, INSECT!' WHERE `entry`=11502 AND `groupid`=9;

-- Core Rager
UPDATE `creature_text` SET `text`='%s refuses to die while its master is endangered!' WHERE `entry`=11672 AND `groupid`=0;

-- Morridune
UPDATE `creature_text` SET `text`='Aku''mai is dead! At last, I can leave this wretched place.' WHERE `entry`=6729 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Speak with me to hear my tale.' WHERE `entry`=6729 AND `groupid`=1;

-- Amnennar the Coldbringer
UPDATE `creature_text` SET `text`='You''ll never leave this place alive.' WHERE `entry`=7358 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Come, spirits - attend your master!' WHERE `entry`=7358 AND `groupid`=2;
UPDATE `creature_text` SET `text`='Too easy.', `type`=12 WHERE `entry`=7358 AND `groupid`=4;

-- Weegli Blastfuse
UPDATE `creature_text` SET `text`='Oh no!  Here they come!' WHERE `entry`=7607 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Ok, here I go!' WHERE `entry`=7607 AND `groupid`=1;

-- The Prophet Skeram
UPDATE `creature_text` SET `text`='Are you so eager to die? I will be happy to accommodate you...' WHERE `entry`=15263 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='You only delay the inevitable!' WHERE `entry`=15263 AND `groupid`=3;

-- Ossirian the Unscarred
UPDATE `creature_text` SET `text`='Sands of the desert, rise and block out the sun!' WHERE `entry`=15339 AND `groupid`=2;

-- General Rajaxx
UPDATE `creature_text` SET `text`='Warriors, Captains, continue the fight! ' WHERE `entry`=15341 AND `groupid`=9;
UPDATE `creature_text` SET `text`='Breathe your last!' WHERE `entry`=15341 AND `groupid`=11;

-- Buru the Gorger
UPDATE `creature_text` SET `text`='%s sets eyes on $n!' WHERE `entry`=15370 AND `groupid`=0;

-- Spectral Stable Hand
UPDATE `creature_text` SET `type`=12 WHERE `entry`=15551 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='What will become of--' WHERE `entry`=15551 AND `groupid`=0 AND `id`=1;

-- Medivh
UPDATE `creature_text` SET `text`='The time has come! Gul''dan, order your warlocks to double their efforts! Moments from now the gateway will open and your Horde will be released upon this ripe, unsuspecting world!' WHERE `entry`=15608 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Champions! My shield grows weak!' WHERE `entry`=15608 AND `groupid`=2;
UPDATE `creature_text` SET `text`='No! Damn this feeble, mortal coil!' WHERE `entry`=15608 AND `groupid`=5;
UPDATE `creature_text` SET `text`='I am grateful for your aid, champions. Now, Gul''dan''s Horde will sweep across this world like a locust swarm, and all my designs, all my carefully-laid plans will at last fall into place.' WHERE `entry`=15608 AND `groupid`=6;
UPDATE `creature_text` SET `text`='Orcs of the Horde! This portal is the gateway to your new destiny! Azeroth lies before you, ripe for the taking!' WHERE `entry`=15608 AND `groupid`=7;

-- Moroes <Tower Steward>
UPDATE `creature_text` SET `text`='Hm, unannounced visitors. Preparations must be made...' WHERE `entry`=15687 AND `groupid`=0;
UPDATE `creature_text` SET `text`='How terribly clumsy of me.' WHERE `entry`=15687 AND `groupid`=3;

-- Terestian Illhoof
UPDATE `creature_text` SET `text`='Your blood will anoint my circle!' WHERE `entry`=15688 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='My life is yours, oh great one...' WHERE `entry`=15688 AND `groupid`=1;
UPDATE `creature_text` SET `text`='Ah, you''re just in time. The rituals are about to begin!' WHERE `entry`=15688 AND `groupid`=2;
UPDATE `creature_text` SET `text`='Please accept this humble offering, oh great one...' WHERE `entry`=15688 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `text`='Let this sacrifice serve as testament to my fealty.' WHERE `entry`=15688 AND `groupid`=3 AND `id`=1;
UPDATE `creature_text` SET `text`='Come, you dwellers in the dark! Rally to my call!' WHERE `entry`=15688 AND `groupid`=4 AND `id`=0;
UPDATE `creature_text` SET `text`='Gather, my pets... there is plenty for all!' WHERE `entry`=15688 AND `groupid`=4 AND `id`=1;

-- Prince Malchezaar
UPDATE `creature_text` SET `text`='How can you hope to stand against such overwhelming power?' WHERE `entry`=15690 AND `groupid`=5;
UPDATE `creature_text` SET `text`='I refuse to concede defeat! I am a prince of the Eredar! I... am...' WHERE `entry`=15690 AND `groupid`=8;

-- The Curator
UPDATE `creature_text` SET `text`='This Curator is equipped for gallery protection.' WHERE `entry`=15691 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='Curator is no longer operation-a-l.' WHERE `entry`=15691 AND `groupid`=5;

-- Thaddius
UPDATE `creature_text` SET `text`='You are too late!! I... must... obey!!' WHERE `entry`=15928 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Kill...' WHERE `entry`=15928 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `text`='Eat... your... bones...' WHERE `entry`=15928 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='Break... you!!' WHERE `entry`=15928 AND `groupid`=1 AND `id`=2;
UPDATE `creature_text` SET `text`='You... die now!!' WHERE `entry`=15928 AND `groupid`=2;
UPDATE `creature_text` SET `text`='Now you feel pain...' WHERE `entry`=15928 AND `groupid`=3;

-- Feugen 
UPDATE `creature_text` SET `text`='Feugen make master happy.' WHERE `entry`=15930 AND `groupid`=1;

-- Grand Widow Faerlina
UPDATE `creature_text` SET `text`='Your old lives, your mortal desires mean nothing... you are acolytes of the master now, and you will serve the cause without question! The greatest glory is to die in the master''s service!' WHERE `entry`=15953 AND `groupid`=0;
UPDATE `creature_text` SET `text`='The master will avenge me!!' WHERE `entry`=15953 AND `groupid`=3;

-- Anub'Rekhan
UPDATE `creature_text` SET `text`='Yes, run! It makes the blood pump faster!' WHERE `entry`=15956 AND `groupid`=0 AND `id`=2;
UPDATE `creature_text` SET `text`='I hear little hearts beating. Yes... beating faster now... soon the beating will stop.' WHERE `entry`=15956 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='Which one shall I eat first? So difficult to choose. They all smell so delicious...' WHERE `entry`=15956 AND `groupid`=1 AND `id`=3;
UPDATE `creature_text` SET `text`='Closer now. Tasty morsels. I''ve been too long without food, without blood to drink.' WHERE `entry`=15956 AND `groupid`=1 AND `id`=4;
UPDATE `creature_text` SET `text`='Shhh... it will all be over soon.' WHERE `entry`=15956 AND `groupid`=2;

-- Kel'Thuzad
UPDATE `creature_text` SET `text`='Your forces are nearly marshaled to strike back against your enemies, my liege.' WHERE `entry`=15990 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Yes, master. The time of their ultimate demise draws close.... What is this?' WHERE `entry`=15990 AND `groupid`=2;
UPDATE `creature_text` SET `text`='As you command, master!' WHERE `entry`=15990 AND `groupid`=4;
UPDATE `creature_text` SET `text`='Fools! You think yourselves triumphant? You have only taken one step closer to the abyss!' WHERE `entry`=15990 AND `groupid`=6 AND `id`=1;
UPDATE `creature_text` SET `text`='%s cackles maniacally.', `type`=16 WHERE `entry`=15990 AND `groupid`=8 AND `id`=1;
UPDATE `creature_text` SET `text`='Agghhhh! Do... not... rejoice! Your victory is a hollow one, for I shall return with powers beyond your imagining!' WHERE `entry`=15990 AND `groupid`=9;
UPDATE `creature_text` SET `text`='Your soul is bound to me, now!' WHERE `entry`=15990 AND `groupid`=10 AND `id`=0;
UPDATE `creature_text` SET `text`='Master, I require aid!' WHERE `entry`=15990 AND `groupid`=12;
UPDATE `creature_text` SET `text`='Minions, servants, soldiers of the cold dark! Obey the call of Kel''Thuzad!' WHERE `entry`=15990 AND `groupid`=14;

-- Patchwerk
UPDATE `creature_text` SET `text`='Kel''thuzad make Patchwerk his avatar of war!' WHERE `entry`=16028 AND `groupid`=0 AND `id`=1;
UPDATE `creature_text` SET `text`='What... happen to-' WHERE `entry`=16028 AND `groupid`=2;
UPDATE `creature_text` SET `text`='%s goes into a frenzy!', `type`=41 WHERE `entry`=16028 AND `groupid`=4;

-- Spectral Servant
UPDATE `creature_text` SET `type`=12 WHERE `entry`=16407 AND `groupid`=0 AND `id`=0;

-- Maiden of Virtue
UPDATE `creature_text` SET `text`='Your behavior will not be tolerated.' WHERE `entry`=16457 AND `groupid`=0;

-- Shade of Aran
UPDATE `creature_text` SET `text`='Please, no more! My son... he''s gone mad!' WHERE `entry`=16524 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='I''ll show you: this beaten dog still has some teeth!' WHERE `entry`=16524 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `text`='Burn, you hellish fiends!' WHERE `entry`=16524 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='Yes, yes my son is quite powerful... but I have powers of my own!' WHERE `entry`=16524 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `text`='I''m not finished yet! No, I have a few more tricks up my sleeve...', `type`=12 WHERE `entry`=16524 AND `groupid`=5;
UPDATE `creature_text` SET `text`='At last the nightmare is over...' WHERE `entry`=16524 AND `groupid`=8;

-- Martik Tor'seldori
UPDATE `creature_text` SET `text`='Brothers and sisters, I have been to the promised land. I have tasted in the sublime energy. I have felt bliss - bliss so engrossing and all encompassing that I was left wondering if I had stumbled upon the dreams of gods.' WHERE `entry`=16577 AND `groupid`=0;

-- Grand Warlock Nethekurse
UPDATE `creature_text` SET `text`='You can have that one, I no longer need him!' WHERE `entry`=16807 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `text`='Yes, beat him mercilessly! His skull is as thick as an ogre''s!' WHERE `entry`=16807 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='Don''t waste your time on that one, he''s weak!' WHERE `entry`=16807 AND `groupid`=1 AND `id`=2;
UPDATE `creature_text` SET `text`='One pitiful wretch down. Go on, take another one!' WHERE `entry`=16807 AND `groupid`=2 AND `id`=0;
UPDATE `creature_text` SET `text`='Ah, what a waste... next!' WHERE `entry`=16807 AND `groupid`=2 AND `id`=1;
UPDATE `creature_text` SET `text`='Thank you for saving me the trouble. Now it''s my turn to have some fun!' WHERE `entry`=16807 AND `groupid`=2 AND `id`=3;
UPDATE `creature_text` SET `text`='Beg for your pitiful life!' WHERE `entry`=16807 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `text`='Run, coward, run!   ' WHERE `entry`=16807 AND `groupid`=3 AND `id`=1; -- Blizz fail.
UPDATE `creature_text` SET `text`='Your pain amuses me!' WHERE `entry`=16807 AND `groupid`=3 AND `id`=2;
UPDATE `creature_text` SET `text`='I''m already bored!' WHERE `entry`=16807 AND `groupid`=4 AND `id`=0;
UPDATE `creature_text` SET `text`='Come on, show me a real fight!' WHERE `entry`=16807 AND `groupid`=4 AND `id`=1;
UPDATE `creature_text` SET `text`='I had more fun torturing the peons!' WHERE `entry`=16807 AND `groupid`=4 AND `id`=2;
UPDATE `creature_text` SET `text`='You lose.' WHERE `entry`=16807 AND `groupid`=5 AND `id`=0;
UPDATE `creature_text` SET `text`='Oh, just die!' WHERE `entry`=16807 AND `groupid`=5 AND `id`=1;
UPDATE `creature_text` SET `text`='What... a shame.' WHERE `entry`=16807 AND `groupid`=6;

-- Warchief Kargath Bladefist
UPDATE `creature_text` SET `text`='Ours is the TRUE Horde! The only Horde!' WHERE `entry`=16808 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='I am called Bladefist for a reason. As you will see.' WHERE `entry`=16808 AND `groupid`=0 AND `id`=2;
UPDATE `creature_text` SET `text`='I am the ONLY warchief!' WHERE `entry`=16808 AND `groupid`=1 AND `id`=1;
UPDATE `creature_text` SET `text`='The true Horde... will prevail.' WHERE `entry`=16808 AND `groupid`=2;

-- Barnes <The Stage Manager>
UPDATE `creature_text` SET `text`='Welcome ladies and gentlemen, to this evening''s presentation!' WHERE `entry`=16812 AND `groupid`=0;
UPDATE `creature_text` SET `text`='Tonight we plumb the depths of the human soul as we join a lost, lonely girl trying desperately--with the help of her loyal companions--to find her way home!' WHERE `entry`=16812 AND `groupid`=1;
UPDATE `creature_text` SET `text`='But she is pursued... by a wicked, malevolent crone!' WHERE `entry`=16812 AND `groupid`=2;
UPDATE `creature_text` SET `text`='Will she survive? Will she prevail? Only time will tell. And now... on with the show!' WHERE `entry`=16812 AND `groupid`=3;
UPDATE `creature_text` SET `text`='Good evening ladies and gentlemen, welcome to this evening''s presentation!' WHERE `entry`=16812 AND `groupid`=4;
UPDATE `creature_text` SET `text`='Tonight, things are not what they seem... for tonight your eyes may not be trusted!' WHERE `entry`=16812 AND `groupid`=5;
UPDATE `creature_text` SET `text`='Take for instance this quiet elderly woman waiting for a visit from her granddaughter... surely there is nothing to fear from this sweet, gray-haired old lady!' WHERE `entry`=16812 AND `groupid`=6;
UPDATE `creature_text` SET `text`='But don''t let me pull the wool over your eyes! See for yourself what lies beneath those covers! And now... on with the show!' WHERE `entry`=16812 AND `groupid`=7;
UPDATE `creature_text` SET `text`='Welcome ladies and gentlemen, to this evening''s presentation!' WHERE `entry`=16812 AND `groupid`=8;
UPDATE `creature_text` SET `text`='Tonight... we explore a tale of forbidden love!' WHERE `entry`=16812 AND `groupid`=9;
UPDATE `creature_text` SET `text`='But beware, for not all love stories end happily, as you may find out. Sometimes, love pricks like a thorn!' WHERE `entry`=16812 AND `groupid`=10;
UPDATE `creature_text` SET `text`='But don''t take it from me; see for yourself what tragedy lies ahead when the paths of star crossed lovers meet! And now... on with the show!' WHERE `entry`=16812 AND `groupid`=11;

-- Shadow Council Enforcer
UPDATE `creature_text` SET `text`='Gul''dan speaks the truth! We should return at once to tell our brothers of the news! Retreat back through the portal!', `type`=14 WHERE `entry`=17023 AND `groupid`=0;

-- Nightbane
UPDATE `creature_text` SET `text`='%s takes a deep breath.', `type`=41 WHERE `entry`=17225 AND `groupid`=4;
-- Pilfering Perfume (A:24656 H:24541)

SET @QUEST_A           := 24656;
SET @QUEST_H           := 24541;

SET @SNIP              := 38066; -- Inspector Snip Snagglebolt
SET @SNAP              := 37172; -- Detective Snap Snagglebolt
SET @MENUID            := 10976;

SET @TRIGGER_SW_OUT    := 5703; -- outside
SET @TRIGGER_SW_IN     := 5704; -- inside
SET @TRIGGER_ORG_OUT   := 5705; -- outside
SET @TRIGGER_ORG_IN    := 5706; -- inside

SET @SPELL_UNIFORM     := 71450; -- Crown Parcel Service Uniform
SET @SPELL_CONTRABAND  := 71459; -- Crown Chemical Co. Contraband

SET @SPELL_CREDIT_A    := 71522; -- Crown Chemical Co. Supplies
SET @SPELL_CREDIT_H    := 71539; -- Crown Chemical Co. Supplies

SET @GUID              := 48571; -- set by TDB,need 3 (48571,48572,48573)
SET @EVENT             := 8; -- Love is in the Air
SET @NPC_GUARD         := 37671; -- Crown Supply Guard

-- missing npcs on horde side
DELETE FROM `creature` WHERE `id`=@NPC_GUARD;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@NPC_GUARD,1,1,1,0,0,1391.2,-4486.23,31.4544,3.3355,300,0,0,42,0,0,0,0,0),
(@GUID+1,@NPC_GUARD,1,1,1,0,0,1392.66,-4481.87,31.3782,1.97284,300,0,0,42,0,0,0,0,0),
(@GUID+2,@NPC_GUARD,1,1,1,0,0,1393.92,-4489.57,31.4737,4.93701,300,0,0,42,0,0,0,0,0);

DELETE FROM `game_event_creature` WHERE `eventEntry`=@EVENT AND `guid` BETWEEN @GUID+0 AND @GUID+2;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(@EVENT,@GUID+0),
(@EVENT,@GUID+1),
(@EVENT,@GUID+2);

-- removing a wrong spawn
DELETE FROM `creature` WHERE `guid`=40507;
DELETE FROM `game_event_creature` WHERE `guid`=40507;

-- deleting wrong previous spawns and reusing some guids to spawn proper ones
DELETE FROM `gameobject` WHERE `guid` IN (24416,24417,24418,24419,24420,24421,24422,24423,24433,24434,24435,24436,24437,24438,24439,24440,24441);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(24416,181015,1,1,1,1392.938,-4485.202,31.41421,0,0,0,0,1,120,255,1),
(24417,201778,1,1,1,1393.677,-4486.033,32.67227,0,0,0,0,1,120,255,1),
(24418,201752,1,1,1,1394.184,-4484.108,31.24833,4.32842,0,0,0,1,120,255,1),
(24419,201778,1,1,1,1394.26,-4484.368,32.50796,5.148723,0,0,0,1,120,255,1),
(24420,201752,1,1,1,1393.319,-4486.797,31.42903,4.101525,0,0,0,1,120,255,1),
(24421,201752,1,1,1,1394.401,-4485.688,31.35416,5.916668,0,0,0,1,120,255,1),
(24422,201752,1,1,1,1394.042,-4488.397,31.4775,4.32842,0,0,0,1,120,255,1),
(24423,201752,1,1,1,1396.476,-4482.715,32.14788,4.32842,0,0,0,1,120,255,1),
(24433,181015,1,1,1,1395.002,-4487.113,31.37537,3.874631,0,0,0,1,120,255,1),
(24434,181015,1,1,1,1396.632,-4482.505,30.87226,5.166176,0,0,0,1,120,255,1),
(24435,201752,1,1,1,1395.813,-4486.439,32.56021,1.710422,0,0,0,1,120,255,1),
(24436,201752,1,1,1,1396.595,-4486.056,31.15484,4.32842,0,0,0,1,120,255,1),
(24437,201752,1,1,1,1397.377,-4488.021,33.71862,0.157079,0,0,0,1,120,255,1),
(24438,181015,1,1,1,1397.51,-4487.901,32.46279,3.68265,0,0,0,1,120,255,1),
(24439,201752,1,1,1,1397.571,-4487.939,31.21067,3.33359,0,0,0,1,120,255,1);
-- these guids will remain free
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=@EVENT AND `guid` IN (24440,24441);

-- Snip & Snap sai
UPDATE `creature_template` SET `npcflag`=`npcflag`|1|2,`gossip_menu_id`=@MENUID,`AIName`='SmartAI' WHERE `entry` IN (@SNIP,@SNAP);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SNIP,@SNAP) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SNIP,0,0,0,19,0,100,0,@QUEST_A,0,0,0,11,@SPELL_UNIFORM,0,0,0,0,0,7,0,0,0,0,0,0,0,'Snip - On quest accept - Spellcast'),
(@SNIP,0,1,2,62,0,100,0,@MENUID,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Snip - On gossip option select - Close gossip'),
(@SNIP,0,2,0,61,0,100,0,0,0,0,0,11,@SPELL_UNIFORM,0,0,0,0,0,7,0,0,0,0,0,0,0,'Snip - On gossip option accept - Spellcast'),
--
(@SNAP,0,0,0,19,0,100,0,@QUEST_H,0,0,0,11,@SPELL_UNIFORM,0,0,0,0,0,7,0,0,0,0,0,0,0,'Snap - On quest accept - Spellcast'),
(@SNAP,0,1,2,62,0,100,0,@MENUID,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Snap - On gossip option select - Close gossip'),
(@SNAP,0,2,0,61,0,100,0,0,0,0,0,11,@SPELL_UNIFORM,0,0,0,0,0,7,0,0,0,0,0,0,0,'Snap - On gossip option accept - Spellcast');

DELETE FROM `areatrigger_involvedrelation` WHERE `id` IN (@TRIGGER_SW_OUT,@TRIGGER_SW_IN,@TRIGGER_ORG_OUT,@TRIGGER_ORG_IN);
INSERT INTO `areatrigger_involvedrelation` (`id`,`quest`) VALUES
(@TRIGGER_SW_OUT,@QUEST_A),
(@TRIGGER_SW_IN,@QUEST_A),
--
(@TRIGGER_ORG_OUT,@QUEST_H),
(@TRIGGER_ORG_IN,@QUEST_H);

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (@TRIGGER_SW_OUT,@TRIGGER_SW_IN,@TRIGGER_ORG_OUT,@TRIGGER_ORG_IN);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(@TRIGGER_SW_OUT,'SmartTrigger'),
(@TRIGGER_SW_IN,'SmartTrigger'),
--
(@TRIGGER_ORG_OUT,'SmartTrigger'),
(@TRIGGER_ORG_IN,'SmartTrigger');

-- usig invoker cast because normal cast doesn't want to work(LoS issue,i think)
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@TRIGGER_SW_OUT,@TRIGGER_SW_IN,@TRIGGER_ORG_OUT,@TRIGGER_ORG_IN) AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TRIGGER_SW_OUT,2,0,0,46,0,100,0,@TRIGGER_SW_OUT,0,0,0,85,@SPELL_CONTRABAND,0,0,0,0,0,7,0,0,0,0,0,0,0,"On Trigger - Cast - Invoker"),
(@TRIGGER_SW_IN,2,0,0,46,0,100,0,@TRIGGER_SW_IN,0,0,0,85,@SPELL_CREDIT_A,0,0,0,0,0,7,0,0,0,0,0,0,0,"On Trigger - Cast - Invoker"),
--
(@TRIGGER_ORG_OUT,2,0,0,46,0,100,0,@TRIGGER_ORG_OUT,0,0,0,85,@SPELL_CONTRABAND,0,0,0,0,0,7,0,0,0,0,0,0,0,"On Trigger - Cast - Invoker"),
(@TRIGGER_ORG_IN,2,0,0,46,0,100,0,@TRIGGER_ORG_IN,0,0,0,85,@SPELL_CREDIT_H,0,0,0,0,0,7,0,0,0,0,0,0,0,"On Trigger - Cast - Invoker");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` IN (@TRIGGER_SW_OUT,@TRIGGER_SW_IN,@TRIGGER_ORG_OUT,@TRIGGER_ORG_IN);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@TRIGGER_SW_OUT,2,0,1,0,@SPELL_UNIFORM,0,0,0,0,0,'','execute sai only if player has aura'),
(22,1,@TRIGGER_SW_IN,2,0,1,0,@SPELL_CONTRABAND,0,0,0,0,0,'','execute sai only if player has aura'),
(15,@MENUID,0,0,0,9,0,@QUEST_A,0,0,0,0,0,'','show gossip option only if player has quest taken'),
--
(22,1,@TRIGGER_ORG_OUT,2,0,1,0,@SPELL_UNIFORM,0,0,0,0,0,'','execute sai only if player has aura'),
(22,1,@TRIGGER_ORG_IN,2,0,1,0,@SPELL_CONTRABAND,0,0,0,0,0,'','execute sai only if player has aura'),
(15,@MENUID,0,0,1,9,0,@QUEST_H,0,0,0,0,0,'','show gossip option only if player has quest taken');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (@SPELL_CREDIT_A,@SPELL_CREDIT_H,-@SPELL_UNIFORM);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@SPELL_CREDIT_A,-@SPELL_UNIFORM,1,'Remove Crown Parcel Service Uniform on Crown Chemical Co. Supplies hit'),
(@SPELL_CREDIT_H,-@SPELL_UNIFORM,1,'Remove Crown Parcel Service Uniform on Crown Chemical Co. Supplies hit'),
(-@SPELL_UNIFORM,-@SPELL_CONTRABAND,0,'Remove Crown Chemical Co. Contraband when Crown Parcel Service Uniform is removed');

DELETE FROM `spell_script_names` WHERE `spell_id`=@SPELL_UNIFORM;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(@SPELL_UNIFORM,'spell_gen_aura_service_uniform');
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 63 AND 95;
INSERT INTO trinity_string (entry, content_default) VALUES
(63, "Wrong parameter id: %u, does not exist"),
(64, "Wrong parameter realmId: %d"),
(65, "Couldn't add group %u (%s) realmId %d. Account %u (%s) already has that group"),
(66, "Couldn't remove group %u (%s) realmId %d. Account %u (%s) does not have that group"),
(67, "Added group %u (%s) realmId %d to account %u (%s)"),
(68, "Removed group %u (%s) realmId %d from account %u (%s)"),
(69, "Account %u (%s) groups:"),
(70, "Empty List"),
(71, "- %u (%s)"),
(72, "Couldn't grant role %u (%s) realmId %d. Account %u (%s) already has that role"),
(73, "Couldn't grant role %u (%s) realmId %d. Account %u (%s) has that role in deny list"),
(74, "Granted role %u (%s) realmId %d to account %u (%s)"),
(75, "Couldn't deny role %u (%s) realmId %d. Account %u (%s) already has that role"),
(76, "Couldn't deny role %u (%s) realmId %d. Account %u (%s) has that role in deny list"),
(77, "Denied role %u (%s) realmId %d to account %u (%s)"),
(78, "Denied role %u (%s) realmId %d to account %u (%s)"),
(79, "Couldn't revoke role %u (%s) realmId %d. Account %u (%s) does not have that role"),
(80, "Account %u (%s) granted roles:"),
(81, "Account %u (%s) denied roles:"),
(82, "Couldn't grant permission %u (%s) realmId %d. Account %u (%s) already has that permission"),
(83, "Couldn't grant permission %u (%s) realmId %d. Account %u (%s) has that permission in deny list"),
(84, "Granted permission %u (%s) realmId %d to account %u (%s)"),
(85, "Couldn't deny permission %u (%s) realmId %d. Account %u (%s) already has that permission"),
(86, "Couldn't deny permission %u (%s) realmId %d. Account %u (%s) has that permission in deny list"),
(87, "Denied permission %u (%s) realmId %d to account %u (%s)"),
(88, "Revoked permission %u (%s) realmId %d to account %u (%s)"),
(89, "Couldn't revoke permission %u (%s) realmId %d. Account %u (%s) does not have that permission"),
(90, "Account %u (%s) granted permissions:"),
(91, "Account %u (%s) denied permissions:"),
(92, "Account %u (%s) global permissions:"),
(93, "Groups:"),
(94, "Roles:"),
(95, "Permissions:");

DELETE FROM `command` WHERE `name` LIKE '.rbac%';
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('.rbac account',                   3, 'Syntax: .rbac account [$account]\n\nView permissions of selected player or given account\nNote: Only those that affect current realm\n\nNote: Shows real permissions after checking group and roles'),
('.rbac account group',             3, 'Syntax: .rbac account group [$account]\n\nView groups of selected player or given account\nNote: Only those that affect current realm'),
('.rbac account group add',         3, 'Syntax: .rbac account group add [$account] #id [#realmId]\n\nAdd a group to selected player or given account.\n\n#reamID may be -1 for all realms.'),
('.rbac account group remove',      3, 'Syntax: .rbac account group remove [$account] #id\n\nRemove a group from selected player or given account.'),
('.rbac account role',              3, 'Syntax: .rbac account role [$account]\n\nView roles of selected player or given account\nNote: Only those that affect current realm\nNote: Only those directly granted or denied, does not include inherited roles from groups'),
('.rbac account role grant',        3, 'Syntax: .rbac account role grant [$account] #id [#realmId]\n\nGrant a role to selected player or given account.\n\n#reamID may be -1 for all realms.'),
('.rbac account role deny',         3, 'Syntax: .rbac account role deny [$account] #id [#realmId]\n\nDeny a role to selected player or given account.\n\n#reamID may be -1 for all realms.'),
('.rbac account role revoke',       3, 'Syntax: .rbac account role revoke [$account] #id\n\nRemove a role from an account\n\nNote: Removes the role from granted or denied roles'),
('.rbac account permission',        3, 'Syntax: .rbac account permission [$account]\n\nView permissions of selected player or given account\nNote: Only those that affect current realm\nNote: Only those directly granted or denied, does not include inherited permissions from roles'),
('.rbac account permission grant',  3, 'Syntax: .rbac account permission grant [$account] #id [#realmId]\n\nGrant a permission to selected player or given account.\n\n#reamID may be -1 for all realms.'),
('.rbac account permission deny',   3, 'Syntax: .rbac account permission deny [$account] #id [#realmId]\n\nDeny a permission to selected player or given account.\n\n#reamID may be -1 for all realms.'),
('.rbac account permission revoke', 3, 'Syntax: .rbac account permission revoke [$account] #id\n\nRemove a permission from an account\n\nNote: Removes the permission from granted or denied permissions'),
('.rbac list groups',               3, 'Syntax: .rbac list groups [$id]\n\nView list of all groups. If $id is given will show group info and his inherited roles.'),
('.rbac list roles',                3, 'Syntax: .rbac list roles [$id]\n\nView list of all roles. If $id is given will show role info and his inherited permissions.'),
('.rbac list permissions',          3, 'Syntax: .rbac list permissions [$id]\n\nView list of all permissions. If $id is given will show only info for that permission.');
DELETE FROM `trinity_string` WHERE entry IN (300,550);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('300','Your chat has been disabled for %u minutes. By: %s ,Reason: %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('550','Mute time remaining: %s, By: %s, Reason: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_luck_of_the_draw';
UPDATE `command` SET `name` = 'rbac account'                   WHERE `name` LIKE '.rbac account';
UPDATE `command` SET `name` = 'rbac account group'             WHERE `name` LIKE '.rbac account group';
UPDATE `command` SET `name` = 'rbac account group add'         WHERE `name` LIKE '.rbac account group add';
UPDATE `command` SET `name` = 'rbac account group remove'      WHERE `name` LIKE '.rbac account group remove';
UPDATE `command` SET `name` = 'rbac account permission'        WHERE `name` LIKE '.rbac account permission';
UPDATE `command` SET `name` = 'rbac account permission deny'   WHERE `name` LIKE '.rbac account permission deny';
UPDATE `command` SET `name` = 'rbac account permission grant'  WHERE `name` LIKE '.rbac account permission grant';
UPDATE `command` SET `name` = 'rbac account permission revoke' WHERE `name` LIKE '.rbac account permission revoke';
UPDATE `command` SET `name` = 'rbac account role'              WHERE `name` LIKE '.rbac account role';
UPDATE `command` SET `name` = 'rbac account role deny'         WHERE `name` LIKE '.rbac account role deny';
UPDATE `command` SET `name` = 'rbac account role grant'        WHERE `name` LIKE '.rbac account role grant';
UPDATE `command` SET `name` = 'rbac account role revoke'       WHERE `name` LIKE '.rbac account role revoke';
UPDATE `command` SET `name` = 'rbac list groups'               WHERE `name` LIKE '.rbac list groups';
UPDATE `command` SET `name` = 'rbac list permissions'          WHERE `name` LIKE '.rbac list permissions';
UPDATE `command` SET `name` = 'rbac list roles'                WHERE `name` LIKE '.rbac list roles';
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (3931,12859,4227,3929);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
-- aliance
-- Kissed Sraaz
(3931,1,9099,0,''),
(3931,11,0,0,'achievement_flirt_with_disaster_perf_check'),
(3931,15,3,0,''),
-- Handful of Rose Petals on Sraaz
(12859,1,9099,0,''),
(12859,11,0,0,'achievement_flirt_with_disaster_perf_check'),
(12859,15,3,0,''),
-- horde
-- Kissed Jeremiah Payson
(3929,1,8403,0,''),
(3929,11,0,0,'achievement_flirt_with_disaster_perf_check'),
(3929,15,3,0,''),
-- Handful of Rose Petals on Jeremiah Payson
(4227,1,8403,0,''),
(4227,11,0,0,'achievement_flirt_with_disaster_perf_check'),
(4227,15,3,0,'');
UPDATE `creature_template` SET `faction_A`=15, `faction_H`=15, `speed_walk`=1.111112, `baseattacktime`=2000, `rangeattacktime`=2000, `dynamicflags`=0 WHERE `entry`=3094; -- Unseen
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=16378;
INSERT INTO `disables`(`sourceType`,`entry`,`flags`) VALUE
(0,16378,64);
DELETE FROM `item_template` WHERE `entry` IN (54516, 54537);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `WDBVerified`) VALUES
(54516, 15, 0, -1, 'Loot-Filled Pumpkin', 67153, 3, 4, 8192, 1, 0, 0, 0, -1, -1, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 324, '', 0, 0, 0, 0, 0, 15595), 
(54537, 15, 0, -1, 'Heart-Shaped Box', 40293, 3, 4, 8192, 1, 0, 0, 0, -1, -1, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 423, '', 0, 0, 0, 0, 0, 15595);
UPDATE `disables` SET `comment`='Ignore LOS for Krakles Thermometer' WHERE `sourceType`=0 AND `entry`=16378;
DELETE FROM `areatrigger_involvedrelation` WHERE `id` IN (5710,5711,5712,5714,5715,5716);

DELETE FROM `smart_scripts` WHERE `entryorguid`=5710 AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(5710,2,0,1,46,0,100,0,5710,0,0,0,86,71713,0,10,208836,38340,0,7,0,0,0,0,0,0,0,"On Trigger - Crosscast - Invoker"),
(5710,2,1,0,61,0,100,0,0,0,0,0,51,0,0,0,0,0,0,10,208836,38340,0,0,0,0,0,"Link - Kill - Bunny");

UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id` IN (24849,24851);
DELETE FROM `areatrigger_teleport` WHERE `id` IN (2406, 2407, 2408, 2409, 2410, 2411);
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(2406, 0, -276.241, 1652.68, 77.5589, 3.14159, 'Shadowfang - South Fall Target'),
(2407, 0, -276.241, 1652.68, 77.5589, 3.14159, 'Shadowfang - South Fall Target'),
(2408, 0, -225.34, 1556.53, 93.0454, 4.71239, 'Shadowfang Front Fall Exit Target'),
(2409, 0, -225.34, 1556.53, 93.0454, 4.71239, 'Shadowfang Front Fall Exit Target'),
(2410, 0, -181.26, 1580.65, 97.4466, 6.28319, 'Shadowfang - North Fall Target'),
(2411, 0, -181.26, 1580.65, 97.4466, 6.28319, 'Shadowfang - North Fall Target');
SET @GUID = 4522;
SET @SINK = 300177;

-- spawn TEMP South Sinkhole
DELETE FROM `gameobject` WHERE `guid`=@GUID AND `id`=@SINK;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GUID, @SINK, 571, 1, 1, 3488.48, 4515.98, -20.7394, 5.34436, 0, 0, 0.452361, -0.891835, 300, 0, 1);

-- increase TEMP South Sinkhole spellfocus radius
UPDATE `gameobject_template` SET `data1`=20 WHERE `entry`=@SINK;
UPDATE `creature_template` SET `equipment_id`=36561 WHERE `entry` IN (36561,36571);

DELETE FROM `creature_equip_template` WHERE `entry`=36561;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(36561, 38488, 0, 0); -- Onyxian Lair Guard
DELETE FROM `areatrigger_teleport` WHERE `id` IN (4233, 4267);
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(4233, 530, 9331.49, -7812.27, 136.569, 5.23599, 'Eversong Woods - Duskwither UP Target'),
(4267, 530, 9334.03, -7880.02, 74.9095, 2.35619, 'Eversong Woods - Duskwither DOWN Target');
DELETE FROM `player_factionchange_spells` WHERE `alliance_id`=3565 AND `horde_id`=3566;
INSERT INTO `player_factionchange_spells` (`alliance_id`, `horde_id`) VALUES
(3565, 3566); -- Teleport: Darnassus / Teleport: Thunder Bluff
DELETE FROM `areatrigger_teleport` WHERE `id`=4304;
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(4304, 530, -233.33, 3199.71, -50, 0.785398, 'Hellfire Ramparts - Omor Exit Target');
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (
  17413, -- Sedai Quest Credit Marker
  21121, -- Bonechewer Quest credit marker
  24887, -- Fengir Quest Credit
  24888, -- Isuldof Quest Credit
  24889, -- Rodin Quest Credit
  24890, -- Windan Quest Credit
  27471, -- Forgotten Rifleman Quest Credit
  27472, -- Forgotten Peasant Quest Credit
  27473, -- Forgotten Knight Quest Credit
  27474, -- Captain Luc D'Merud Quest Credit
  27879, -- Frostmourne Cavern Quest Credit
  38503, -- Blood Infusion Quest Credit Bunny
  38546, -- Frost Infusion Quest Credit
  38547, -- Sindragosa Quest Credit
  39355, -- [DND] Salute Quest Credit Bunny
  39356, -- [DND] Roar Quest Credit Bunny	
  39361, -- [DND] Dance Quest Credit Bunny
  39362, -- [DND] Cheer Quest Credit Bunny
  39683, -- [DND] Quest Credit Bunny - Eject
  39691, -- [DND] Quest Credit Bunny - Move 1
  39692, -- [DND] Quest Credit Bunny - Move 2
  39695, -- [DND] Quest Credit Bunny - Move 3
  39703, -- [DND] Quest Credit Bunny - Attack
  40428  -- [DND] Quest Credit Bunny - ET Battle
);
