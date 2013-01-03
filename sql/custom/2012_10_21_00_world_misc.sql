DELETE FROM `gossip_menu` WHERE `entry`=8932 AND `text_id`=11943;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (8932,11943);
UPDATE `creature_template` SET `gossip_menu_id` = 8932, `ScriptName` = "npc_harrison_jones_za" WHERE `entry` = 24358;
UPDATE `gameobject_template` SET `ScriptName` = "go_strange_gong" WHERE `entry` = 187359;

DELETE FROM script_waypoint WHERE entry=24358;
INSERT INTO script_waypoint VALUES
(24358, 0, 121.193970, 1645.619385, 42.021, 0, ''),
(24358, 1, 132.051468, 1642.176025, 42.021, 10000, 'SAY_AT_GONG'),
(24358, 2, 120.670631, 1636.346802, 42.415, 0, ''),
(24358, 3, 120.536003, 1611.654663, 43.473, 10000, 'SAY_OPEN_ENTRANCE'),
(24358, 4, 120.536003, 1611.654663, 43.473, 0, '');
