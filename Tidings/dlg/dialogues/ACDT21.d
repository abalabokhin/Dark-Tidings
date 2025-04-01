
// Dialogue Dark Voice in area ACDT21
BEGIN ~AC#DT21C~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY @0
=
@1
=
@2
=
@3
=
@4
IF ~~ THEN DO ~ReallyForceSpellRES("AC#DT21C",LastTalkedToBy())
SetGlobal("Shadowstone_Trigger","ACDT21",2)
DestroySelf()~ EXIT
END


