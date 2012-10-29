DELETE FROM `conditions` WHERE `SourceEntry` = 63001;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES ('13', '1', '63001', '0', '0', '31', '0', '3', '33438', '0', '0', '0', '', 'Trample Scourge can only target Boneguard Footmen');
DELETE FROM `smart_scripts` WHERE `entryorguid` = 33550;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES ('33550', '0', '0', '0', '0', '0', '100', '0', '0', '0', '2500', '2500', '11', '63233', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', 'Boneguard Scout - Cast Necroution');
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 33550; 
UPDATE `creature_template` SET `ScriptName` = "npc_boneguard_mounted" WHERE `entry` IN (34127, 33429);
DELETE FROM `spell_script_names` WHERE `spell_id` = 63000;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (`spell_id` = 63000, `ScriptName` = "spell_gen_trample_scourge");
