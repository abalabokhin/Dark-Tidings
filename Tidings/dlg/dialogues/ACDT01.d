/*
Dialogue mage on Irphong isle
*/

BEGIN ~AC#DT01M~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @0
IF ~~ THEN REPLY @1 GOTO get_down
IF ~~ THEN REPLY @2 + responsable
IF ~~ THEN REPLY @3 + what_dark_lord
END

	IF ~~ THEN BEGIN what_dark_lord
	SAY @4
	IF ~~ THEN GOTO no_escape
	IF ~Dead("AC#DTSW2")~ THEN GOTO killed_hag
	END
	
	IF ~~ THEN BEGIN responsable
	SAY @5
	IF ~~ THEN GOTO no_escape
	IF ~Dead("AC#DTSW2")~ THEN GOTO killed_hag
	END

	IF ~~ THEN BEGIN get_down
	SAY @6
	IF ~~ THEN GOTO no_escape 
	IF ~Dead("AC#DTSW2")~ THEN GOTO killed_hag 
	END
	
		IF ~~ THEN BEGIN killed_hag
		SAY @7
		IF ~~ THEN GOTO no_escape 
		END

IF ~~ THEN BEGIN no_escape
SAY @8
IF ~~ THEN DO ~SetGlobal("AC#DT_TalkedToTowerTopGuy","GLOBAL",1)
UseItem("POTN13",LastTalkedToBy())
EscapeArea()~ EXIT
END
