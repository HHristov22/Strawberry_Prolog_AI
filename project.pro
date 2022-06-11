?- window( title("Marvel Characters Game"), size(720,400)).

win_func(init):-
  G_Masked_Word := "",
  G_Mistake := 0,  
  G_Word_Number := random(14),
  choose_word,
  static( text("Type a letter:"), pos(10,22), size(180,30)),
  G_Letter_Input := edit( pos(155,15), size(30,30)),
  G_Word_Check := static( text(""), pos(10,120), size(300,20)),
  button( class(button_check), text("Check"), pos(200,15), size(70,30) ),
  button( class(button_info), text("?"), pos(665,0), size(30,30) ),
  button( class(button_help), text("Hint"), pos(635,320), size(60,30) ),
  mask_the_word.
  
win_func(paint):-
  for(I, 1, G_Mistake),
  hint(I,G_Word_Number),
  fail.
	

button_check(press) :-
  Letter is get_text(G_Letter_Input),
  New_Mask := "",
  check_mask(New_Mask, Letter),
  check_masks(New_Mask),
  set_text("", G_Letter_Input),
  (G_Mistake=5 ->
    hanged
  else
    display_masked,
    (G_Masked_Word = G_Word -> win)
  ).


button_info(press) :-
  (information_m).
 
button_help(press) :-
  (help_m).



check_masks(New_Mask) :-
  G_Masked_Word = New_Mask ->
    hang
  else
    G_Masked_Word := New_Mask.


check_mask(New_Mask, Letter):- 
  for(I, 0, str_length(G_Word)- 1),
  sub_string(Let, G_Word, I, 1),
  check_sub_mask(New_Mask, Let, Letter, I),
  fail.
check_mask(New_Mask, Letter).



check_sub_mask(Mask, Let, Letter, Pos) :-
  Let = Letter ->
    Mask := Mask + Let
  else
    sub_string(Sub, G_Masked_Word, Pos, 1),
    Mask := Mask + Sub.
check_sub_mask(Mask, Let, Letter, Pos).


choose_word :-
  word(G_Word_Number, Word),
  G_Word:=Word.
choose_word.

mask_the_word :-
  G_Masked_Word := "",
  for(I, 0, str_length(G_Word)- 1),
  G_Masked_Word := G_Masked_Word + "_",
  display_masked,
  fail.
mask_the_word.


display_masked :-
  Display_Mask := "",
  for(I, 0, str_length(G_Masked_Word)- 1),
  sub_string(Sub, G_Masked_Word, I, 1),
  Display_Mask := Display_Mask + Sub + "  ",  
  set_text(Display_Mask, G_Word_Check),
  fail.
display_masked.


hang :-
  G_Mistake := G_Mistake + 1,
  hint(G_Mistake,G_Word_Number).
hang.


hint(1,0) :- pen(8, rgb(179, 230, 255)), ellipse(350, 50, 550, 250).
hint(2,0) :- pen(8, rgb(179, 230, 255)), line(385,185,515,185).
hint(3,0) :- pen(8, rgb(179, 230, 255)), line(515,185,450,80).
hint(4,0) :- pen(8, rgb(179, 230, 255)), line(450,80,385,185).
hint(5,0).

hint(1,1) :- pen(8, rgb(255, 0, 0)), ellipse(340, 40, 560, 260).
hint(2,1) :- pen(6, rgb(255, 0, 0)), line(400,230,400,200), line(400,200,415,180), line(500,230,500,200), line(500,200,485,180).
hint(3,1) :- pen(6, rgb(255, 0, 0)), line(400,80,400,110), line(400,110,415,130), line(500,80,500,110), line(500,110,485,130).
hint(4,1) :- pen(8, rgb(255, 0, 0)), ellipse(410,100, 490,210).
hint(5,1).

hint(1,2) :- pen(100, rgb(0, 128, 43)), ellipse(350, 50, 550, 250).
hint(2,2) :- pen(100, rgb(0, 204, 68)), line(450,150,450,190).
hint(3,2) :- pen(30, rgb(0, 204, 68)), line(500,115,500,155).
hint(4,2) :- pen(40, rgb(0, 204, 68)), line(410,110,410,150), line(430,110,430,150), line(450,110,450,150), line(470,110,470,150),pen(1, rgb(0, 0, 0)),line(420,93,420,130),line(440,93,440,130),line(460,93,460,130),line(490,103,490,150).
hint(5,2).


hint(1,3) :- pen(10, rgb(255, 0, 0)), ellipse(350, 50, 550, 250).
hint(2,3) :- pen(11, rgb(255, 0, 0)), ellipse(375, 75, 525, 225).
hint(3,3) :- pen(75, rgb(0, 0, 240)), ellipse(385, 85, 515, 215).
hint(4,3) :- pen(3, rgb(230, 230, 230)), line(450,85,430,130), line(450,85,470,130), line(430,130,387,135), line(470,130,513,135), line(387,135,420,165), line(513,135,480,165), line(420,165,410,200), line(480,165,490,200), line(410,200,450,180), line(490,200,450,180).
hint(5,3).


hint(1,4) :- pen(10, rgb(0, 0, 10)), ellipse(350, 50, 550, 250).
hint(2,4) :- pen(4, rgb(0, 0, 0)), line(410,100,400,110),line(490,100,500,110),line(410,100,490,100), line(410,150,400,140),line(490,150,500,140),line(410,150,490,150),line(400,140,400,110),line(500,140,500,110).
hint(3,4) :- pen(15, rgb(0, 0, 0)),line(450,152,450,210).
hint(4,4) :- pen(10, rgb(250, 250, 0)), line(520,65,500,115), line(500,115,485,105), line(485,105,465,165), line(465,165,450,150), line(450,150,430,210), line(430,210,415,195), line(415,195,395,255).
hint(5,4).


hint(1,5) :- pen(5, rgb(0, 0, 0)), ellipse(350, 50, 550, 250).
hint(2,5) :- pen(100, rgb(230, 0, 0)), ellipse(380, 75, 520, 205), pen(100, rgb(255, 255, 255)), ellipse(400, 55, 500, 210).
hint(3,5) :- pen(8, rgb(230, 0, 0)), ellipse(435, 170, 465, 190), line(457,185,467,180),line(457,175,467,180), line(443,185,433,180),line(443,175,433,180).
hint(4,5) :- pen(10, rgb(230, 0, 0)),line(400,110,450,150),line(400,100,450,150),line(500,110,450,150),line(500,100,450,150).
hint(5,5).


hint(1,6) :- pen(100, rgb(209, 179, 255)), ellipse(350, 50, 550, 250).
hint(2,6) :- pen(100, rgb(255, 255, 128)), ellipse(380, 80, 520, 220).
hint(3,6) :- pen(10, rgb(230, 0, 0)), ellipse(440, 90, 460, 110), pen(10, rgb(122, 0, 204)), ellipse(400, 165, 420, 185), pen(10, rgb(236, 236, 0)), ellipse(480, 165, 500, 185).
hint(4,6) :- pen(10, rgb(0, 204, 102)), ellipse(440, 190, 460, 210), pen(10, rgb(255, 161, 20)), ellipse(400, 115, 420, 135), pen(10, rgb(77, 121, 255)), ellipse(480, 115, 500, 135).
hint(5,6).


hint(1,7) :- pen(100, rgb(71, 109, 34)), ellipse(350, 50, 550, 250).
hint(2,7) :- pen(100, rgb(172, 6, 78)), ellipse(380, 80, 520, 220).
hint(3,7) :- pen(50, rgb(71, 109, 34)), line(405, 100, 450, 210), line(495, 100, 450, 210),pen(2, rgb(172, 6, 78)),line(410,200,430,150),line(430,150,410,100),line(490,200,470,150),line(470,150,490,100),line(390,180,410,130),line(410,130,400,110),line(510,180,490,130),line(490,130,500,110).
hint(4,7) :- pen(20, rgb(255, 255, 0)), ellipse(435, 165, 465, 215).
hint(5,7).


hint(1,8) :- pen(100, rgb(92, 0, 153)), ellipse(350, 50, 550, 250).
hint(2,8) :- pen(100, rgb(184, 77, 255)), ellipse(360, 60, 540, 240), pen(100, rgb(92, 0, 153)), ellipse(370, 70, 530, 230).
hint(3,8) :- pen(100, rgb(184, 77, 255)), ellipse(380, 80, 520, 220), pen(100, rgb(92, 0, 153)), ellipse(390, 90, 510, 210).
hint(4,8) :- pen(8, rgb(184, 77, 255)), line(450,40,450,260), line(340,150,560,150).
hint(5,8).


hint(1,9) :- pen(100, rgb(220, 0, 0)), ellipse(350, 50, 550, 250).
hint(2,9) :- pen(100, rgb(0, 0, 0)), ellipse(370, 70, 530, 230).
hint(3,9) :- pen(10, rgb(220, 0, 0)), line(390,90,510,90), line(390,210,510,210), line(510,90,390,210), line(390,90,510,210).
hint(4,9) :- pen(30, rgb(220, 0, 0)), line(415,100,450,130), line(485,100,450,130), line(415,100,485,100), line(415,200,450,170), line(485,200,450,170), line(415,200,485,200) .
hint(5,9).


hint(1,10) :- pen(100, rgb(204, 153, 0)), ellipse(350, 50, 550, 250).
hint(2,10) :- pen(100, rgb(45, 134, 45)), ellipse(360, 60, 540, 240).
hint(3,10) :- pen(50, rgb(240, 164, 51)), ellipse(400,90,500,220), pen(30, rgb(45, 134, 45)), ellipse(420, 150, 480, 221), ellipse(410, 140, 450, 180), ellipse(450, 140, 490, 180), pen(20, rgb(45, 134, 45)),line(430,150,470,150) .
hint(4,10) :- pen(15, rgb(240, 164, 51)), line(420,130,405,75), line(410,140,405,75), line(405,75,425,65), line(480,130,495,75), line(490,140,495,75), line(495,75,475,65).
hint(5,10).


hint(1,11) :- pen(11, rgb(0, 0, 0)), ellipse(350, 50, 550, 250).
hint(2,11) :- pen(100, rgb(99, 56, 25)), ellipse(360, 60, 540, 240).
hint(3,11) :- pen(30, rgb(0, 0, 0)), ellipse(455,110,495,150), pen(5, rgb(0, 0, 0)), ellipse(405,110,445,150), pen(8, rgb(157, 102, 63)), ellipse(415,125,435,135), pen(2, rgb(0, 0, 0)), ellipse(423,128,427,132), pen(7, rgb(0, 0, 0)), line(435,190,465,190).
hint(4,11) :- pen(10, rgb(0, 0, 0)), line(470,130,405,72), line(480,135,540,150).
hint(5,11).


hint(1,12) :- pen(100, rgb(216, 17, 3)), ellipse(360, 60, 540, 240).
hint(2,12) :- pen(6, rgb(225, 215, 126)), ellipse(385, 70, 515, 160),pen(100, rgb(216, 17, 3)), ellipse(390, 75, 510, 155).
hint(3,12) :- pen(30, rgb(225, 215, 126)), ellipse(435, 130, 465, 170), line(457,155,472,150),line(457,145,472,150), line(443,155,428,150),line(443,145,428,150).
hint(4,12) :- pen(15, rgb(79, 223, 26)), ellipse(435, 135, 465, 165).
hint(5,12).



hint(1,13) :- pen(100, rgb(139, 140, 139)), ellipse(350, 50, 550, 250).
hint(2,13) :- pen(100, rgb(247, 162, 119)), ellipse(390, 70, 510, 230).
hint(3,13) :- pen(100, rgb(232, 222, 221)), ellipse(381, 60, 519, 195), pen(100, rgb(247, 162, 119)), ellipse(390, 75, 510, 230), ellipse(500,130 , 515, 165), ellipse(385,130 , 400, 165).
hint(4,13) :- pen(30, rgb(142, 69, 55)), ellipse(405,130,445,160), ellipse(455,130,495,160), pen(2, rgb(142, 69, 55)),line(430,140,470,140),line(490,140,510,130),line(410,140,390,130),pen(15, rgb(232, 222, 221)),line(435,180,465,180).
hint(5,13).





hanged :- 
  G_Masked_Word := G_Word, display_masked, 
  G_Masked_Word := "", 
  message("Shame!", "-----------------------------------------------------------\n| You don't deserve to be called a Marvel fan! |\n-----------------------------------------------------------", !). 

win :- message("WIN!", "You win :)\nTry again to improve your skills!", i).

information_m :- message("Information", " All letters are lowercase!\n\nSpecies are also included!\n\n         Good luck! :)", !).

help_m :- message("Hint", "       You will receive a hint for each mistake.\nYou are entitled to 4 hints. Then the game ends.\n\n                            Good luck! :)", i).


word(0, "iron man").
word(1, "spiderman").
word(2, "hulk").
word(3, "captain america").
word(4, "thor").
word(5, "scarlet witch").
word(6, "thanos").
word(7, "vision").
word(8, "hawkeye").
word(9, "black widow").
word(10, "loki").
word(11, "nick fury").
word(12, "doctor strange").
word(13, "stan lee").
