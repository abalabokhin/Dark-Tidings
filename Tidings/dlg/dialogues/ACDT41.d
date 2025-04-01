/*
Dialogue cultists in area ACDT41)
*/

/*
Dialogue Tharizdun's avatar #2 (first form)
*/

BEGIN ~AC#DTTH2~

BEGIN ~AC#DTVER~

IF ~~ THEN BEGIN put_down_weapons
SAY @0
IF ~~ THEN GOTO fight_01 
END

IF ~~ THEN BEGIN cant_deceive_me
SAY @1
IF ~~ THEN GOTO fight_01 
END

IF ~~ THEN BEGIN fight_01
SAY @2
IF ~~ THEN DO ~SetGlobal("AllHostile","ACDT41",1)
ActionOverride("AC#DTTH2",DestroySelf())
Enemy()~ EXIT
END

	IF ~~ THEN BEGIN hello_tharizdun
	SAY @3
	IF ~~ THEN EXTERN AC#DTTH1 hello_losers
	END

BEGIN ~AC#DT1PC~
	IF ~~ THEN BEGIN hello_tharizdun
	SAY @3
	IF ~~ THEN EXTERN AC#DTTH1 hello_losers
	END

BEGIN ~AC#DT2PC~
	IF ~~ THEN BEGIN hello_tharizdun
	SAY @3
	IF ~~ THEN EXTERN AC#DTTH1 hello_losers
	END
	
BEGIN ~AC#DT3PC~
	IF ~~ THEN BEGIN hello_tharizdun
	SAY @3
	IF ~~ THEN EXTERN AC#DTTH1 hello_losers
	END
	
BEGIN ~AC#DT4PC~
	IF ~~ THEN BEGIN hello_tharizdun
	SAY @3
	IF ~~ THEN EXTERN AC#DTTH1 hello_losers
	END
	
BEGIN ~AC#DT5PC~
	IF ~~ THEN BEGIN hello_tharizdun
	SAY @3
	IF ~~ THEN EXTERN AC#DTTH1 hello_losers
	END



// CHAIN____________
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#DTVER chain_hello_00
@4
== AC#DTTH2 @5
== AC#DTVER @6
== AC#DT3PC @7
== AC#DTVER @8
== AC#DTTH2 @9
== AC#DT5PC @10
== AC#DTVER @11
== AC#DTTH2 @12
== AC#DT1PC @13
== AC#DTVER @14
END
++ @15 GOTO put_down_weapons
++ @16 GOTO put_down_weapons
++ @17 GOTO fight_01
IF ~OR(2)
HasItemEquiped("AC#DTCH2",LastTalkedToBy())
HasItemEquiped("AC#DTCHM",LastTalkedToBy())~ THEN REPLY @18 + cant_deceive_me

/*
Dialogue Tharizdun's avatar
*/

BEGIN ~AC#DTTH1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY @19
IF ~~ THEN GOTO fight
IF ~InMyArea("AC#DT1PC")
!Dead("AC#DT1PC")~ THEN EXTERN AC#DT1PC hello_tharizdun
IF ~InMyArea("AC#DT2PC")
!Dead("AC#DT2PC")~ THEN EXTERN AC#DT2PC hello_tharizdun
IF ~InMyArea("AC#DT3PC")
!Dead("AC#DT3PC")~ THEN EXTERN AC#DT3PC hello_tharizdun
IF ~InMyArea("AC#DT4PC")
!Dead("AC#DT4PC")~ THEN EXTERN AC#DT4PC hello_tharizdun
IF ~InMyArea("AC#DT5PC")
!Dead("AC#DT5PC")~ THEN EXTERN AC#DT5PC hello_tharizdun
IF ~InMyArea("AC#DTVER")
!Dead("AC#DTVER")~ THEN EXTERN AC#DTVER hello_tharizdun
END

	IF ~~ THEN BEGIN hello_losers
	SAY @20
	IF ~~ THEN GOTO fight
	END

IF ~~ THEN BEGIN fight
SAY @21
IF ~~ THEN DO ~Enemy()~ EXIT
END
