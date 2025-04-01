
/****************************
// Dialogue Cromwell: upgrade waterblade
*****************************/
EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("AC#DTSWW")~ THEN GOTO have_waterblade
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN have_waterblade 
  SAY @0
    IF ~~ THEN GOTO have_waterblade_02
  END
  
  IF ~~ THEN BEGIN have_waterblade_02 
  SAY @1
    IF ~!PartyHasItem("misc33")~ THEN GOTO need_aquamarin
    IF ~PartyHasItem("misc33")~ THEN GOTO has_aquamarin
  END

	IF ~~ THEN BEGIN need_aquamarin 
	SAY @2
    IF ~~ THEN REPLY @3 + features_no_aquamarin
	IF ~~ THEN REPLY @4 + NoThanks
	END
	
	IF ~~ THEN BEGIN features_no_aquamarin 
	SAY @5
	IF ~~ THEN REPLY @6 + NoThanks
	IF ~~ THEN REPLY @4 + NoThanks
	END
    
  IF ~~ THEN BEGIN has_aquamarin 
  SAY @7
    IF ~~ THEN REPLY @3 + features_with_aquamarin
	IF ~PartyGoldLT(5000)~ THEN REPLY #66900 GOTO NoThanks
    IF ~PartyGoldGT(4999)~ THEN REPLY #66901 DO ~SetGlobal("AC#Waterblade","ar0334",1)
												SetGlobal("ForgeStuff","GLOBAL",1)
                                                  TakePartyGold(5000)
                                                  TakePartyItem("AC#DTSWW")
                                                  DestroyItem("AC#DTSWW")
												  TakePartyItemNum("misc33",1)
                                                 DestroyItem("misc33")
                                                  DestroyGold(5000)~ GOTO 56
	IF ~~ THEN REPLY #66802 GOTO NoThanks
	END 
	
	IF ~~ THEN BEGIN features_with_aquamarin 
	SAY @8
	IF ~PartyGoldLT(5000)~ THEN REPLY #66900 GOTO NoThanks
    IF ~PartyGoldGT(4999)~ THEN REPLY #66901 DO ~SetGlobal("AC#Waterblade","ar0334",1)
												SetGlobal("ForgeStuff","GLOBAL",1)
                                                  TakePartyGold(5000)
                                                  TakePartyItem("AC#DTSWW")
                                                  DestroyItem("AC#DTSWW")
												  TakePartyItemNum("misc33",1)
                                                 DestroyItem("misc33")
                                                  DestroyGold(5000)~ GOTO 56
	IF ~~ THEN REPLY #66802 GOTO NoThanks
	END
	
  
  IF ~~ THEN BEGIN NoThanks 
  SAY @9
   COPY_TRANS WSMITH01 13
  END
END
