1 REM
2 REM
3 REM
4 REM
5 REM
6 REM
7 REM
8 REM
9 REM
10 REM
11 REM
12 REM
14 REM
15 REM
16 CLEAR : RESTORE : SCALE = 1: ROT = 0
20 A = 65:B = 5
30 B$ = CHR$ (08)
40 DATA 2, 0, 6, 0, 16, 0, 18, 63, 32, 100, 45, 21, 54, 30, 7, 0, 210, 237, 45, 0
50 FOR X = 1 TO 20: READ Y
60 POKE (7675 + X),Y: NEXT X
70 POKE 115,252: POKE 116,29: POKE 232,252: POKE 233,29
90 D = 7:E = 1
100 DIM CC(22)
110 HOME
120 LI = 0
130 TEXT
140 PRINT "ADD NEW IDEO, EDIT OLD, OR END"
150 PRINT : PRINT "   (TYPE 'NEW', 'OLD' OR 'END')";: INPUT Q$
160 IF Q$ = "OLD" THEN 1680
170 IF Q$ = "END" THEN END
180 GOSUB 800: GOSUB 840: GOSUB 920: GOSUB 970
190 HCOLOR= 7: HGR
200 HPLOT 60,0 TO 220,0 TO 220,159 TO 60,159 TO 60,0
210 FOR X = 70 TO 210 STEP 10
220 HPLOT X,0 TO X,159: NEXT X
230 FOR Y = 10 TO 150 STEP 10
240 HPLOT 60,Y TO 220, Y: NEXT Y
250 IF LI = 1 THEN 1710
260 GOTO 770
270 IF A$ = "A" THEN 410
280 IF A$ = "Z" THEN 650
290 IF A$ = B$ THEN 450
300 IF A$ < > "X" THEN 340
310 DRAW 1 AT A,B
320 GOSUB 600
330 GOTO 350
340 GOSUB 610
350 A = A + 10: IF A > 220 THEN 370
360 GOTO 260
370 A = 65: B = B + 10
380 IF FG = 1 THEN 1640
390 IF B > 160 THEN 520
400 GOTO 260
410 FOR C = A TO 215 STEP 10
420 DRAW 1 AT C,B
430 GOSUB 600
440 NEXT C: GOTO 370
450 D = D + 1: IF D < 8 THEN 470
460 D = 0:E = E - 1
470 GOTO 680
480 T(E) = T(E) - 2 ^ D
490 A = A - 10: IF A > 60 THEN 510
500 A = 215: B = B - 10
510 HCOLOR= 4: DRAW 1 AT A,B: HCOLOR= 7: GOTO 260
520 FOR X = 1 TO 20: PRINT : NEXT X
530 PRINT "FREQ  "; FQ, "STC    ";S
540 IF LI > 0 THEN 2010
550 PRINT "OSCO  ";O$, "CALD   ";C$
560 PRINT : PRINT "IS DATA CORRECT (YES OR NO)?";
570 INPUT Q$
580 IF Q$ = "YES" THEN 1080
590 GOTO 1030
600 T(E) = T(E) + 2 ^ D
610 D = D - 1
620 IF D < > ( - 1) THEN 640
630 D = 7: E = E + 1
640 RETURN
650 FOR C = A TO 215 STEP 10
660 GOSUB 610: NEXT C
670 GOTO 370
680 Y = 0
690 FOR X = 7 TO 0 STEP - 1
700 Y = T(E) - (2 ^ X - Y)
710 IF Y < 0 THEN 730
720 U(X) = 1: GOTO 740
730 U(X) = 0:Y = Y + 2 ^ X
740 NEXT X
750 IF U(D) = 1 THEN 480
760 GOTO 490
770 DRAW 2 AT A,B: GET A$
780 HCOLOR= 4: DRAW 2 AT A,B
790 HCOLOR= 7: GOTO 270
800 PRINT "FREQUENCY NUMBER";
810 INPUT FQ
820 FH = INT (FQ / 256): FL = FQ - (FH * 256)
830 RETURN
840 PRINT "OSCO CODE";: INPUT O$
850 IF LI = 0 THEN 870
860 LI = 3
870 O1 = ASC ( LEFT$ (O$,1))
880 O2 = ASC ( MID$ (O$,2,1))
890 O3 = ASC ( MID$ (O$,3,1))
900 O4 = ASC ( MID$ (O$,4,1))
910 RETURN
920 PRINT "STC";: INPUT S
930 S1 = INT (S / 1000):X = S - S1 * 1000
940 S2 = INT (X / 100):X = X - S2 * 100
950 S3 = INT (X / 10):S4 = X - S3 * 10
960 RETURN
970 PRINT "CALDWELL CODE";: INPUT C$
975 FOR X = 1 TO 22:CC(X) = 0: NEXT X
980 L = LEN (C$)
990 FOR X = 1 TO L
1000 CC(X) = ASC ( MID$ (C$,X,1))
1010 NEXT X
1020 RETURN
1030 PRINT "ENTER CODE FOR WHAT YOU WANT TO CHANGE": PRINT
1034 IF LI = 2 THEN 1050
1035 IF LI = 3 THEN 1050
1036 IF LI = 1 THEN 1040
1037 LI = 4: GOTO 1050
1040 LI = 2
1050 PRINT "FREQ=1  OSC0=2  STC=3  CALD=4  IDEO=5 ";: INPUT X
1060 ON X GOSUB 800, 840, 920, 970, 1520
1070 GOTO 520
1080 IF LI = 1 THEN 10
1090 PRINT "IS DISK # "; INT (FQ / 2000) + 1; "?"; CHR# (07)
1100 PRINT "HIT ANY KEY IF CORRECT DISK IS INSTALLED": GET Q$
1110 GOSUB 1130
1120 POKE 16428,1: GOTO 1300
1130 RESTORE : FOR X = 1 TO 20
1140 READ Y: NEXT X
1150 DATA 169,64,160,32,32, 217, 3, 96, 0
1160 DATA 1, 96, 1, 0, 0, 0, 64, 64, 0, 65, 0, 0, 0, 0, 0, 96, 1
1170 DATA 0, 1, 239, 216
1180 FOR X = 1 TO 9: READ Y
1190 POKE (16383 + X), Y: NEXT X
1200 FOR X = 1 TO 17: READ Y
1210 POKE (16415 + X), Y: NEXT X
1220 FOR X = 1 TO 4: READ Y
1230 POKE (16447 + X), Y: NEXT X
1240 Y = FQ - ( INT (FQ / 2000) * 2000)
1250 TK = INT (Y / 64)
1260 SR = INT ((Y - TK * 64) / 4)
1270 DV = (Y / 4 - INT (Y / 4)) * 4
1280 POKE 16420, TK: POKE 16421, SR
1290 RETURN
1300 CALL 16384
1310 IF LI = 1 THEN 190
1320 Z = DV * 64
1330 FOR Y = 1 TO 32
1340 POKE (16640 + Z),T(Y):Z = Z +1: NEXT Y
1350 POKE (16640 + Z), FL:Z = Z + 1
1360 POKE (16640 + Z), FH: Z = Z + 1
1370 POKE (16640 + Z),01:Z = Z + 1
1380 POKE (16640 + Z),02:Z = Z + 1
1390 POKE (16640 + Z),03:Z = Z + 1
1400 POKE (16640 + Z),04:Z = Z + 1
1410 POKE (16640 + Z), S1: Z = Z + 1
1420 POKE (16640 + Z),S2:Z = Z + 1
1430 POKE (16640 + Z),S3:Z = Z + 1
1440 POKE (16640 + Z),S4:Z = Z + 1
1450 FOR Y = 1 TO 22: POKE (16640 + Z), CC(Y): Z = Z + 1: NEXT Y
1460 TK = 0:SR = 0
1470 GOSUB 1130
1480 POKE 16428,2
1490 CALL 16384
1500 TEXT : HOME
1510 GOTO 10
1520 POP
1530 PRINT "DO YOU WANT TO START AGAIN";: INPUT Q$
1540 A = 65: B = 5:D = 7: E = 1
1550 IF Q$ = "YES" THEN 190
1560 PRINT "WHAT LINE DO YOU WANT TO CHANGE";: INPUT X
1570 B = B + (X - 1) * 10: E = X * 2 - 1
1580 T(E) = 0: E = E + 1:T(E) = 0:E = E - 1
1590 HCOLOR= 4
1600 FOR X = 65 TO 215 STEP 10
1610 DRAW 1 AT X,B: NEXT X
1620 HCOLOR= 7
1630 FG = 1: GOTO 770
1640 PRINT "ANOTHER LINE";: INPUT Q$
1650 A = 65: B = 5:D = 7:E = 1
1660 IF Q$ = "YES" THEN 1560
1670 GOTO 520
1680 PRINT "FREQUENCY ";: INPUT FQ
1690 LI = 1
1700 GOTO 1110
1710 DV = DV * 64
1720 G = DV + (E - 1)
1730 Y = 0
1740 T(E) = PEEK (16640 + G)
1750 FOR X = 7 TO 0 STEP - 1
1760 U = T(E) - 2 ^ X - Y
1770 IF U < 0 THEN 1800
1780 DRAW 1 AT A,B
1790 Y = Y + 2 ^ 2
1800 A = A + 10: NEXT X:E = E + 1
1810 IF A > 220 THEN 1830
1820 GOTO 1720
1830 A = 65: B = B + 10: IF B > 160 THEN 1850
1840 GOTO 1720
1850 A = 65: B = 5: E = 1
1860 G = G + 1: FL = PEEK (16640 + G): G = G + 1
1870 FH = PEEK (16640 + G):G = G + 1:FQ = FH * 256 + FL
1880 O1 = PEEK (16640 + G):G = G + 1
1890 O2 = PEEK (16640 + G):G = G + 1
1900 O3 = PEEK (16640 + G):G = G + 1
1910 O4 = PEEK (16640 + G):G = G + 1
1920 O1$ = CHR$ (O1):O2$ = CHR$ (O2):O3$ = CHR$ (O3):O4$ = CHR$ (O4)
1930 S1 = PEEK (16640 + G):G = G + 1
1940 S2 = PEEK (16640 + G):G = G + 1
1950 S3 = PEEK (16640 + G):G = G + 1
1960 S4 = PEEK (16640 + G):G = G + 1
1970 S = S1 * 1000 + S2 * 100 + S3 * 10 + S4
1980 FOR X = 1 TO 22:CC(X) = PEEK (16640 + G)
1990 G = G + 1: NEXT X
2000 GOTO 520
2010 IF LI > 2 THEN PRINT "OSCO ";O$,: GOTO 2040
2030 PRINT "OSCO.  ";O1$;O2$;O3$;O4$,
2040 PRINT "CALD ";
2050 FOR X = 1 TO 22
2060 IF CC(X) = 0 THEN 2080
2070 PRINT CHR$ (CC(X));: NEXT X
2080 PRINT : GOTO 560
2090 END
