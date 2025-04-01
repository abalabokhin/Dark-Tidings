BEGIN ~AC#DTVY1~

IF ~Global("AC#DT_Waitfordeparture","AR0300",1)~ THEN BEGIN hello_departure
SAY @0
IF ~~ THEN REPLY @1 EXTERN ~AC#DTSA3~ 2
IF ~~ THEN REPLY @2 + not_ready_yet
END

IF ~Global("AC#DT_Accept","GLOBAL",2)~ THEN BEGIN Hello_2
SAY @3
IF ~~ THEN EXTERN ~AC#DTSA3~ Hi
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @4
++ @5 + 2
++ @6 + 2
++ @7 + 3
END

IF ~~ THEN BEGIN goodbye
SAY @8
IF ~~ THEN REPLY @9 EXTERN ~AC#DTSA3~ 2
IF ~~ THEN REPLY @2 + not_ready_yet
END

	IF ~~ THEN BEGIN not_ready_yet
	SAY @10
	IF ~~ THEN DO ~SetGlobal("AC#DT_Waitfordeparture","AR0300",1)~ EXIT 
	END

IF ~~ THEN BEGIN 2
SAY @11
IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ Yoshimo_Thalass
IF ~!IsValidForPartyDialog("Yoshimo")~ THEN REPLY @12 + cowled_wizards
++ @13 + 4
END

IF ~~ THEN BEGIN cowled_wizards
SAY @14
IF ~~ THEN REPLY @15 GOTO 4
IF ~Global("C#IM_ImoenStays","GLOBAL",0)
GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #45482 /* ~Ich habe eine Frage an Euch. Eine Freundin von mir wurde von den Verhüllten Magiern eingekerkert … wisst Ihr, wo sie ihre Gefangenen hinbringen?~ */ GOTO imoen_cowled_wizards
IF ~~ THEN REPLY @16 + 3_B
END

	IF ~~ THEN BEGIN imoen_cowled_wizards
	SAY @17
	IF ~~ THEN GOTO 4
	END	

IF ~~ THEN BEGIN 3
SAY @18
++ @19 + 2
++ @20 + no
END

	IF ~~ THEN BEGIN 3_B
	SAY @18
	++ @19 + 4
	++ @20 + no
	END

IF ~~ THEN BEGIN 4
SAY @21
IF ~~ THEN REPLY @22 GOTO not_heard_lighthouse
IF ~~ THEN REPLY @23 GOTO yes_heard_lighthouse
END 

	IF ~~ THEN BEGIN not_heard_lighthouse
	SAY @24
	IF ~~ THEN GOTO yes_heard_lighthouse
	END
	
	IF ~~ THEN BEGIN yes_heard_lighthouse
	SAY @25
	IF ~~ THEN GOTO light_out 
	END

IF ~~ THEN BEGIN light_out
SAY @26
=
@27
IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Comment_1
IF ~!IsValidForPartyDialog("Korgan")
   IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Comment_1
IF ~!IsValidForPartyDialog("Korgan")
   !IsValidForPartyDialog("Edwin")~ THEN REPLY @28 + guard
IF ~~ THEN REPLY @29 + 6   
IF ~~ THEN REPLY @30 + 6 
IF ~~ THEN REPLY @31 + 6  
END

IF ~~ THEN BEGIN guard
SAY @32
++ @33 + 5
IF ~~ THEN REPLY @34 + what_happened_boat
IF ~~ THEN REPLY @35 + 6
END

	IF ~~ THEN BEGIN what_happened_boat
	SAY @36
	IF ~~ THEN GOTO 5
	END

IF ~~ THEN BEGIN 5
SAY @37
	IF ~~ THEN REPLY @38 + 6
	IF ~~ THEN REPLY @39 + 6
	IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Comment_1
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_1
END

IF ~~ THEN BEGIN 6
SAY @40 
=
@41
++ @42 + accept
++ @43 + accept
++ @44 + 7
++ @20 + no
END

IF ~~ THEN BEGIN 7
SAY @45
++ @42 + accept
++ @43 + accept
++ @20 + no
END

IF ~~ THEN BEGIN no
SAY @46
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN accept
SAY @47
IF ~~ THEN DO ~RevealAreaOnMap("ACDT01")~ GOTO bye_meet_at_docks
END

IF ~~ THEN BEGIN bye_meet_at_docks
SAY @48
IF ~~ THEN DO ~SetGlobal("AC#DT_Accept","GLOBAL",1)
EscapeArea()~ UNSOLVED_JOURNAL @10000 
EXIT
END

/*******************************************************************************************************
Kapitän
*******************************************************************************************************/

BEGIN ~AC#DTSA3~
IF ~Global("AC#DT_Ambush","GLOBAL",1)~ THEN BEGIN HelloAgain
SAY @49
IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Comment_2
IF ~!IsValidForPartyDialog("Korgan")
   IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Comment_2
IF ~!IsValidForPartyDialog("Korgan")
   !IsValidForPartyDialog("Edwin")
IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Comment_2
IF ~!IsValidForPartyDialog("Korgan")
   !IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Keldorn")~ THEN GOTO 3
END

IF ~True()~ THEN BEGIN 1
SAY @50
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Hi
SAY @51
IF ~~ THEN EXTERN ~AC#DTVY1~ goodbye
END

IF ~~ THEN BEGIN 2
SAY @52
IF ~~ THEN GOTO ready_to_leave_night
IF ~OR(2)
TimeOfDay(DAY)
TimeOfDay(MORNING)~ THEN GOTO ready_to_leave
END

	IF ~~ THEN BEGIN ready_to_leave_night
	SAY @53
	IF ~~ THEN GOTO ready_to_leave
	END

/*
IF ~~ THEN BEGIN ready_to_leave
SAY @54
IF ~~ THEN DO ~SetGlobal("AC#DT_Accept","GLOBAL",3)
ActionOverride("AC#DTVY1",EscapeArea())
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#DTCT1")~ EXIT
END
*/

IF ~~ THEN BEGIN ready_to_leave
SAY @54
IF ~~ THEN DO ~SaveGame(0)
ClearAllActions()
//SetGlobal("AC#DT_Accept","GLOBAL",3)
StartCutSceneMode()
StartCutScene("AC#DTCT1")~ EXIT
END

IF ~~ THEN BEGIN 3
SAY @55
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#DTCT2")~ EXIT
END

/*******************************************************************************************************
Matrosen
*******************************************************************************************************/

BEGIN ~AC#DTSA1~
IF ~True()~ THEN BEGIN 1
SAY @56
IF ~~ THEN EXIT
END

BEGIN ~AC#DTSA2~
IF ~True()~ THEN BEGIN 1
SAY @56
IF ~~ THEN EXIT
END

/*******************************************************************************************************
The two drunken sailors
*******************************************************************************************************/
BEGIN ~AC#DTDR1~

IF ~Global("AC#DT_yarn","GLOBAL",10)~ THEN BEGIN hello_hero
SAY @57
IF ~~ THEN EXIT 
END

IF ~Global("AC#DT_yarn","GLOBAL",5)~ THEN BEGIN hello_liar
SAY @58
IF ~~ THEN EXIT 
END

IF ~Global("AC#DT_yarn","GLOBAL",2)~ THEN BEGIN hello_again
SAY @59
IF ~~ THEN REPLY @60 GOTO bye_02
IF ~GlobalGT("ACDT_Towerlight","GLOBAL",0)~ THEN REPLY @61 EXTERN ~AC#DTDR2~ lighthouse_quest_over 
END

	IF ~~ THEN BEGIN bye_02
	SAY @62
	IF ~~ THEN EXIT 
	END
	
		IF ~~ THEN BEGIN found_trolls_only
		SAY @63
		IF ~~ THEN EXTERN ~AC#DTDR2~ sailors_finish
		END
		
			IF ~~ THEN BEGIN cheers_reward
			SAY @64
			IF ~~ THEN DO ~GiveGoldForce(5)
			SetGlobal("AC#DT_yarn","GLOBAL",10)~ EXIT 
			END
			
		IF ~~ THEN BEGIN found_shadow_plane
		SAY @65
		IF ~~ THEN EXTERN ~AC#DTDR2~ not_believing_finish
		END
		
		IF ~~ THEN BEGIN found_chained_one
		SAY @66
		IF ~~ THEN EXTERN ~AC#DTDR2~ not_believing_finish
		END
		
		IF ~~ THEN BEGIN cheers_no_reward
		SAY @67
		IF ~~ THEN DO ~SetGlobal("AC#DT_yarn","GLOBAL",5)~ EXIT 
		END

IF ~True()~ THEN BEGIN hello_01
SAY @68
IF ~~ THEN EXIT 
END

BEGIN ~AC#DTDR2~

IF ~Global("AC#DT_yarn","GLOBAL",10)~ THEN BEGIN hello_hero
SAY @57
IF ~~ THEN EXIT 
END

IF ~Global("AC#DT_yarn","GLOBAL",5)~ THEN BEGIN hello_liar
SAY @58
IF ~~ THEN EXIT 
END

IF ~True()~ THEN BEGIN hello_01
SAY @69
IF ~~ THEN EXIT 
END

	IF ~~ THEN BEGIN lighthouse_quest_over
	SAY @70
	IF ~~ THEN REPLY @71 EXTERN ~AC#DTDR1~ found_trolls_only  
	IF ~~ THEN REPLY @72 EXTERN ~AC#DTDR1~ found_shadow_plane  
	IF ~~ THEN REPLY @73 EXTERN ~AC#DTDR1~ found_chained_one  
	END
	
	IF ~~ THEN BEGIN sailors_finish
	SAY @74
	IF ~~ THEN EXTERN ~AC#DTDR1~ cheers_reward 
	END
	
	IF ~~ THEN BEGIN not_believing_finish
	SAY @75
	IF ~~ THEN EXTERN ~AC#DTDR1~ cheers_no_reward
	END

// CHAIN____________
CHAIN IF WEIGHT #-999 ~Global("AC#DT_yarn","GLOBAL",1)~ THEN AC#DTDR1 chain_yarn_01
@76
== AC#DTDR2 @77
== AC#DTDR1 @78
END
++ @79 GOTO chain_yarn_02
++ @80 GOTO chain_yarn_bye

CHAIN IF ~~ THEN AC#DTDR1 chain_yarn_02
@81
== AC#DTDR2 @82
== AC#DTDR1 @83
END
++ @84 GOTO chain_yarn_03
++ @85 GOTO chain_yarn_bye

CHAIN IF ~~ THEN AC#DTDR1 chain_yarn_03
@86
== AC#DTDR2 @87
== AC#DTDR1 @88
END
++ @89 GOTO chain_yarn_04
++ @85 GOTO chain_yarn_bye

CHAIN IF ~~ THEN AC#DTDR1 chain_yarn_04
@90
== AC#DTDR2 @91
== AC#DTDR1 @92
== AC#DTDR2 @93
== AC#DTDR1 @94
END
++ @95 GOTO chain_yarn_05
++ @85 GOTO chain_yarn_bye

CHAIN IF ~~ THEN AC#DTDR1 chain_yarn_05
@96
== AC#DTDR2 @97
== AC#DTDR1 @98
== AC#DTDR2 @99
== AC#DTDR1 @100
END
IF ~~ THEN GOTO chain_yarn_bye

CHAIN IF ~~ THEN AC#DTDR1 chain_yarn_bye
@101
== AC#DTDR2 @102
== AC#DTDR1 @103
END
IF ~~ THEN DO ~SetGlobal("AC#DT_yarn","GLOBAL",2)~ EXIT
/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~KELDORJ~
IF ~~ THEN BEGIN Keldorn_Comment_2
SAY @104
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#DTCT2")~ EXIT
END
END

APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_Comment_1
   SAY @105
IF ~~ THEN EXTERN ~AC#DTVY1~ guard
END

IF ~~ THEN BEGIN Korgan_Comment_2
   SAY @106
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#DTCT2")~ EXIT
END
END

APPEND ~YOSHJ~
IF ~~ THEN BEGIN Yoshimo_Thalass
SAY @107
IF ~OR(2)
GlobalGT("chapter","GLOBAL",3)
GlobalGT("C#IM_ImoenStays","GLOBAL",0)~ THEN EXTERN ~AC#DTVY1~ 4
IF ~Global("C#IM_ImoenStays","GLOBAL",0)
GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #45482 /* ~Ich habe eine Frage an Euch. Eine Freundin von mir wurde von den Verhüllten Magiern eingekerkert … wisst Ihr, wo sie ihre Gefangenen hinbringen?~ */ EXTERN ~AC#DTVY1~ imoen_cowled_wizards
IF ~~ THEN REPLY @16 EXTERN ~AC#DTVY1~ 3_B
IF ~~ THEN REPLY @15 EXTERN ~AC#DTVY1~ 4
END
END

APPEND ~EDWINJ~
IF ~~ THEN BEGIN Edwin_Comment_1
SAY @108
IF ~~ THEN EXTERN ~AC#DTVY1~ guard
END

IF ~~ THEN BEGIN Edwin_Comment_2
SAY @109
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#DTCT2")~ EXIT
END
END

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_Comment_1
   SAY @110
   IF ~~ THEN EXTERN ~AC#DTVY1~ 6
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN Viconia_Comment_1
   SAY @111
   IF ~~ THEN EXTERN ~AC#DTVY1~ 6
END
END
