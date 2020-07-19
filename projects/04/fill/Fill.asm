// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LISTENLOOP)
  @KBD
  D=M
  @BLACK
  D;JNE
  @WHITE
  0;JMP

(WHITE)
  @SCREEN
  D=A
  @currentpos
  M=D //現在のピクセルアドレスをSCREENにセット  
  @24575 //SCREENの最後のアドレス
  D=A
  @screenend
  M=D
(DRAWWHITELOOP)
  @currentpos
  A=M //現在のピクセルアドレスをAレジスタにセット
  M=0 //白く塗る
  D=A+1 //次のピクセルアドレスをDレジスタに格納
  @currentpos
  M=D //次のピクセルアドレスをDレジスタからcurrentposに格納
  @screenend
  D=D-M //スクリーンの最後のアドレスか判定
  @LISTENLOOP
  D;JGT //スクリーンメモリマップを超えた場合はLISTENLOOPに戻る
  @DRAWWHITELOOP
  0;JMP //スクリーンメモリマップを超えない場合はDRAWWHITELOOPで次のピクセルを白く塗る

(BLACK)
  @SCREEN
  D=A
  @currentpos
  M=D //現在のピクセルアドレスをSCREENにセット  
  @24575 //SCREENの最後のアドレス
  D=A
  @screenend
  M=D
(DRAWBLACKLOOP)
  @currentpos
  A=M //現在のピクセルアドレスをAレジスタにセット
  M=-1 //黒く塗る
  D=A+1 //次のピクセルアドレスをDレジスタに格納
  @currentpos
  M=D //次のピクセルアドレスをDレジスタからcurrentposに格納
  @screenend
  D=D-M //スクリーンの最後のアドレスか判定
  @LISTENLOOP
  D;JGT //スクリーンメモリマップを超えた場合はLISTENLOOPに戻る
  @DRAWBLACKLOOP
  0;JMP //スクリーンメモリマップを超えない場合はDRAWBLACKLOOPで次のピクセルを黒く塗る
