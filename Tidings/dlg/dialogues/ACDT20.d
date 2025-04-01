/*
Dialogue Sirine leader - Crab Queen's Cove
*/

BEGIN ~AC#DT20S~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY @0
IF ~~ THEN REPLY @1 GOTO fight
IF ~~ THEN REPLY @2 + 02
END

	IF ~~ THEN BEGIN 02
	SAY @3
	IF ~~ THEN REPLY @4 GOTO fight
	IF ~~ THEN REPLY @5 GOTO fight
	IF ~~ THEN REPLY @6 GOTO fight	
	END
	
		IF ~~ THEN BEGIN nasty
		SAY @8
		IF ~~ THEN REPLY @4 GOTO fight
		IF ~~ THEN REPLY @5 GOTO fight
		END
	
		IF ~~ THEN BEGIN fight
		SAY @9
		IF ~~ THEN DO ~SetGlobal("AllHostile","ACDT20",1)
		Enemy()~ EXIT
		END
		
