<Qucs Schematic 0.0.15>
<Properties>
  <View=0,-439,952,1132,0.7,0,0>
  <Grid=10,10,1>
  <DataSet=hybrid.dat>
  <DataDisplay=hybrid.dpl>
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
  <GND * 1 300 130 0 0 0 0>
  <Pac P1 1 300 100 18 -26 0 1 "1" 1 "Zr" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 300 370 0 0 0 0>
  <Pac P2 1 300 340 18 -26 0 1 "2" 1 "Zr" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <.SP SP1 1 70 70 0 72 0 0 "lin" 1 "fmin" 1 "fmax" 1 "100" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <TLIN Line1 1 500 120 -26 20 0 0 "Zc2" 1 "l" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line5 1 500 310 -26 20 0 0 "Zc2" 1 "l" 1 "0 dB" 0 "26.85" 0>
  <TLIN Line7 1 600 230 20 -26 0 1 "Zc" 1 "l" 1 "0 dB" 0 "26.85" 0>
  <Eqn Eqn1 1 820 100 -32 17 0 0 "Zc2=Zr/sqrt(2)" 1 "Zr=50" 1 "l=0.25" 1 "fmin=299792458" 1 "fmax=299792458" 1 "Zc=Zr" 1 "yes" 0>
  <TLIN Line6 1 400 230 20 -26 0 1 "Zc" 1 "l" 1 "0 dB" 0 "26.85" 0>
  <GND * 1 700 130 0 0 1 2>
  <Pac P4 1 700 100 -70 -26 1 1 "4" 1 "Zr" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 700 370 0 0 1 2>
  <Pac P3 1 700 340 -70 -26 1 1 "3" 1 "Zr" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
</Components>
<Wires>
  <530 120 600 120 "" 0 0 0 "">
  <600 120 600 200 "" 0 0 0 "">
  <600 260 600 310 "" 0 0 0 "">
  <530 310 600 310 "" 0 0 0 "">
  <300 310 400 310 "" 0 0 0 "">
  <400 120 470 120 "" 0 0 0 "">
  <400 120 400 200 "" 0 0 0 "">
  <300 70 400 70 "" 0 0 0 "">
  <400 70 400 120 "" 0 0 0 "">
  <400 310 470 310 "" 0 0 0 "">
  <400 260 400 310 "" 0 0 0 "">
  <600 70 600 120 "" 0 0 0 "">
  <600 70 700 70 "" 0 0 0 "">
  <600 310 700 310 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Smith 280 940 521 521 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 "" "" "">
	<"S[1,1]" #0000ff 0 3 0 5 0>
	<"S[2,1]" #ff0000 0 3 0 4 0>
	<"S[3,1]" #ff00ff 0 3 0 4 0>
	<"S[4,1]" #00ff00 0 3 0 5 0>
  </Smith>
</Diagrams>
<Paintings>
</Paintings>
