/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Feb 29 15:16:21 2024
/////////////////////////////////////////////////////////////


module mult_pipeline_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  ADDF_C U1_6 ( .A(A[6]), .B(B[6]), .CIN(carry[6]), .COUT(carry[7]), .SUM(
        SUM[6]) );
  ADDF_C U1_5 ( .A(A[5]), .B(B[5]), .CIN(carry[5]), .COUT(carry[6]), .SUM(
        SUM[5]) );
  ADDF_C U1_4 ( .A(A[4]), .B(B[4]), .CIN(carry[4]), .COUT(carry[5]), .SUM(
        SUM[4]) );
  ADDF_C U1_3 ( .A(A[3]), .B(B[3]), .CIN(carry[3]), .COUT(carry[4]), .SUM(
        SUM[3]) );
  ADDF_C U1_2 ( .A(A[2]), .B(B[2]), .CIN(carry[2]), .COUT(carry[3]), .SUM(
        SUM[2]) );
  ADDF_B U1_1 ( .A(A[1]), .B(B[1]), .CIN(carry[1]), .COUT(carry[2]), .SUM(
        SUM[1]) );
  AND2_I U1 ( .A(A[0]), .B(B[0]), .Z(carry[1]) );
  XOR2_B U2 ( .A(A[0]), .B(B[0]), .Z(SUM[0]) );
  XOR2_C U3 ( .A(B[7]), .B(carry[7]), .Z(SUM[7]) );
endmodule


module mult_pipeline ( clk, rst_n, start, valid, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [7:0] c;
  input clk, rst_n, start;
  output valid;
  wire   n157, \state_next[0] , \result[0] , N32, N33, N34, N35, N36, N37, N38,
         N39, N40, N41, N42, N43, N44, N45, N46, n4, n5, n7, n16, n17, n19,
         n20, n21, n22, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, N63, N60, \mult_add_113_aco/PROD_not[0] ,
         \mult_add_113_aco/PROD_not[1] , \mult_add_113_aco/PROD_not[2] ,
         \mult_add_113_aco/PROD_not[3] , \mult_add_113_aco/PROD_not[4] ,
         \mult_add_113_aco/PROD_not[5] , \mult_add_113_aco/PROD_not[6] ,
         \mult_add_113_aco/PROD_not[7] , n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n74,
         n76, n78, n80, n82, n84, n86, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155;
  wire   [2:0] bit_counter_next;
  wire   [7:0] multiplicand;
  wire   [15:0] product;
  wire   [7:0] partial_product;

  NOR2_D U32 ( .A(n131), .B(n21), .Z(n5) );
  mult_pipeline_DW01_add_0 add_113_aco ( .A({1'b0, product[14:9], n71}), .B({
        n59, n89, n90, n91, N63, n93, n95, N60}), .CI(1'b0), .SUM(
        partial_product) );
  DFFR_E \product_reg[14]  ( .D(N46), .CLK(clk), .RN(n140), .Q(product[14]) );
  DFFR_E \product_reg[13]  ( .D(N45), .CLK(clk), .RN(n140), .Q(product[13]) );
  DFFR_E \product_reg[12]  ( .D(N44), .CLK(clk), .RN(n140), .Q(product[12]) );
  DFFR_E \multiplicand_reg[6]  ( .D(n36), .CLK(clk), .RN(n143), .Q(
        multiplicand[6]) );
  DFFR_E \result_reg[3]  ( .D(n104), .CLK(clk), .RN(n142), .Q(n48) );
  DFFR_E \result_reg[2]  ( .D(n109), .CLK(clk), .RN(n142), .Q(n50) );
  DFFR_E \result_reg[1]  ( .D(n108), .CLK(clk), .RN(n142), .Q(n49) );
  DFFR_E \result_reg[7]  ( .D(n106), .CLK(clk), .RN(n142), .QBAR(n29) );
  DFFR_E \result_reg[6]  ( .D(n105), .CLK(clk), .RN(n142), .QBAR(n28) );
  DFFR_E \result_reg[5]  ( .D(n103), .CLK(clk), .RN(n142), .QBAR(n27) );
  DFFR_E \result_reg[4]  ( .D(n102), .CLK(clk), .RN(n142), .QBAR(n26) );
  DFFR_E \product_reg[7]  ( .D(n66), .CLK(clk), .RN(n141), .Q(product[7]) );
  DFFR_E \product_reg[6]  ( .D(N38), .CLK(clk), .RN(n141), .Q(product[6]) );
  DFFR_E \product_reg[5]  ( .D(N37), .CLK(clk), .RN(n141), .Q(product[5]) );
  DFFR_E \product_reg[4]  ( .D(n63), .CLK(clk), .RN(n141), .Q(product[4]) );
  DFFR_E \result_reg[0]  ( .D(n107), .CLK(clk), .RN(n143), .Q(\result[0] ) );
  DFFR_E \product_reg[11]  ( .D(N43), .CLK(clk), .RN(n140), .Q(product[11]) );
  DFFR_E \product_reg[10]  ( .D(N42), .CLK(clk), .RN(n140), .Q(product[10]) );
  DFFR_E \product_reg[9]  ( .D(N41), .CLK(clk), .RN(n141), .Q(product[9]) );
  DFFR_E \multiplicand_reg[5]  ( .D(n35), .CLK(clk), .RN(n143), .Q(
        multiplicand[5]) );
  DFFR_E \multiplicand_reg[4]  ( .D(n34), .CLK(clk), .RN(n143), .Q(
        multiplicand[4]) );
  DFFR_E \multiplicand_reg[3]  ( .D(n33), .CLK(clk), .RN(n143), .QBAR(n43) );
  DFFR_E \product_reg[8]  ( .D(N40), .CLK(clk), .RN(n141), .QBAR(n54) );
  DFFR_E \multiplicand_reg[2]  ( .D(n32), .CLK(clk), .RN(n143), .Q(
        multiplicand[2]), .QBAR(n52) );
  DFFR_E \multiplicand_reg[1]  ( .D(n31), .CLK(clk), .RN(n143), .Q(
        multiplicand[1]) );
  DFFR_E \multiplicand_reg[0]  ( .D(n30), .CLK(clk), .RN(n143), .Q(
        multiplicand[0]) );
  DFFR_E \bit_counter_reg[2]  ( .D(bit_counter_next[2]), .CLK(clk), .RN(n140), 
        .QBAR(n20) );
  DFFR_E \bit_counter_reg[0]  ( .D(bit_counter_next[0]), .CLK(clk), .RN(n140), 
        .Q(n134), .QBAR(n21) );
  DFFR_E \product_reg[1]  ( .D(N33), .CLK(clk), .RN(n141), .Q(product[1]), 
        .QBAR(n132) );
  DFFR_E \bit_counter_reg[1]  ( .D(bit_counter_next[1]), .CLK(clk), .RN(n140), 
        .Q(n130), .QBAR(n22) );
  DFFR_E \state_current_reg[0]  ( .D(\state_next[0] ), .CLK(clk), .RN(n140), 
        .Q(n53), .QBAR(n128) );
  DFFR_E \product_reg[2]  ( .D(N34), .CLK(clk), .RN(n141), .Q(product[2]), 
        .QBAR(n126) );
  DFFR_E \product_reg[3]  ( .D(N35), .CLK(clk), .RN(n141), .Q(product[3]), 
        .QBAR(n124) );
  DFFR_E ready_reg ( .D(n149), .CLK(clk), .RN(n142), .Q(n157) );
  DFFR_E \multiplicand_reg[7]  ( .D(n37), .CLK(clk), .RN(n143), .Q(
        multiplicand[7]) );
  DFFR_E \product_reg[0]  ( .D(N32), .CLK(clk), .RN(n142), .Q(product[0]), 
        .QBAR(n39) );
  INVERT_H U57 ( .A(\mult_add_113_aco/PROD_not[3] ), .Z(N63) );
  INVERT_E U58 ( .A(n99), .Z(n97) );
  INVERT_I U59 ( .A(product[0]), .Z(n110) );
  AOI22_C U60 ( .A1(n155), .A2(n49), .B1(n115), .B2(product[1]), .Z(n40) );
  AOI22_C U61 ( .A1(n155), .A2(n48), .B1(n115), .B2(product[3]), .Z(n41) );
  AOI22_C U62 ( .A1(n155), .A2(n50), .B1(n117), .B2(product[2]), .Z(n42) );
  OA22_I U63 ( .A1(n115), .A2(n26), .B1(n155), .B2(n154), .Z(n44) );
  OA22_I U64 ( .A1(n114), .A2(n27), .B1(n155), .B2(n153), .Z(n45) );
  OA22_I U65 ( .A1(n114), .A2(n28), .B1(n155), .B2(n152), .Z(n46) );
  AOI22_C U66 ( .A1(\result[0] ), .A2(n155), .B1(n88), .B2(n117), .Z(n47) );
  OA22_I U67 ( .A1(n114), .A2(n29), .B1(n151), .B2(n155), .Z(n51) );
  INVERT_K U68 ( .A(n67), .Z(n68) );
  INVERT_E U69 ( .A(n94), .Z(n93) );
  INVERT_E U70 ( .A(n96), .Z(n95) );
  INVERT_E U71 ( .A(n92), .Z(n91) );
  INVERT_H U72 ( .A(n19), .Z(n120) );
  INVERT_E U73 ( .A(n60), .Z(n59) );
  INVERT_D U74 ( .A(n62), .Z(n90) );
  INVERT_D U75 ( .A(n61), .Z(n89) );
  INVERT_J U76 ( .A(n107), .Z(n82) );
  INVERT_I U77 ( .A(n47), .Z(n107) );
  INVERT_J U78 ( .A(n102), .Z(n72) );
  INVERT_I U79 ( .A(n44), .Z(n102) );
  INVERT_J U80 ( .A(n103), .Z(n74) );
  INVERT_I U81 ( .A(n45), .Z(n103) );
  INVERT_J U82 ( .A(n105), .Z(n78) );
  INVERT_I U83 ( .A(n46), .Z(n105) );
  INVERT_J U84 ( .A(n106), .Z(n80) );
  INVERT_I U85 ( .A(n51), .Z(n106) );
  INVERT_J U86 ( .A(n108), .Z(n84) );
  INVERT_I U87 ( .A(n40), .Z(n108) );
  INVERT_J U88 ( .A(n109), .Z(n86) );
  INVERT_I U89 ( .A(n42), .Z(n109) );
  INVERT_J U90 ( .A(n104), .Z(n76) );
  INVERT_I U91 ( .A(n41), .Z(n104) );
  INVERT_M U92 ( .A(n139), .Z(n136) );
  AO21_F U93 ( .A1(n22), .A2(n135), .B(n122), .Z(n17) );
  AO22_F U94 ( .A1(multiplicand[1]), .A2(n137), .B1(b[1]), .B2(n68), .Z(n31)
         );
  INVERT_C U95 ( .A(n55), .Z(n32) );
  INVERT_H U96 ( .A(b[2]), .Z(n56) );
  NOR2_C U97 ( .A(n53), .B(n56), .Z(n57) );
  NOR2_C U98 ( .A(n69), .B(n52), .Z(n58) );
  NOR2_C U99 ( .A(n57), .B(n58), .Z(n55) );
  AND2_H U100 ( .A(n88), .B(multiplicand[7]), .Z(
        \mult_add_113_aco/PROD_not[7] ) );
  INVERT_D U101 ( .A(\mult_add_113_aco/PROD_not[7] ), .Z(n60) );
  AND2_H U102 ( .A(multiplicand[6]), .B(n111), .Z(
        \mult_add_113_aco/PROD_not[6] ) );
  INVERT_D U103 ( .A(\mult_add_113_aco/PROD_not[6] ), .Z(n61) );
  AND2_H U104 ( .A(multiplicand[5]), .B(n88), .Z(
        \mult_add_113_aco/PROD_not[5] ) );
  INVERT_D U105 ( .A(\mult_add_113_aco/PROD_not[5] ), .Z(n62) );
  OA21_F U106 ( .A1(n69), .A2(n153), .B(n19), .Z(N36) );
  INVERT_C U107 ( .A(N36), .Z(n63) );
  OAI21_C U108 ( .A1(n69), .A2(n152), .B(n19), .Z(N37) );
  INVERT_C U109 ( .A(n64), .Z(N38) );
  NOR2_C U110 ( .A(n69), .B(n151), .Z(n65) );
  NOR2_C U111 ( .A(n65), .B(n120), .Z(n64) );
  NAND2_I U112 ( .A(a[3]), .B(n68), .Z(n19) );
  OA21_F U113 ( .A1(n148), .A2(n69), .B(n19), .Z(N39) );
  INVERT_C U114 ( .A(N39), .Z(n66) );
  NAND2BAL_E U115 ( .A(n122), .B(n150), .Z(n4) );
  INVERT_K U116 ( .A(n139), .Z(n67) );
  INVERT_M U117 ( .A(n67), .Z(n69) );
  INVERT_H U118 ( .A(n43), .Z(n70) );
  AO21_D U119 ( .A1(n70), .A2(n137), .B(n101), .Z(n33) );
  AO21_D U120 ( .A1(multiplicand[4]), .A2(n136), .B(n101), .Z(n34) );
  INVERT_K U121 ( .A(n100), .Z(n101) );
  AO21_E U122 ( .A1(multiplicand[5]), .A2(n137), .B(n101), .Z(n35) );
  AO21_F U123 ( .A1(multiplicand[6]), .A2(n137), .B(n101), .Z(n36) );
  AO21_E U124 ( .A1(multiplicand[7]), .A2(n136), .B(n101), .Z(n37) );
  AO22_F U125 ( .A1(n127), .A2(n137), .B1(a[1]), .B2(n69), .Z(N33) );
  AO22_F U126 ( .A1(n125), .A2(n136), .B1(a[2]), .B2(n69), .Z(N34) );
  AO22_F U127 ( .A1(start), .A2(n69), .B1(n137), .B2(n4), .Z(\state_next[0] )
         );
  INVERT_H U128 ( .A(n54), .Z(n71) );
  INVERT_O U129 ( .A(n72), .Z(c[4]) );
  INVERT_O U130 ( .A(n74), .Z(c[5]) );
  INVERT_O U131 ( .A(n76), .Z(c[3]) );
  INVERT_O U132 ( .A(n78), .Z(c[6]) );
  INVERT_O U133 ( .A(n80), .Z(c[7]) );
  INVERT_O U134 ( .A(n82), .Z(c[0]) );
  INVERT_O U135 ( .A(n84), .Z(c[1]) );
  INVERT_O U136 ( .A(n86), .Z(c[2]) );
  INVERT_I U137 ( .A(n39), .Z(n88) );
  INVERT_H U138 ( .A(n110), .Z(n111) );
  AND2_H U139 ( .A(multiplicand[4]), .B(n112), .Z(
        \mult_add_113_aco/PROD_not[4] ) );
  INVERT_D U140 ( .A(\mult_add_113_aco/PROD_not[4] ), .Z(n92) );
  NAND2_E U141 ( .A(n70), .B(n111), .Z(\mult_add_113_aco/PROD_not[3] ) );
  AND2_H U142 ( .A(multiplicand[2]), .B(n112), .Z(
        \mult_add_113_aco/PROD_not[2] ) );
  INVERT_D U143 ( .A(\mult_add_113_aco/PROD_not[2] ), .Z(n94) );
  AND2_H U144 ( .A(multiplicand[1]), .B(n112), .Z(
        \mult_add_113_aco/PROD_not[1] ) );
  INVERT_D U145 ( .A(\mult_add_113_aco/PROD_not[1] ), .Z(n96) );
  INVERT_E U146 ( .A(n97), .Z(n98) );
  AND2_H U147 ( .A(multiplicand[0]), .B(n112), .Z(
        \mult_add_113_aco/PROD_not[0] ) );
  INVERT_D U148 ( .A(\mult_add_113_aco/PROD_not[0] ), .Z(n99) );
  BUFFER_L U149 ( .A(n157), .Z(n138) );
  INVERT_K U150 ( .A(n113), .Z(n117) );
  INVERT_N U151 ( .A(n138), .Z(n113) );
  INVERT_H U152 ( .A(n7), .Z(n100) );
  AND2_I U153 ( .A(b[3]), .B(n139), .Z(n7) );
  INVERT_I U154 ( .A(n110), .Z(n112) );
  INVERT_N U155 ( .A(n117), .Z(n155) );
  INVERT_I U156 ( .A(n113), .Z(n114) );
  INVERT_I U157 ( .A(n113), .Z(n115) );
  INVERT_O U158 ( .A(n113), .Z(valid) );
  INVERT_F U159 ( .A(n98), .Z(N60) );
  AO22_F U160 ( .A1(multiplicand[0]), .A2(n136), .B1(b[0]), .B2(n68), .Z(n30)
         );
  AO22_F U161 ( .A1(n150), .A2(bit_counter_next[0]), .B1(n16), .B2(n136), .Z(
        bit_counter_next[2]) );
  AO22_F U162 ( .A1(n133), .A2(n137), .B1(a[0]), .B2(n68), .Z(N32) );
  NOR2_C U163 ( .A(n69), .B(n17), .Z(bit_counter_next[1]) );
  AND2_H U164 ( .A(partial_product[6]), .B(n137), .Z(N45) );
  AND2_H U165 ( .A(partial_product[5]), .B(n136), .Z(N44) );
  INVERT_C U166 ( .A(n118), .Z(N35) );
  NOR2_C U167 ( .A(n68), .B(n154), .Z(n119) );
  NOR2_C U168 ( .A(n119), .B(n120), .Z(n118) );
  AND2_H U169 ( .A(partial_product[4]), .B(n137), .Z(N43) );
  INVERT_H U170 ( .A(n5), .Z(n121) );
  INVERT_I U171 ( .A(n121), .Z(n122) );
  AO22_F U172 ( .A1(n123), .A2(n122), .B1(n22), .B2(n150), .Z(n16) );
  AND2_H U173 ( .A(partial_product[7]), .B(n136), .Z(N46) );
  INVERT_H U174 ( .A(n150), .Z(n123) );
  INVERT_J U175 ( .A(n20), .Z(n150) );
  INVERT_N U176 ( .A(n129), .Z(n139) );
  AND2_H U177 ( .A(partial_product[3]), .B(n136), .Z(N42) );
  AND2_H U178 ( .A(partial_product[2]), .B(n137), .Z(N41) );
  INVERT_H U179 ( .A(n124), .Z(n125) );
  AND2_J U180 ( .A(n135), .B(n137), .Z(bit_counter_next[0]) );
  INVERT_N U181 ( .A(n139), .Z(n137) );
  INVERT_H U182 ( .A(n126), .Z(n127) );
  INVERT_I U183 ( .A(n128), .Z(n129) );
  INVERT_H U184 ( .A(n130), .Z(n131) );
  AND2_H U185 ( .A(partial_product[1]), .B(n136), .Z(N40) );
  INVERT_H U186 ( .A(n132), .Z(n133) );
  INVERT_H U187 ( .A(n134), .Z(n135) );
  INVERT_C U188 ( .A(n4), .Z(n149) );
  INVERT_H U189 ( .A(product[7]), .Z(n151) );
  INVERT_H U190 ( .A(product[4]), .Z(n154) );
  INVERT_H U191 ( .A(product[5]), .Z(n153) );
  INVERT_H U192 ( .A(product[6]), .Z(n152) );
  INVERT_K U193 ( .A(n147), .Z(n146) );
  INVERT_H U194 ( .A(rst_n), .Z(n147) );
  INVERT_N U195 ( .A(n144), .Z(n143) );
  INVERT_N U196 ( .A(n144), .Z(n142) );
  INVERT_N U197 ( .A(n145), .Z(n141) );
  INVERT_N U198 ( .A(n145), .Z(n140) );
  INVERT_M U199 ( .A(n146), .Z(n144) );
  INVERT_M U200 ( .A(n146), .Z(n145) );
  INVERT_D U201 ( .A(partial_product[0]), .Z(n148) );
endmodule

