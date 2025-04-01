// Undead lighthouse keeper in area ACDT30
BEGIN ~AC#DT30G~

IF ~Global("AC#DT_met_keeper","GLOBAL",4)~ THEN BEGIN hello_ritual_done
SAY @0
IF ~~ THEN EXIT
END

IF ~Global("Has_Crystal_Ritual","ACDT30",1)~ THEN BEGIN hello_have_crystal
SAY @1
IF ~Global("AC#DT_met_keeper","GLOBAL",0)~ THEN DO ~SetGlobal("Has_Crystal_Ritual","ACDT30",2)~ GOTO introduce_myself
IF ~Global("AC#DT_met_keeper","GLOBAL",1)~ THEN DO ~SetGlobal("Has_Crystal_Ritual","ACDT30",2)~ GOTO met_before
IF ~Global("AC#DT_met_keeper","GLOBAL",2)~ THEN DO ~SetGlobal("Has_Crystal_Ritual","ACDT30",2)~ GOTO ritual_01
END

	IF ~~ THEN BEGIN introduce_myself
	SAY @2
	IF ~~ THEN REPLY @3 GOTO who_are_you_02
	END
	
	IF ~~ THEN BEGIN met_before
	SAY @4
	IF ~~ THEN GOTO who_are_you_02
	END	

	IF ~~ THEN BEGIN who_are_you_02
	SAY @5
	IF ~~ THEN GOTO help_me_02
	END
	
		IF ~~ THEN BEGIN help_me_02
		SAY @6
		IF ~~ THEN GOTO ritual_01
		END
		

	IF ~~ THEN BEGIN ritual_01
	SAY @7
	IF ~~ THEN REPLY @8 GOTO ritual_02
	IF ~~ THEN REPLY @9 GOTO ritual_02
	IF ~~ THEN REPLY @10 + why_other_side
	END
	
			IF ~~ THEN BEGIN why_other_side
			SAY @11
			IF ~~ THEN GOTO ritual_02
			END
		
		IF ~~ THEN BEGIN ritual_02
		SAY @12
		IF ~~ THEN REPLY @13 GOTO make_lighthouse_shine_again 
		IF ~~ THEN REPLY @14 + how_to_destroy_chamber
		END
		
			IF ~~ THEN BEGIN make_lighthouse_shine_again
			SAY @15
			IF ~~ THEN GOTO how_to_destroy_chamber 
			END
			
				IF ~~ THEN BEGIN how_to_destroy_chamber
				SAY @16
				=
				@17
				IF ~~ THEN GOTO ritual_book
				END
				
					IF ~~ THEN BEGIN ritual_book
					SAY @18
					IF ~~ THEN DO ~GiveItemCreate("AC#DTRIT",LastTalkedToBy(),1,0,0)~ GOTO give_book
					END
					
					IF ~~ THEN BEGIN give_book
					SAY @19
					IF ~~ THEN GOTO need_spellcaster
					IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_ritual_01
					IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_ritual_01
					END
					
						IF ~~ THEN BEGIN need_spellcaster
						SAY @20
						IF ~InParty([PC.0.0.MAGE_ALL])~ THEN REPLY @21 GOTO spellcaster_ok
						IF ~InParty([PC.0.0.SORCERER])~ THEN REPLY @22 GOTO spellcaster_ok
						IF ~InParty([PC.0.0.BARD_ALL])~ THEN REPLY @23 GOTO spellcaster_ok
						IF ~InParty([PC.0.0.DRUID_ALL])~ THEN REPLY @24 GOTO spellcaster_ok
						IF ~InParty([PC.0.0.CLERIC_ALL])~ THEN REPLY @25 GOTO spellcaster_ok
						IF ~InParty([PC.0.0.PALADIN_ALL])~ THEN REPLY @26 GOTO spellcaster_ok
						IF ~OR(6)
						Class(Player1,MAGE_ALL)
						Class(Player1,SORCERER)
						Class(Player1,BARD_ALL)
						Class(Player1,DRUID_ALL)
						Class(Player1,CLERIC_ALL)
						Class(Player1,PALADIN_ALL)~ THEN REPLY @27 + spellcaster_ok
						IF ~~ THEN REPLY @28 GOTO spellcaster_nope
						IF ~~ THEN REPLY @29 + spellcaster_nope
						END
						
							IF ~~ THEN BEGIN spellcaster_nope
							SAY @30
							IF ~~ THEN GOTO ritual_spells
							END
							
							IF ~~ THEN BEGIN spellcaster_ok
							SAY @31
							IF ~~ THEN GOTO ritual_spells
							END
							
								IF ~~ THEN BEGIN ritual_spells
								SAY @32
								IF ~~ THEN GOTO give_scroll 
								END
								
									IF ~~ THEN BEGIN give_scroll
									SAY @33
									IF ~~ THEN DO ~GiveItemCreate("SCRL7M",LastTalkedToBy(),1,0,0)~ GOTO finish_ritual 
									END
									
										IF ~~ THEN BEGIN finish_ritual
										SAY @34
										IF ~~ THEN REPLY @35 GOTO crystal_destroyed
										IF ~~ THEN REPLY @36 + not_more_to_say
										IF ~~ THEN REPLY @37 + not_more_to_say
										END
										
											IF ~~ THEN BEGIN crystal_destroyed
											SAY @38
											IF ~~ THEN REPLY @39 GOTO need_leave_island
											IF ~~ THEN REPLY @40 + not_more_to_say
											END
											
												IF ~~ THEN BEGIN need_leave_island
												SAY @41
												IF ~~ THEN REPLY @42 GOTO i_dont_think_so
												IF ~~ THEN REPLY @43 GOTO i_dont_think_so
												IF ~~ THEN REPLY @44 GOTO i_dont_think_so
												END
												
													IF ~~ THEN BEGIN i_dont_think_so
													SAY @45
													IF ~~ THEN GOTO not_more_to_say
													END
													
														IF ~~ THEN BEGIN not_more_to_say
														SAY @46
														IF ~GlobalGT("AC#DT_met_keeper","GLOBAL",0)~ THEN DO ~SetGlobal("AC#DT_met_keeper","GLOBAL",4)
														EraseJournalEntry(@18000)
														EraseJournalEntry(@18001)
														EraseJournalEntry(@18002)
														AddJournalEntry(@18010,QUEST)~ EXIT
														IF ~Global("AC#DT_met_keeper","GLOBAL",0)~ THEN DO ~SetGlobal("AC#DT_met_keeper","GLOBAL",4)
														EraseJournalEntry(@18000)
														EraseJournalEntry(@18001)
														EraseJournalEntry(@18002)
														AddJournalEntry(@18011,QUEST)~ EXIT
														END

IF ~Global("AC#DT_met_keeper","GLOBAL",2)~ THEN BEGIN hello_no_crystal
SAY @47
IF ~~ THEN EXIT
END

IF ~Global("AC#DT_met_keeper","GLOBAL",1)~ THEN BEGIN hello_again
SAY @4
IF ~~ THEN GOTO who_are_you
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @2
IF ~~ THEN REPLY @3 GOTO who_are_you
END

	IF ~~ THEN BEGIN who_are_you
	SAY @5
	IF ~~ THEN GOTO help_me
	END
	
		IF ~~ THEN BEGIN help_me
		SAY @48
		IF ~~ THEN REPLY @49 GOTO thats_why_i_am_here
		IF ~~ THEN REPLY @50 GOTO what_kind_of_crystal
		END
		
				IF ~~ THEN BEGIN what_kind_of_crystal
				SAY @51
				IF ~~ THEN REPLY @49 GOTO thats_why_i_am_here
				END
		
			IF ~~ THEN BEGIN thats_why_i_am_here
			SAY @52
			IF ~~ THEN REPLY @53 GOTO first_search_crystal
			IF ~~ THEN REPLY @54 + where_is_crystal
			IF ~~ THEN REPLY @55 + where_is_crystal
			END
			
				IF ~~ THEN BEGIN first_search_crystal
				SAY @56
				IF ~~ THEN REPLY @57 GOTO where_is_crystal
				END
				
					IF ~~ THEN BEGIN where_is_crystal
					SAY @58
					IF ~~ THEN REPLY @59 GOTO what_kind_of_dark_god
					IF ~~ THEN REPLY @60 + bye
					IF ~~ THEN REPLY @61 + could_need_little_help
					END
					
							IF ~~ THEN BEGIN could_need_little_help
							SAY @62
							IF ~~ THEN REPLY @63 GOTO what_kind_of_dark_god
							IF ~~ THEN REPLY @64 + bye 
							END
					
						IF ~~ THEN BEGIN what_kind_of_dark_god
						SAY @65
						IF ~~ THEN REPLY @66 GOTO whats_his_real_name
						IF ~~ THEN REPLY @67 GOTO whats_his_real_name
						IF ~~ THEN REPLY @68 GOTO cultists
						END
						
							IF ~~ THEN BEGIN whats_his_real_name
							SAY @69
							IF ~~ THEN REPLY @70 GOTO cultists
							IF ~~ THEN REPLY @71 GOTO cultists
							END
							
								IF ~~ THEN BEGIN cultists
								SAY @72
								IF ~Global("AC#DT_met_keeper","GLOBAL",0)~ THEN DO ~AddJournalEntry(@18001,QUEST)~ GOTO keep_searching
								IF ~Global("AC#DT_met_keeper","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@18000)
								AddJournalEntry(@18002,QUEST)~ GOTO keep_searching
								END
								
									IF ~~ THEN BEGIN keep_searching
									SAY @73
									IF ~~ THEN REPLY @74 GOTO bye
									IF ~~ THEN REPLY @75 + not_afraid_to_get_killed
									END
									
											IF ~~ THEN BEGIN not_afraid_to_get_killed
											SAY @76
											IF ~~ THEN GOTO bye 
											END
									
										IF ~~ THEN BEGIN bye
										SAY @77
										IF ~~ THEN DO ~SetGlobal("AC#DT_met_keeper","GLOBAL",2)~ EXIT 
										END

// Dialogue second Cultist

BEGIN ~AC#DT30B~

IF ~Global("Carry_Helmet","LOCALS",1)~ THEN BEGIN hello_friend
SAY @78
IF ~~ THEN GOTO fight
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @79
IF ~~ THEN GOTO fight
END

	IF ~~ THEN BEGIN fight
	SAY @80
	IF ~~ THEN DO ~SetGlobal("Carry_Helmet","LOCALS",10)
	CreateCreatureOffScreen("AC#DTSH2",0)  // Schatten
	CreateCreatureOffScreen("AC#DTSH2",0)  // Schatten
	CreateCreatureOffScreen("AC#DTSH2",0)  // Schatten
	CreateCreatureOffScreen("AC#DTSH2",0)  // Schatten
	CreateCreatureOffScreen("AC#DTSH2",0)  // Schatten
	CreateCreatureOffScreen("AC#DTSH2",0)  // Schatten
	Wait(1)
	Shout(89)
	Enemy()~ EXIT 
	END

// Dialogue first Cultist

BEGIN ~AC#DT30A~
IF ~Global("Carry_Helmet","LOCALS",3)~ THEN BEGIN hello_weapons
SAY @81
IF ~~ THEN GOTO not_real_cultist
END

IF ~Global("Carry_Helmet","LOCALS",1)~ THEN BEGIN hello_friend
SAY @82
IF ~~ THEN REPLY @83 GOTO yes_sacrifice_indeed
IF ~~ THEN REPLY @84 GOTO fight
END

	IF ~~ THEN BEGIN yes_sacrifice_indeed
	SAY @85
	IF ~~ THEN REPLY @86 GOTO not_real_cultist 
	IF ~~ THEN REPLY @87 GOTO not_real_cultist 
	IF ~~ THEN REPLY @88 + g_o_t_vow
	IF ~~ THEN REPLY @89 + right_vow
	IF ~~ THEN REPLY @90 + g_o_t_vow
	IF ~~ THEN REPLY @91 + g_o_t_vow
	IF ~~ THEN REPLY @92 + g_o_t_vow
	IF ~~ THEN REPLY @93 GOTO fight
	END
	
		IF ~~ THEN BEGIN right_vow
		SAY @94
		=
		@95
		IF ~~ THEN GOTO go_to_temple
		END
		
			IF ~~ THEN BEGIN go_to_temple
			SAY @96
			IF ~~ THEN REPLY @97 + where_am_I
			IF ~~ THEN REPLY @98 GOTO where_temple
			IF ~~ THEN REPLY @99 + whose_temple
			IF ~~ THEN REPLY @100 + about_vergol
			IF ~~ THEN REPLY @101 + what_to_do_with_people	
			IF ~~ THEN REPLY @102 + crystal
			IF ~~ THEN REPLY @103 GOTO fight
			IF ~~ THEN REPLY @104 + lets_go		
			END
			
			IF ~~ THEN BEGIN where_am_I
			SAY @105
			IF ~~ THEN REPLY @98 GOTO where_temple
			IF ~~ THEN REPLY @99 + whose_temple
			IF ~~ THEN REPLY @100 + about_vergol
			IF ~~ THEN REPLY @101 + what_to_do_with_people	
			IF ~~ THEN REPLY @102 + crystal
			IF ~~ THEN REPLY @103 GOTO fight
			IF ~~ THEN REPLY @104 + lets_go		
			END
			
				IF ~~ THEN BEGIN crystal
				SAY @106
				IF ~~ THEN REPLY @97 + where_am_I
				IF ~~ THEN REPLY @98 GOTO where_temple
				IF ~~ THEN REPLY @99 + whose_temple
				IF ~~ THEN REPLY @100 + about_vergol
				IF ~~ THEN REPLY @101 + what_to_do_with_people	
				IF ~~ THEN REPLY @103 GOTO fight
				IF ~~ THEN REPLY @104 + lets_go
				END
			
				IF ~~ THEN BEGIN what_to_do_with_people
				SAY @107
				IF ~~ THEN REPLY @97 + where_am_I
				IF ~~ THEN REPLY @98 GOTO where_temple
				IF ~~ THEN REPLY @99 + whose_temple
				IF ~~ THEN REPLY @100 + about_vergol
				IF ~~ THEN REPLY @102 + crystal
				IF ~~ THEN REPLY @103 GOTO fight
				IF ~~ THEN REPLY @104 + lets_go 
				END
			
				IF ~~ THEN BEGIN about_vergol
				SAY @108
				IF ~~ THEN REPLY @97 + where_am_I
				IF ~~ THEN REPLY @98 GOTO where_temple
				IF ~~ THEN REPLY @99 + whose_temple
				IF ~~ THEN REPLY @101 + what_to_do_with_people	
				IF ~~ THEN REPLY @102 + crystal
				IF ~~ THEN REPLY @103 GOTO fight
				IF ~~ THEN REPLY @104 + lets_go
				END
			
					IF ~~ THEN BEGIN whose_temple
					SAY @109
					IF ~~ THEN GOTO not_real_cultist
					END
			
				IF ~~ THEN BEGIN where_temple
				SAY @110
				IF ~~ THEN REPLY @97 + where_am_I
				IF ~~ THEN REPLY @99 + whose_temple
				IF ~~ THEN REPLY @100 + about_vergol
				IF ~~ THEN REPLY @101 + what_to_do_with_people	
				IF ~~ THEN REPLY @102 + crystal
				IF ~~ THEN REPLY @103 GOTO fight
				IF ~~ THEN REPLY @104 + lets_go
				END
				
					IF ~~ THEN BEGIN lets_go
					SAY @111
					IF ~~ THEN REPLY @103 GOTO fight
					IF ~~ THEN REPLY @112 + bye
					END
										
	
		IF ~~ THEN BEGIN g_o_t_vow
		SAY @113
		IF ~~ THEN GOTO not_real_cultist
		END

					IF ~~ THEN BEGIN bye
					SAY @114
					IF ~~ THEN DO ~SetGlobal("Carry_Helmet","LOCALS",2)~ EXIT 
					END
					
				IF ~~ THEN BEGIN not_real_cultist
				SAY @115 			
				IF ~~ THEN GOTO fight
				END
				
				IF ~~ THEN BEGIN fight
				SAY @116
				IF ~~ THEN DO ~SetGlobal("Carry_Helmet","LOCALS",10)
				EraseJournalEntry(@12003)
				AddJournalEntry(@12004,QUEST_DONE)
				Enemy()~ EXIT 
				END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @117
IF ~~ THEN REPLY @118 GOTO what_is_this_place
END

	IF ~~ THEN BEGIN what_is_this_place
	SAY @119
	IF ~~ THEN REPLY @120 GOTO quite_dark
	IF ~~ THEN REPLY @121 + quite_dark
	END
	
		IF ~~ THEN BEGIN quite_dark
		SAY @122
		IF ~~ THEN REPLY @123 GOTO plane_of_shadows
		IF ~~ THEN REPLY @124 GOTO plane_of_shadows
		IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_plane_of_shadows
		END
		
			IF ~~ THEN BEGIN plane_of_shadows
			SAY @125
			IF ~~ THEN REPLY @126 GOTO whats_your_role
			IF ~~ THEN REPLY @42 GOTO not_my_taste
			IF ~~ THEN REPLY @127 GOTO not_my_taste
			END
			
				IF ~~ THEN BEGIN whats_your_role
				SAY @128				
				IF ~~ THEN GOTO time_to_die
				END
				
				IF ~~ THEN BEGIN not_my_taste
				SAY @129				
				IF ~~ THEN GOTO time_to_die
				END
				
					IF ~~ THEN BEGIN time_to_die
					SAY @130
					IF ~~ THEN DO ~SetGlobal("Carry_Helmet","LOCALS",10)
					EraseJournalEntry(@12003)
					AddJournalEntry(@12004,QUEST_DONE)
					Enemy()~ EXIT 
					END

// Dialogue Nightwing
BEGIN ~AC#DTNWI~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY @131
IF ~~ THEN DO ~Enemy()~ EXIT
END

/*
NPCs
*/
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_ritual_01
   SAY @132
   IF ~~ THEN EXTERN ~AC#DT30G~ need_spellcaster
END
END

APPEND ~EDWINJ~
IF ~~ THEN BEGIN Edwin_ritual_01
SAY @133
IF ~~ THEN EXTERN ~AC#DT30G~ need_spellcaster
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN Viconia_plane_of_shadows
   SAY @134
   IF ~~ THEN EXTERN ~AC#DT30A~ not_real_cultist
END
END

