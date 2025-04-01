
// Undead lighthouse keeper in area ACDT18
BEGIN ~AC#DT18G~

IF ~GlobalGT("AC#DT_Ritual_done","GLOBAL",0)~ THEN BEGIN hello_ritual_finished
SAY @0
IF ~~ THEN GOTO about_tharizdun
END

IF ~~ THEN BEGIN about_tharizdun 
SAY @1
IF ~~ THEN GOTO ritual_finished_02
IF ~PartyHasItem("AC#DTRIT")~ THEN GOTO take_ritual_book
END

	IF ~~ THEN BEGIN take_ritual_book
	SAY @2
	IF ~~ THEN DO ~TakePartyItem("AC#DTRIT")
	DestroyItem("AC#DTRIT")~ GOTO ritual_finished_02
	END

	IF ~~ THEN BEGIN ritual_finished_02
	SAY @3
	IF ~~ THEN DO ~GiveItemCreate("AC#DTRI1",Myself(),1,0,0)
	Kill(Myself)~ EXIT 
	END

IF ~Global("AC#DT_met_keeper","GLOBAL",4)~ THEN BEGIN hello_met_shadowplane
SAY @4
IF ~~ THEN EXIT 
END

IF ~True()~ THEN BEGIN hello_01
SAY @5
=
@6
=
@7
=
@8
IF ~~ THEN REPLY @9 + reprise 
IF ~~ THEN REPLY @10 + reprise 
IF ~~ THEN REPLY @11 + kill 
IF ~~ THEN REPLY @12 + find_me 
END

	IF ~~ THEN BEGIN kill
	SAY @13
	IF ~~ THEN GOTO reprise
	END
	
	IF ~~ THEN BEGIN reprise
	SAY @5
	=
	@6
	IF ~~ THEN GOTO find_me
	END
	
	IF ~~ THEN BEGIN find_me
	SAY  @7
	IF ~Global("AC#DT_met_keeper","GLOBAL",0)~ THEN GOTO bye_01
	IF ~GlobalGT("AC#DT_met_keeper","GLOBAL",0)~ THEN GOTO bye_02
	END
	
	IF ~~ THEN BEGIN bye_01
SAY @8
IF ~~ THEN DO ~SetGlobal("AC#DT_met_keeper","GLOBAL",1)
AddJournalEntry(@18000,QUEST)~ EXIT
END

IF ~~ THEN BEGIN bye_02
SAY @8
IF ~~ THEN EXIT
END


