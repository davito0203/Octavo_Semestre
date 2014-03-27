<Qucs Schematic 0.0.15>
<Properties>
  <View=-42,170,865,1305,1,89,60>
  <Grid=10,10,0>
  <DataSet=matchingExampleArbitra.dat>
  <DataDisplay=matchingExampleArbitra.dpl>
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
  <Pac P1 1 340 500 -74 -16 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 340 560 0 0 0 0>
  <.SP SP1 1 110 400 0 71 0 0 "lin" 1 "0" 1 "0.4" 1 "200" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <TLIN Line1 1 410 440 -39 -70 0 0 "Zline" 1 "l1" 1 "0 dB" 0 "26.85" 0>
  <.SW SW1 1 260 950 0 71 0 0 "SP1" 1 "lin" 1 "Zline" 1 "67 Ohm" 1 "68 Ohm" 1 "20" 1>
  <Eqn Eqn1 1 600 440 -32 17 0 0 "ReturnLoss=-20*log10(abs(S[1,1]))" 1 "Zl=80+j*20" 1 "lambda0=3e8" 1 "l1=lambda0" 1 "yes" 0>
  <RFEDD RF1 5 510 440 -24 -42 0 0 "Z" 0 "1" 0 "open" 0 "Zl" 1>
</Components>
<Wires>
  <340 530 340 560 "" 0 0 0 "">
  <440 440 480 440 "" 0 0 0 "">
  <340 440 340 470 "" 0 0 0 "">
  <340 440 380 440 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 100 818 352 214 3 #c0c0c0 1 00 1 0 0.2 1 1 -1.42725 10 35.3131 1 -1 0.5 1 315 0 225 "Line length (lambda)" "Return Loss (dB)" "">
	<"ReturnLoss" #0000ff 3 3 0 0 0>
  </Rect>
  <Smith 480 976 376 376 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 " " " " "">
	<"S[1,1]" #0000ff 3 3 0 0 0>
  </Smith>
</Diagrams>
<Paintings>
</Paintings>
