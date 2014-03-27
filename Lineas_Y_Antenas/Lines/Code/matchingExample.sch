<Qucs Schematic 0.0.15>
<Properties>
  <View=-20,171,982,1006,1,0,11>
  <Grid=10,10,1>
  <DataSet=matchingExample.dat>
  <DataDisplay=matchingExample.dpl>
  <OpenDisplay=1>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <TLIN Line2 1 270 510 20 -26 0 1 "50 Ohm" 1 "l2" 1 "0 dB" 0 "26.85" 0>
  <GND * 1 270 560 0 0 0 0>
  <Pac P1 1 120 500 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 120 560 0 0 0 0>
  <RFEDD RF1 1 520 440 -26 -43 0 0 "Z" 0 "1" 0 "open" 0 "80+j*20" 0>
  <TLIN Line1 1 410 440 -26 20 0 0 "50 Ohm" 1 "l1" 1 "0 dB" 0 "26.85" 0>
  <.SP SP1 1 210 220 0 71 0 0 "lin" 1 "150 MHz" 1 "600 MHz" 1 "500" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 660 300 -32 17 0 0 "ReturnLoss=-20*log10(abs(S[1,1]))" 1 "Zl=80+j*20" 1 "lambda0=1" 1 "l1=lambda0*0.1806" 1 "yes" 0 "l2=lambda0*0.1678" 1>
</Components>
<Wires>
  <270 440 270 480 "" 0 0 0 "">
  <270 540 270 560 "" 0 0 0 "">
  <120 530 120 560 "" 0 0 0 "">
  <120 440 120 470 "" 0 0 0 "">
  <120 440 270 440 "" 0 0 0 "">
  <270 440 380 440 "" 0 0 0 "">
  <440 440 490 440 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 590 668 352 214 3 #c0c0c0 1 00 1 0 0.2 1 1 -1.42725 10 35.3131 1 -1 0.5 1 315 0 225 "Line length (lambda)" "Return Loss (dB)" "">
	<"ReturnLoss" #0000ff 3 3 0 0 0>
  </Rect>
  <Smith 20 966 376 376 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 " " " " "">
	<"S[1,1]" #0000ff 3 3 0 0 0>
  </Smith>
</Diagrams>
<Paintings>
</Paintings>
