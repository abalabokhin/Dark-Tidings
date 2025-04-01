
/*******************************************************************************************************
Jhanex, rescue team leader
*******************************************************************************************************/
//in front of the seatower at the boat
BEGIN ~AC#DTJHA~

IF ~True()~ THEN BEGIN back
SAY @0
++ @1 + 1
IF ~~ THEN REPLY @2 + who_are_you_instead
END

	IF ~~ THEN BEGIN who_are_you_instead
	SAY @3
	++ @1 + that_was_you
	END
	
	IF ~~ THEN BEGIN that_was_you
	SAY @4
	IF ~~ THEN REPLY @5 GOTO 3
	END
	
	IF ~~ THEN BEGIN 1
	SAY @6
	IF ~~ THEN REPLY @7 GOTO 2 
	END
	
		IF ~~ THEN BEGIN 2
		SAY @8
		IF ~~ THEN REPLY @5 GOTO 3
		END
		
			IF ~~ THEN BEGIN 3
			SAY @9
			IF ~~ THEN REPLY @10 GOTO 4 
			END
			
				IF ~~ THEN BEGIN 4
				SAY @11
				IF ~~ THEN GOTO 5
				END
				
				IF ~~ THEN BEGIN 5
				SAY @12
				IF ~~ THEN REPLY @13 GOTO bye
				END
				
					IF ~~ THEN BEGIN bye
					SAY @14
					IF ~~ THEN DO ~EraseJournalEntry(@10001)
					AddJournalEntry(@10002,QUEST)
					SetGlobal("Rescued","ACDT01",1)
					EscapeArea()~ EXIT 
					END

//___________________________________________________________________________________________________
// at the boat
BEGIN ~AC#DTJH2~

IF ~True()~ THEN BEGIN back
SAY @15
++ @16 + 5
++ @17 + 6
END

IF ~~ THEN BEGIN 5
SAY @18
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6
SAY @19
IF ~~ THEN DO ~SetGlobal("AC#DT_Plot","GLOBAL",10)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#DTCT3")~ EXIT
END

//___________________________________________________________________________________________________
// back in Athkatla
BEGIN ~AC#DTJH3~

IF ~True()~ THEN BEGIN 0
SAY @20
IF ~~ THEN DO ~EraseJournalEntry(@10002)
AddJournalEntry(@10003,QUEST)
EscapeArea()~ EXIT 
END

/*
Thalass, quest finish
*/

BEGIN ~AC#DTVY2~

IF ~True()~ THEN BEGIN Hello_0
SAY @21
IF ~~ THEN REPLY @22 + made_light_shine_again
END

	IF ~~ THEN BEGIN made_light_shine_again
	SAY @23
	IF ~~ THEN REPLY @24 GOTO cyric_shadowplane_story 
	IF ~~ THEN REPLY @25 GOTO sea_hag_story
	END
	
		IF ~~ THEN BEGIN sea_hag_story
		SAY @26
		IF ~~ THEN GOTO normal_reward
		END

		IF ~~ THEN BEGIN cyric_shadowplane_story
		SAY @27
		IF ~~ THEN REPLY @28 GOTO not_believing
		IF ~PartyHasItem("AC#DTBK3")~ THEN REPLY @29 DO ~TakePartyItem("AC#DTBK3")~ GOTO cyric_letter
		END
		
			IF ~~ THEN BEGIN not_believing
			SAY @30
			IF ~~ THEN REPLY @31 GOTO not_believing_02
			IF ~PartyHasItem("AC#DTBK3")~ THEN REPLY @32 DO ~TakePartyItem("AC#DTBK3")~ GOTO cyric_letter
			END
			
				IF ~~ THEN BEGIN cyric_letter
				SAY @33
				IF ~~ THEN REPLY @34 GOTO yes_no_proof
				IF ~PartyHasItem("AC#DTVER")~ THEN REPLY @35 DO ~TakePartyItem("AC#DTVER")~ GOTO yes_with_proof
				END
				
					IF ~~ THEN BEGIN yes_no_proof
					SAY @36
					IF ~~ THEN DO ~DestroyItem("AC#DTBK3")~ GOTO medium_reward
					END
					
					IF ~~ THEN BEGIN yes_with_proof
					SAY @37					
					IF ~~ THEN DO ~DestroyItem("AC#DTBK3")
					DestroyItem("AC#DTVER")~ GOTO best_reward
					END
					
					IF ~~ THEN BEGIN not_believing_02
					SAY @38
					IF ~~ THEN GOTO normal_reward
					END

						IF ~~ THEN BEGIN best_reward
						SAY @39
						IF ~~ THEN DO ~GiveGoldForce(3000)~ GOTO bye
						END
						
						IF ~~ THEN BEGIN medium_reward
						SAY @40
						IF ~~ THEN DO ~GiveGoldForce(2000)~ GOTO bye
						END
						
						IF ~~ THEN BEGIN normal_reward
						SAY @41
						IF ~~ THEN DO ~GiveGoldForce(1000)~ GOTO bye 
						END
						
							IF ~~ THEN BEGIN bye
							SAY @42
							IF ~~ THEN DO ~AddexperienceParty(15000)
							EraseJournalEntry(@10003)
							EraseJournalEntry(@18016)
							EraseJournalEntry(@12004)
							EraseJournalEntry(@13010)
							AddJournalEntry(@10004,QUEST_DONE)
							SetGlobal("AC#DT_Plot","GLOBAL",20)
							EscapeArea()~ EXIT 
							END

// the two sailors waiting at the boat
BEGIN ~AC#DTFS2~

IF ~True()~ THEN BEGIN hello_0
SAY @43
IF ~~ THEN EXIT 
END
