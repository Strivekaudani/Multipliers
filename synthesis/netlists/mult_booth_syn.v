/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Feb 27 22:28:02 2024
/////////////////////////////////////////////////////////////


module mult_booth_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [8:0] carry;

  ADDF_B U2_6 ( .A(A[6]), .B(n11), .CIN(carry[6]), .COUT(carry[7]), .SUM(
        DIFF[6]) );
  ADDF_B U2_5 ( .A(A[5]), .B(n10), .CIN(carry[5]), .COUT(carry[6]), .SUM(
        DIFF[5]) );
  ADDF_B U2_4 ( .A(A[4]), .B(n9), .CIN(carry[4]), .COUT(carry[5]), .SUM(
        DIFF[4]) );
  ADDF_B U2_3 ( .A(A[3]), .B(n8), .CIN(carry[3]), .COUT(carry[4]), .SUM(
        DIFF[3]) );
  ADDF_B U2_2 ( .A(A[2]), .B(n7), .CIN(carry[2]), .COUT(carry[3]), .SUM(
        DIFF[2]) );
  ADDF_B U2_1 ( .A(A[1]), .B(n6), .CIN(n2), .COUT(carry[2]), .SUM(DIFF[1]) );
  INVERT_H U1 ( .A(B[4]), .Z(n9) );
  INVERT_H U2 ( .A(B[5]), .Z(n10) );
  INVERT_H U3 ( .A(B[2]), .Z(n7) );
  INVERT_H U4 ( .A(B[3]), .Z(n8) );
  INVERT_H U5 ( .A(B[6]), .Z(n11) );
  INVERT_E U6 ( .A(B[1]), .Z(n6) );
  INVERT_D U7 ( .A(n3), .Z(n1) );
  INVERT_E U8 ( .A(n1), .Z(n2) );
  BUFFER_F U9 ( .A(carry[1]), .Z(n3) );
  OR2_H U10 ( .A(n5), .B(A[0]), .Z(carry[1]) );
  XNOR2_C U11 ( .A(A[0]), .B(n5), .Z(DIFF[0]) );
  INVERT_H U12 ( .A(B[0]), .Z(n5) );
  XOR2_C U13 ( .A(n4), .B(carry[7]), .Z(DIFF[7]) );
  INVERT_D U14 ( .A(B[7]), .Z(n4) );
endmodule


module mult_booth_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  ADDF_B U1_6 ( .A(A[6]), .B(B[6]), .CIN(carry[6]), .COUT(carry[7]), .SUM(
        SUM[6]) );
  ADDF_B U1_2 ( .A(A[2]), .B(B[2]), .CIN(carry[2]), .COUT(carry[3]), .SUM(
        SUM[2]) );
  ADDF_B U1_3 ( .A(A[3]), .B(B[3]), .CIN(carry[3]), .COUT(carry[4]), .SUM(
        SUM[3]) );
  ADDF_B U1_4 ( .A(A[4]), .B(B[4]), .CIN(carry[4]), .COUT(carry[5]), .SUM(
        SUM[4]) );
  ADDF_B U1_5 ( .A(A[5]), .B(B[5]), .CIN(carry[5]), .COUT(carry[6]), .SUM(
        SUM[5]) );
  ADDF_B U1_1 ( .A(A[1]), .B(B[1]), .CIN(carry[1]), .COUT(carry[2]), .SUM(
        SUM[1]) );
  XOR2_E U1 ( .A(B[7]), .B(carry[7]), .Z(SUM[7]) );
  AND2_I U2 ( .A(A[0]), .B(B[0]), .Z(carry[1]) );
  XOR2_B U3 ( .A(A[0]), .B(B[0]), .Z(SUM[0]) );
endmodule


module mult_booth ( clk, rst_n, start, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [7:0] c;
  input clk, rst_n, start;
  wire   n288, n289, n290, n291, n292, n293, n294, n295, N27, N28, N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, n6, n7,
         n12, n13, n14, n15, n16, n17, n18, n23, n28, n29, n31, n34, n37, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n61, n62, n63, n64, n66, n68, n69, n70,
         n71, n73, n74, n75, n76, n77, n78, n80, n81, n82, n83, n84, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n179,
         n181, n183, n185, n187, n189, n191, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287;
  wire   [15:0] product_next;
  wire   [16:0] product_current;
  wire   [7:0] multiplicand;

  NAND2_D U12 ( .A(n270), .B(n199), .Z(n15) );
  NOR2_D U26 ( .A(n287), .B(n131), .Z(n28) );
  AO21_E U75 ( .A1(n212), .A2(n197), .B(n244), .Z(n42) );
  mult_booth_DW01_sub_0 sub_83 ( .A({1'b0, n268, n250, n266, n248, n264, n252, 
        product_current[9]}), .B({multiplicand[7:3], n242, multiplicand[1:0]}), 
        .CI(1'b0), .DIFF({N42, N41, N40, N39, N38, N37, N36, N35}) );
  mult_booth_DW01_add_0 add_76 ( .A({1'b0, product_current[15:10], n270}), .B(
        {multiplicand[7], n229, n228, n227, n226, n242, n233, n246}), .CI(1'b0), .SUM({N34, N33, N32, N31, N30, N29, N28, N27}) );
  DFFR_E \control_bits_reg[1]  ( .D(n173), .CLK(clk), .RN(n279), .QBAR(n54) );
  DFFR_E \product_current_reg[0]  ( .D(product_next[0]), .CLK(clk), .RN(n279), 
        .QBAR(n44) );
  DFFR_E \product_current_reg[1]  ( .D(n173), .CLK(clk), .RN(n279), .Q(
        product_current[1]), .QBAR(n259) );
  DFFR_E \product_current_reg[4]  ( .D(n78), .CLK(clk), .RN(n274), .Q(
        product_current[4]), .QBAR(n258) );
  DFFR_E \multiplicand_reg[7]  ( .D(n96), .CLK(clk), .RN(n271), .Q(
        multiplicand[7]), .QBAR(n59) );
  DFFR_E \product_current_reg[9]  ( .D(n87), .CLK(clk), .RN(n272), .Q(
        product_current[9]), .QBAR(n269) );
  DFFR_E \product_current_reg[15]  ( .D(n71), .CLK(clk), .RN(n275), .Q(
        product_current[15]), .QBAR(n267) );
  DFFR_E \product_current_reg[13]  ( .D(n69), .CLK(clk), .RN(n276), .Q(
        product_current[13]), .QBAR(n265) );
  DFFR_E \product_current_reg[11]  ( .D(n107), .CLK(clk), .RN(n275), .Q(
        product_current[11]), .QBAR(n263) );
  DFFR_E \bit_count_current_reg[2]  ( .D(n160), .CLK(clk), .RN(n274), .Q(n261), 
        .QBAR(n62) );
  DFFR_E \product_current_reg[2]  ( .D(n74), .CLK(clk), .RN(n275), .Q(
        product_current[2]), .QBAR(n260) );
  DFFR_E \product_current_reg[5]  ( .D(n80), .CLK(clk), .RN(n273), .Q(
        product_current[5]), .QBAR(n257) );
  DFFR_E \product_current_reg[6]  ( .D(n82), .CLK(clk), .RN(n273), .Q(
        product_current[6]), .QBAR(n256) );
  DFFR_E \product_current_reg[7]  ( .D(n84), .CLK(clk), .RN(n273), .Q(
        product_current[7]), .QBAR(n255) );
  DFFR_E state_current_reg ( .D(n98), .CLK(clk), .RN(n272), .QBAR(n64) );
  DFFR_E \product_current_reg[10]  ( .D(n147), .CLK(clk), .RN(n272), .Q(
        product_current[10]), .QBAR(n251) );
  DFFR_E \product_current_reg[14]  ( .D(n70), .CLK(clk), .RN(n275), .Q(
        product_current[14]), .QBAR(n249) );
  DFFR_E \product_current_reg[12]  ( .D(n68), .CLK(clk), .RN(n276), .Q(
        product_current[12]), .QBAR(n247) );
  DFFR_E \multiplicand_reg[0]  ( .D(n95), .CLK(clk), .RN(n279), .Q(
        multiplicand[0]), .QBAR(n245) );
  DFFR_E \bit_count_current_reg[1]  ( .D(n158), .CLK(clk), .RN(n275), .Q(n243), 
        .QBAR(n61) );
  DFFR_E \multiplicand_reg[2]  ( .D(n93), .CLK(clk), .RN(n271), .Q(
        multiplicand[2]), .QBAR(n241) );
  DFFR_E \product_current_reg[8]  ( .D(n111), .CLK(clk), .RN(n272), .Q(
        product_current[8]), .QBAR(n240) );
  DFFR_E \product_current_reg[3]  ( .D(n76), .CLK(clk), .RN(n274), .Q(
        product_current[3]), .QBAR(n239) );
  DFFR_E \control_bits_reg[0]  ( .D(product_next[0]), .CLK(clk), .RN(n279), 
        .Q(n234), .QBAR(n53) );
  DFFR_E \multiplicand_reg[1]  ( .D(n94), .CLK(clk), .RN(n271), .Q(
        multiplicand[1]), .QBAR(n232) );
  DFFR_E \multiplicand_reg[6]  ( .D(n89), .CLK(clk), .RN(n272), .Q(
        multiplicand[6]), .QBAR(n55) );
  DFFR_E \multiplicand_reg[5]  ( .D(n90), .CLK(clk), .RN(n271), .Q(
        multiplicand[5]), .QBAR(n56) );
  DFFR_E \multiplicand_reg[4]  ( .D(n91), .CLK(clk), .RN(n271), .Q(
        multiplicand[4]), .QBAR(n57) );
  DFFR_E \multiplicand_reg[3]  ( .D(n151), .CLK(clk), .RN(n271), .Q(
        multiplicand[3]), .QBAR(n58) );
  DFFR_E \bit_count_current_reg[0]  ( .D(n159), .CLK(clk), .RN(n273), .QBAR(
        n63) );
  DFFR_E \c_reg[7]  ( .D(n104), .CLK(clk), .RN(n272), .Q(n288), .QBAR(n52) );
  DFFR_E \c_reg[6]  ( .D(n83), .CLK(clk), .RN(n273), .Q(n289), .QBAR(n51) );
  DFFR_E \c_reg[5]  ( .D(n81), .CLK(clk), .RN(n273), .Q(n290), .QBAR(n50) );
  DFFR_E \c_reg[4]  ( .D(n103), .CLK(clk), .RN(n274), .Q(n291), .QBAR(n49) );
  DFFR_E \c_reg[3]  ( .D(n77), .CLK(clk), .RN(n274), .Q(n292), .QBAR(n48) );
  DFFR_E \c_reg[2]  ( .D(n75), .CLK(clk), .RN(n274), .Q(n293), .QBAR(n47) );
  DFFR_E \c_reg[1]  ( .D(n73), .CLK(clk), .RN(n275), .Q(n294), .QBAR(n46) );
  DFFR_E \c_reg[0]  ( .D(n102), .CLK(clk), .RN(n276), .Q(n295), .QBAR(n45) );
  DFFS_H \bit_count_current_reg[3]  ( .D(n66), .CLK(clk), .S(n280), .Q(n110)
         );
  INVERT_D U83 ( .A(n163), .Z(n161) );
  NAND2_E U84 ( .A(n286), .B(n287), .Z(n34) );
  INVERT_D U85 ( .A(n114), .Z(n115) );
  INVERT_K U86 ( .A(n196), .Z(n197) );
  INVERT_H U87 ( .A(n63), .Z(n196) );
  INVERT_I U88 ( .A(n176), .Z(n286) );
  INVERT_J U89 ( .A(n16), .Z(n282) );
  INVERT_I U90 ( .A(n7), .Z(n224) );
  AO222_F U91 ( .A1(product_current[3]), .A2(n212), .B1(b[1]), .B2(n175), .C1(
        product_current[2]), .C2(n131), .Z(n74) );
  INVERT_H U92 ( .A(n209), .Z(n204) );
  INVERT_D U93 ( .A(n210), .Z(n166) );
  AND2_H U94 ( .A(n216), .B(n217), .Z(n101) );
  BUFFER_I U95 ( .A(n13), .Z(n193) );
  INVERT_H U96 ( .A(n225), .Z(n130) );
  INVERT_M U97 ( .A(n224), .Z(n225) );
  NAND3_D U98 ( .A(n287), .B(n284), .C(n235), .Z(n12) );
  OAI22_B U99 ( .A1(n45), .A2(n127), .B1(n126), .B2(n129), .Z(n102) );
  OAI22_B U100 ( .A1(n49), .A2(n127), .B1(n257), .B2(n129), .Z(n103) );
  OAI22_B U101 ( .A1(n52), .A2(n127), .B1(n240), .B2(n129), .Z(n104) );
  AO21_F U102 ( .A1(product_current[6]), .A2(n287), .B(n282), .Z(n105) );
  AO21_F U103 ( .A1(product_current[8]), .A2(n287), .B(n282), .Z(n106) );
  OR2_H U104 ( .A(n143), .B(n144), .Z(n107) );
  AO21_F U105 ( .A1(product_current[5]), .A2(n287), .B(n282), .Z(n108) );
  INVERT_D U106 ( .A(n220), .Z(n167) );
  AO21_F U107 ( .A1(product_current[7]), .A2(n287), .B(n282), .Z(n23) );
  AND2_H U108 ( .A(n237), .B(n238), .Z(n109) );
  OR2_H U109 ( .A(n119), .B(n120), .Z(n111) );
  INVERT_L U110 ( .A(n132), .Z(n133) );
  INVERT_N U111 ( .A(n280), .Z(n279) );
  INVERT_H U112 ( .A(start), .Z(n112) );
  INVERT_K U113 ( .A(n112), .Z(n113) );
  NAND2BAL_E U114 ( .A(n208), .B(n207), .Z(n210) );
  BUFFER_F U115 ( .A(n15), .Z(n114) );
  INVERT_E U116 ( .A(n148), .Z(n116) );
  INVERT_D U117 ( .A(n170), .Z(n117) );
  INVERT_F U118 ( .A(n16), .Z(n118) );
  NOR2_C U119 ( .A(n115), .B(n116), .Z(n121) );
  INVERT_E U120 ( .A(n121), .Z(n119) );
  NOR2_C U121 ( .A(n117), .B(n118), .Z(n122) );
  INVERT_E U122 ( .A(n122), .Z(n120) );
  BUFFER_F U123 ( .A(n18), .Z(n170) );
  NAND2_H U124 ( .A(b[3]), .B(n175), .Z(n16) );
  INVERT_H U125 ( .A(n256), .Z(n123) );
  INVERT_H U126 ( .A(n123), .Z(n124) );
  OAI22_B U127 ( .A1(n50), .A2(n127), .B1(n124), .B2(n129), .Z(n81) );
  INVERT_N U128 ( .A(n128), .Z(n129) );
  INVERT_H U129 ( .A(n259), .Z(n125) );
  INVERT_H U130 ( .A(n125), .Z(n126) );
  AO2222_F U131 ( .A1(n270), .A2(n131), .B1(N36), .B2(n149), .C1(N28), .C2(
        n169), .D1(n252), .D2(n199), .Z(n87) );
  OAI22_B U132 ( .A1(n46), .A2(n127), .B1(n260), .B2(n129), .Z(n73) );
  INVERT_M U133 ( .A(n129), .Z(n127) );
  OAI22_B U134 ( .A1(n47), .A2(n127), .B1(n239), .B2(n129), .Z(n75) );
  INVERT_I U135 ( .A(n34), .Z(n128) );
  OAI22_B U136 ( .A1(n51), .A2(n127), .B1(n255), .B2(n129), .Z(n83) );
  INVERT_K U137 ( .A(n130), .Z(n131) );
  INVERT_I U138 ( .A(n200), .Z(n132) );
  INVERT_H U139 ( .A(n12), .Z(n200) );
  AO2222_F U140 ( .A1(n250), .A2(n225), .B1(N41), .B2(n133), .C1(N33), .C2(
        n169), .D1(n268), .D2(n199), .Z(n70) );
  INVERT_F U141 ( .A(n199), .Z(n134) );
  INVERT_H U142 ( .A(n248), .Z(n135) );
  INVERT_H U143 ( .A(N30), .Z(n136) );
  INVERT_H U144 ( .A(N38), .Z(n137) );
  INVERT_H U145 ( .A(n264), .Z(n138) );
  NOR2_C U146 ( .A(n134), .B(n135), .Z(n139) );
  NOR2_C U147 ( .A(n168), .B(n136), .Z(n140) );
  NOR2_C U148 ( .A(n132), .B(n137), .Z(n141) );
  NOR2_C U149 ( .A(n281), .B(n138), .Z(n142) );
  NOR2_C U150 ( .A(n139), .B(n140), .Z(n145) );
  INVERT_E U151 ( .A(n145), .Z(n143) );
  NOR2_C U152 ( .A(n141), .B(n142), .Z(n146) );
  INVERT_E U153 ( .A(n146), .Z(n144) );
  INVERT_L U154 ( .A(n198), .Z(n199) );
  AOI2222_H U155 ( .A1(n252), .A2(n225), .B1(N37), .B2(n133), .C1(N29), .C2(
        n169), .D1(n264), .D2(n199), .Z(n88) );
  INVERT_C U156 ( .A(n88), .Z(n147) );
  NAND2_E U157 ( .A(N39), .B(n133), .Z(n218) );
  NAND2BAL_E U158 ( .A(N40), .B(n133), .Z(n207) );
  NAND2_D U159 ( .A(n129), .B(n37), .Z(n66) );
  AO21_E U160 ( .A1(n165), .A2(n285), .B(n171), .Z(n37) );
  NOR2_D U161 ( .A(n254), .B(n126), .Z(n215) );
  AND2_H U162 ( .A(N27), .B(n169), .Z(n17) );
  INVERT_D U163 ( .A(n17), .Z(n148) );
  INVERT_D U164 ( .A(n58), .Z(n226) );
  BUFFER_J U165 ( .A(n133), .Z(n149) );
  NAND2_E U166 ( .A(N42), .B(n149), .Z(n236) );
  AOI22_B U167 ( .A1(N35), .A2(n133), .B1(product_current[8]), .B2(n131), .Z(
        n18) );
  INVERT_H U168 ( .A(n23), .Z(n150) );
  NAND2BAL_E U169 ( .A(n162), .B(n206), .Z(n209) );
  OA21_F U170 ( .A1(n58), .A2(n283), .B(n31), .Z(n92) );
  INVERT_C U171 ( .A(n92), .Z(n151) );
  INVERT_C U172 ( .A(n152), .Z(n78) );
  NOR2_C U173 ( .A(n281), .B(n258), .Z(n153) );
  NOR2_C U174 ( .A(n153), .B(n108), .Z(n152) );
  INVERT_C U175 ( .A(n154), .Z(n80) );
  NOR2_C U176 ( .A(n281), .B(n257), .Z(n155) );
  NOR2_C U177 ( .A(n155), .B(n105), .Z(n154) );
  OAI21_C U178 ( .A1(n281), .A2(n124), .B(n150), .Z(n82) );
  INVERT_C U179 ( .A(n156), .Z(n84) );
  NOR2_C U180 ( .A(n281), .B(n255), .Z(n157) );
  NOR2_C U181 ( .A(n157), .B(n106), .Z(n156) );
  INVERT_K U182 ( .A(n225), .Z(n281) );
  OA21_F U183 ( .A1(n286), .A2(n41), .B(n42), .Z(n97) );
  INVERT_C U184 ( .A(n97), .Z(n158) );
  OA21_F U185 ( .A1(n197), .A2(n212), .B(n43), .Z(n100) );
  INVERT_C U186 ( .A(n100), .Z(n159) );
  OA21_F U187 ( .A1(n262), .A2(n285), .B(n39), .Z(n99) );
  INVERT_C U188 ( .A(n99), .Z(n160) );
  NAND2BAL_E U189 ( .A(n218), .B(n219), .Z(n220) );
  NAND2_E U190 ( .A(n248), .B(n131), .Z(n219) );
  INVERT_E U191 ( .A(n161), .Z(n162) );
  BUFFER_F U192 ( .A(n205), .Z(n163) );
  OAI22_B U193 ( .A1(n48), .A2(n127), .B1(n258), .B2(n129), .Z(n77) );
  XOR2_C U194 ( .A(n53), .B(n284), .Z(n29) );
  INVERT_H U195 ( .A(n62), .Z(n164) );
  INVERT_H U196 ( .A(n164), .Z(n165) );
  NAND2BAL_E U197 ( .A(N32), .B(n169), .Z(n206) );
  NAND2BAL_E U198 ( .A(N31), .B(n169), .Z(n217) );
  AO222_F U199 ( .A1(product_current[4]), .A2(n212), .B1(b[2]), .B2(n175), 
        .C1(product_current[3]), .C2(n131), .Z(n76) );
  INVERT_I U200 ( .A(n193), .Z(n168) );
  INVERT_M U201 ( .A(n168), .Z(n169) );
  NAND3_C U202 ( .A(n262), .B(n176), .C(n285), .Z(n39) );
  NAND2_D U203 ( .A(n250), .B(n199), .Z(n205) );
  NAND2BAL_E U204 ( .A(n266), .B(n199), .Z(n216) );
  NAND2_D U205 ( .A(n236), .B(n109), .Z(n71) );
  NAND2_E U206 ( .A(N34), .B(n169), .Z(n238) );
  NAND2BAL_E U207 ( .A(n268), .B(n225), .Z(n237) );
  INVERT_H U208 ( .A(n110), .Z(n171) );
  INVERT_E U209 ( .A(product_next[1]), .Z(n172) );
  INVERT_H U210 ( .A(n172), .Z(n173) );
  CLKI_O U211 ( .A(n41), .Z(n285) );
  NAND3_E U212 ( .A(n197), .B(n287), .C(n244), .Z(n41) );
  INVERT_H U213 ( .A(n28), .Z(n174) );
  INVERT_I U214 ( .A(n174), .Z(n175) );
  AND4_I U215 ( .A(n171), .B(n61), .C(n165), .D(n197), .Z(n40) );
  INVERTBAL_J U216 ( .A(n40), .Z(n176) );
  NAND3_C U217 ( .A(n176), .B(n212), .C(n197), .Z(n43) );
  INVERT_J U218 ( .A(n295), .Z(n177) );
  INVERT_O U219 ( .A(n177), .Z(c[0]) );
  INVERT_J U220 ( .A(n294), .Z(n179) );
  INVERT_O U221 ( .A(n179), .Z(c[1]) );
  INVERT_J U222 ( .A(n293), .Z(n181) );
  INVERT_O U223 ( .A(n181), .Z(c[2]) );
  INVERT_J U224 ( .A(n292), .Z(n183) );
  INVERT_O U225 ( .A(n183), .Z(c[3]) );
  INVERT_J U226 ( .A(n291), .Z(n185) );
  INVERT_O U227 ( .A(n185), .Z(c[4]) );
  INVERT_J U228 ( .A(n290), .Z(n187) );
  INVERT_O U229 ( .A(n187), .Z(c[5]) );
  INVERT_J U230 ( .A(n289), .Z(n189) );
  INVERT_O U231 ( .A(n189), .Z(c[6]) );
  INVERT_J U232 ( .A(n288), .Z(n191) );
  INVERT_O U233 ( .A(n191), .Z(c[7]) );
  NOR2_D U234 ( .A(n284), .B(n194), .Z(n13) );
  NOR2_D U235 ( .A(n254), .B(n235), .Z(n195) );
  INVERT_E U236 ( .A(n195), .Z(n194) );
  INVERT_H U237 ( .A(n234), .Z(n235) );
  INVERT_I U238 ( .A(n54), .Z(n284) );
  INVERT_H U239 ( .A(n14), .Z(n198) );
  AND2_I U240 ( .A(n29), .B(n287), .Z(n14) );
  INVERT_C U241 ( .A(n201), .Z(n96) );
  NOR2_C U242 ( .A(n59), .B(n283), .Z(n202) );
  INVERT_D U243 ( .A(n31), .Z(n203) );
  NOR2_C U244 ( .A(n202), .B(n203), .Z(n201) );
  AO22_F U245 ( .A1(n6), .A2(n246), .B1(a[0]), .B2(n283), .Z(n95) );
  NAND2_D U246 ( .A(n204), .B(n166), .Z(n69) );
  NAND2_E U247 ( .A(n266), .B(n225), .Z(n208) );
  NAND2BAL_E U248 ( .A(n6), .B(multiplicand[2]), .Z(n231) );
  INVERT_H U249 ( .A(n287), .Z(n211) );
  INVERT_K U250 ( .A(n211), .Z(n212) );
  INVERT_F U251 ( .A(n213), .Z(product_next[0]) );
  NOR2_D U252 ( .A(n281), .B(n44), .Z(n214) );
  NOR2_D U253 ( .A(n214), .B(n215), .Z(n213) );
  AO22_F U254 ( .A1(n6), .A2(multiplicand[1]), .B1(a[1]), .B2(n283), .Z(n94)
         );
  NAND2_D U255 ( .A(n101), .B(n167), .Z(n68) );
  INVERT_C U256 ( .A(n221), .Z(n98) );
  NOR2_C U257 ( .A(n254), .B(n286), .Z(n222) );
  INVERT_H U258 ( .A(n6), .Z(n223) );
  NOR2_C U259 ( .A(n222), .B(n223), .Z(n221) );
  NOR2_E U260 ( .A(n287), .B(n113), .Z(n7) );
  INVERT_E U261 ( .A(n57), .Z(n227) );
  INVERT_E U262 ( .A(n56), .Z(n228) );
  INVERT_E U263 ( .A(n55), .Z(n229) );
  NAND2_D U264 ( .A(n230), .B(n231), .Z(n93) );
  NAND2BAL_E U265 ( .A(a[2]), .B(n283), .Z(n230) );
  NAND2_K U266 ( .A(n113), .B(n254), .Z(n6) );
  INVERT_H U267 ( .A(n232), .Z(n233) );
  INVERT_H U268 ( .A(n241), .Z(n242) );
  INVERT_H U269 ( .A(n243), .Z(n244) );
  INVERT_I U270 ( .A(n245), .Z(n246) );
  INVERT_I U271 ( .A(n247), .Z(n248) );
  INVERT_I U272 ( .A(n249), .Z(n250) );
  INVERT_I U273 ( .A(n251), .Z(n252) );
  INVERT_I U274 ( .A(n64), .Z(n253) );
  INVERT_N U275 ( .A(n253), .Z(n254) );
  INVERT_O U276 ( .A(n254), .Z(n287) );
  NAND2BAL_J U277 ( .A(a[3]), .B(n283), .Z(n31) );
  INVERT_N U278 ( .A(n6), .Z(n283) );
  INVERT_H U279 ( .A(n261), .Z(n262) );
  INVERT_I U280 ( .A(n263), .Z(n264) );
  INVERT_I U281 ( .A(n265), .Z(n266) );
  INVERT_I U282 ( .A(n267), .Z(n268) );
  INVERT_I U283 ( .A(n269), .Z(n270) );
  INVERT_L U284 ( .A(n279), .Z(n278) );
  INVERT_K U285 ( .A(n279), .Z(n277) );
  INVERT_K U286 ( .A(n277), .Z(n275) );
  INVERT_K U287 ( .A(n277), .Z(n274) );
  INVERT_K U288 ( .A(n278), .Z(n273) );
  INVERT_K U289 ( .A(n278), .Z(n272) );
  INVERT_K U290 ( .A(n278), .Z(n271) );
  INVERT_I U291 ( .A(n277), .Z(n276) );
  OAI21_B U292 ( .A1(n55), .A2(n283), .B(n31), .Z(n89) );
  OAI21_B U293 ( .A1(n56), .A2(n283), .B(n31), .Z(n90) );
  OAI21_B U294 ( .A1(n57), .A2(n283), .B(n31), .Z(n91) );
  AO222_F U295 ( .A1(product_current[1]), .A2(n225), .B1(b[0]), .B2(n283), 
        .C1(n212), .C2(product_current[2]), .Z(product_next[1]) );
  INVERT_J U296 ( .A(rst_n), .Z(n280) );
endmodule

