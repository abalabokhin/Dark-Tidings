/*
Dialogue Sea witch on Irphong isle
*/

BEGIN ~AC#DTSW2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @0
IF ~~ THEN GOTO what_priest
END

		IF ~~ THEN BEGIN what_priest
		SAY @1
		IF ~~ THEN REPLY @2 GOTO fight
		IF ~~ THEN REPLY @3 GOTO fight
		IF ~~ THEN REPLY @4 + about_cultists
		END	

			IF ~~ THEN BEGIN about_cultists
			SAY @5
			IF ~~ THEN REPLY @6 GOTO only_mad_hag
			IF ~~ THEN REPLY @7 GOTO only_mad_hag
			IF ~~ THEN REPLY @8 + dont_hear_anything
			IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_elder_eye
			END

			IF ~~ THEN BEGIN about_cultists_npc
			SAY @9
			IF ~~ THEN REPLY @6 GOTO only_mad_hag
			IF ~~ THEN REPLY @7 GOTO only_mad_hag
			IF ~~ THEN REPLY @8 + dont_hear_anything
			END				

				IF ~~ THEN BEGIN only_mad_hag
				SAY @10
				IF ~~ THEN DO ~Enemy()~ EXIT
				END	

				IF ~~ THEN BEGIN dont_hear_anything
				SAY @11
				IF ~~ THEN DO ~Enemy()~ EXIT
				END					

IF ~~ THEN BEGIN fight
SAY @12
IF ~~ THEN DO ~Enemy()~ EXIT
END

/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~VICONIJ~
IF ~~ THEN BEGIN Viconia_elder_eye
SAY @13
IF ~~ THEN EXTERN ~AC#DTSW2~ about_cultists_npc
END
END
