/*
Dialogue Cultist Mage in Irphong light house
*/

BEGIN ~AC#DT12M~

IF ~Global("AC#DT_TalkedToTowerTopGuy","GLOBAL",1)~ THEN BEGIN hello_again
SAY @0
IF ~~ THEN REPLY @1 + who_are_you
IF ~~ THEN REPLY @2 + it_was_you
IF ~~ THEN REPLY @3 + cause_darkness
END

	IF ~~ THEN BEGIN it_was_you
	SAY @4
	IF ~~ THEN REPLY @1 + who_are_you
	IF ~~ THEN REPLY @3 + cause_darkness 
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @5 
IF ~~ THEN REPLY @6 + who_are_you
IF ~~ THEN REPLY @3 + cause_darkness
END

IF ~~ THEN BEGIN cause_darkness
SAY @7
IF ~~ THEN REPLY @8 + never_heard
IF ~~ THEN REPLY @9 + fight
IF ~~ THEN REPLY @10 + strange_helmet
END

	IF ~~ THEN BEGIN never_heard
	SAY @11
	IF ~~ THEN REPLY @12 GOTO not_my_taste
	IF ~~ THEN REPLY @13 + sense_evil
	IF ~~ THEN REPLY @14 + who_are_you
	IF ~~ THEN REPLY @10 + strange_helmet
	END
	
		IF ~~ THEN BEGIN strange_helmet
		SAY @15
		IF ~~ THEN REPLY @12 GOTO not_my_taste
		IF ~~ THEN REPLY @13 + sense_evil
		IF ~~ THEN REPLY @14 + who_are_you
		END
	
	IF ~~ THEN BEGIN who_are_you
	SAY @16
	IF ~~ THEN REPLY @17 + Nightwatchman	
	IF ~~ THEN REPLY @13 + sense_evil
	END

	IF ~~ THEN BEGIN Nightwatchman
	SAY @18
	IF ~~ THEN REPLY @12 GOTO not_my_taste
	IF ~~ THEN REPLY @13 + sense_evil
	END		
	
		IF ~~ THEN BEGIN sense_evil
		SAY @19
		IF ~~ THEN REPLY @20 GOTO moron
		IF ~~ THEN REPLY @21 GOTO moron
		END
		
			IF ~~ THEN BEGIN moron
			SAY @22
			IF ~~ THEN GOTO fight
			END

	IF ~~ THEN BEGIN not_my_taste
	SAY @23
	IF ~~ THEN GOTO fight
	END

IF ~~ THEN BEGIN fight
SAY @24
IF ~~ THEN DO ~Enemy()~ EXIT
END

