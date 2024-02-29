/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Feb 29 15:12:20 2024
/////////////////////////////////////////////////////////////


module mult_simple_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [3:0] A;
  input [3:0] B;
  output [7:0] PRODUCT;
  input TC;
  wire   \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][3] , \ab[1][2] ,
         \ab[1][1] , \ab[1][0] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] , \CARRYB[3][0] ,
         \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] , \CARRYB[1][2] ,
         \CARRYB[1][1] , \CARRYB[1][0] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[3][0] , \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][2] ,
         \SUMB[1][1] , ZA, ZB, \A1[4] , \A1[3] , \A1[2] , \A2[5] , \A2[4] ,
         \A2[3] , \A2[2] , \FS_1/A[5] , n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30;
  assign ZA = A[3];
  assign ZB = B[3];

  ADDF_F S14_3_0 ( .A(ZA), .B(ZB), .CIN(\SUMB[3][0] ), .COUT(\A2[2] ), .SUM(
        PRODUCT[3]) );
  ADDF_F S4_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CIN(\SUMB[2][1] ), .COUT(
        \CARRYB[3][0] ), .SUM(\SUMB[3][0] ) );
  ADDF_F S4_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CIN(\SUMB[2][2] ), .COUT(
        \CARRYB[3][1] ), .SUM(\SUMB[3][1] ) );
  ADDF_F S14_3 ( .A(n23), .B(n27), .CIN(\ab[3][3] ), .COUT(\CARRYB[3][3] ), 
        .SUM(\SUMB[3][3] ) );
  ADDF_F S2_2_1 ( .A(\ab[2][1] ), .B(\CARRYB[1][1] ), .CIN(\SUMB[1][2] ), 
        .COUT(\CARRYB[2][1] ), .SUM(\SUMB[2][1] ) );
  ADDF_B S3_2_2 ( .A(\ab[2][2] ), .B(n10), .CIN(\ab[1][3] ), .COUT(
        \CARRYB[2][2] ), .SUM(\SUMB[2][2] ) );
  ADDF_F S5_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CIN(\ab[2][3] ), .COUT(
        \CARRYB[3][2] ), .SUM(\SUMB[3][2] ) );
  ADDF_B S1_2_0 ( .A(\ab[2][0] ), .B(\CARRYB[1][0] ), .CIN(\SUMB[1][1] ), 
        .COUT(\CARRYB[2][0] ), .SUM(PRODUCT[2]) );
  INVERT_K U2 ( .A(ZB), .Z(n27) );
  INVERT_I U3 ( .A(B[2]), .Z(n28) );
  INVERT_H U4 ( .A(\A2[4] ), .Z(n11) );
  INVERT_I U5 ( .A(A[0]), .Z(n26) );
  NOR2_D U6 ( .A(n8), .B(n9), .Z(n7) );
  NAND2_E U7 ( .A(n12), .B(\A1[3] ), .Z(n14) );
  INVERT_H U8 ( .A(n14), .Z(n9) );
  INVERT_H U9 ( .A(\ab[0][1] ), .Z(n2) );
  INVERT_H U10 ( .A(n2), .Z(n3) );
  NOR2_D U11 ( .A(n29), .B(n26), .Z(\ab[0][1] ) );
  INVERT_H U12 ( .A(n19), .Z(n4) );
  INVERT_H U13 ( .A(n4), .Z(n5) );
  AND2_I U14 ( .A(n11), .B(\A1[4] ), .Z(n19) );
  AOI21_B U15 ( .A1(n6), .A2(n22), .B(n5), .Z(n21) );
  XOR2_B U16 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Z(\SUMB[1][1] ) );
  INVERT_F U17 ( .A(n7), .Z(n6) );
  NOR2_C U18 ( .A(n16), .B(n15), .Z(n8) );
  NOR2_F U19 ( .A(n12), .B(\A1[3] ), .Z(n16) );
  NAND2_H U20 ( .A(\A2[2] ), .B(\A1[2] ), .Z(n15) );
  XOR2_D U21 ( .A(\SUMB[3][2] ), .B(\CARRYB[3][1] ), .Z(\A1[3] ) );
  XNOR2_B U22 ( .A(\A2[5] ), .B(\FS_1/A[5] ), .Z(n20) );
  AND2_H U23 ( .A(\SUMB[3][3] ), .B(\CARRYB[3][2] ), .Z(\A2[5] ) );
  NOR2_D U24 ( .A(n24), .B(n30), .Z(\ab[2][0] ) );
  AND2_I U25 ( .A(\ab[1][0] ), .B(n3), .Z(\CARRYB[1][0] ) );
  NOR2_E U26 ( .A(n30), .B(n25), .Z(\ab[1][0] ) );
  NOR2_D U27 ( .A(B[1]), .B(n23), .Z(\ab[3][1] ) );
  XOR2_D U28 ( .A(\SUMB[3][3] ), .B(\CARRYB[3][2] ), .Z(\A1[4] ) );
  NOR2_D U29 ( .A(n24), .B(n29), .Z(\ab[2][1] ) );
  INVERT_I U30 ( .A(B[1]), .Z(n29) );
  AND2_I U31 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Z(\CARRYB[1][1] ) );
  NOR2_F U32 ( .A(n28), .B(n26), .Z(\ab[0][2] ) );
  NOR2_D U33 ( .A(n30), .B(n26), .Z(PRODUCT[0]) );
  INVERT_I U34 ( .A(B[0]), .Z(n30) );
  BUFFER_H U35 ( .A(\CARRYB[1][2] ), .Z(n10) );
  AND2_H U36 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Z(\CARRYB[1][2] ) );
  NOR2_C U37 ( .A(n24), .B(n28), .Z(\ab[2][2] ) );
  INVERT_I U38 ( .A(A[2]), .Z(n24) );
  NAND2BAL_E U39 ( .A(\SUMB[3][2] ), .B(\CARRYB[3][1] ), .Z(\A2[4] ) );
  XNOR2_B U40 ( .A(n15), .B(n13), .Z(PRODUCT[5]) );
  NOR2_D U41 ( .A(n9), .B(n16), .Z(n13) );
  NOR2_E U42 ( .A(n29), .B(n25), .Z(\ab[1][1] ) );
  INVERT_I U43 ( .A(A[1]), .Z(n25) );
  NAND2BAL_E U44 ( .A(\SUMB[3][1] ), .B(\CARRYB[3][0] ), .Z(\A2[3] ) );
  INVERT_I U45 ( .A(\A2[3] ), .Z(n12) );
  NOR2_C U46 ( .A(n5), .B(n18), .Z(n17) );
  NOR2_E U47 ( .A(n11), .B(\A1[4] ), .Z(n18) );
  XOR2_B U48 ( .A(n17), .B(n6), .Z(PRODUCT[6]) );
  XOR2_B U49 ( .A(n21), .B(n20), .Z(PRODUCT[7]) );
  OA21_F U50 ( .A1(\A2[2] ), .A2(\A1[2] ), .B(n15), .Z(PRODUCT[4]) );
  NOR2_D U51 ( .A(A[2]), .B(n27), .Z(\ab[2][3] ) );
  NOR2_D U52 ( .A(B[2]), .B(n23), .Z(\ab[3][2] ) );
  XOR2_B U53 ( .A(n3), .B(\ab[1][0] ), .Z(PRODUCT[1]) );
  NOR2_D U54 ( .A(n27), .B(n23), .Z(\ab[3][3] ) );
  INVERT_K U55 ( .A(ZA), .Z(n23) );
  NOR2_D U56 ( .A(B[0]), .B(n23), .Z(\ab[3][0] ) );
  NOR2_D U57 ( .A(A[1]), .B(n27), .Z(\ab[1][3] ) );
  NOR2_E U58 ( .A(n28), .B(n25), .Z(\ab[1][2] ) );
  NOR2_E U59 ( .A(A[0]), .B(n27), .Z(\ab[0][3] ) );
  XOR2_D U60 ( .A(\SUMB[3][1] ), .B(\CARRYB[3][0] ), .Z(\A1[2] ) );
  XOR2_C U61 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Z(\SUMB[1][2] ) );
  INVERT_D U62 ( .A(n18), .Z(n22) );
  INVERT_D U63 ( .A(\CARRYB[3][3] ), .Z(\FS_1/A[5] ) );
endmodule


module mult_simple ( clk, rst_n, a, b, c );
  input [3:0] a;
  input [3:0] b;
  output [7:0] c;
  input clk, rst_n;
  wire   n37, n38, n39, n40, n41, n42, n43, n44, N0, N1, N2, N3, N4, N5, N6,
         N7, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n22, n24, n26, n28, n30, n32, n34;

  mult_simple_DW02_mult_0 mult_18 ( .A({n16, n14, n12, n10}), .B({n8, n6, n4, 
        n2}), .TC(1'b1), .PRODUCT({N7, N6, N5, N4, N3, N2, N1, N0}) );
  DFFR_E \c_reg[1]  ( .D(N1), .CLK(clk), .RN(n19), .Q(n43) );
  DFFR_E \c_reg[6]  ( .D(N6), .CLK(clk), .RN(n19), .Q(n38) );
  DFFR_E \c_reg[0]  ( .D(N0), .CLK(clk), .RN(n19), .Q(n44) );
  DFFR_E \c_reg[3]  ( .D(N3), .CLK(clk), .RN(n19), .Q(n41) );
  DFFR_E \c_reg[4]  ( .D(N4), .CLK(clk), .RN(n18), .Q(n40) );
  DFFR_E \c_reg[5]  ( .D(N5), .CLK(clk), .RN(n18), .Q(n39) );
  DFFR_E \c_reg[7]  ( .D(N7), .CLK(clk), .RN(n18), .Q(n37) );
  DFFR_E \c_reg[2]  ( .D(N2), .CLK(clk), .RN(n18), .Q(n42) );
  INVERT_I U3 ( .A(n3), .Z(n4) );
  INVERT_H U4 ( .A(b[1]), .Z(n3) );
  INVERT_I U5 ( .A(n11), .Z(n12) );
  INVERT_H U6 ( .A(a[1]), .Z(n11) );
  INVERT_I U7 ( .A(n13), .Z(n14) );
  INVERT_H U8 ( .A(a[2]), .Z(n13) );
  INVERT_H U9 ( .A(a[0]), .Z(n9) );
  INVERT_I U10 ( .A(n1), .Z(n2) );
  INVERT_H U11 ( .A(b[0]), .Z(n1) );
  INVERT_H U12 ( .A(a[3]), .Z(n15) );
  INVERT_H U13 ( .A(b[3]), .Z(n7) );
  INVERT_H U14 ( .A(b[2]), .Z(n5) );
  INVERT_I U15 ( .A(n5), .Z(n6) );
  INVERT_I U16 ( .A(n7), .Z(n8) );
  INVERT_I U17 ( .A(n9), .Z(n10) );
  INVERT_I U18 ( .A(n15), .Z(n16) );
  INVERT_I U19 ( .A(rst_n), .Z(n17) );
  INVERT_J U20 ( .A(n17), .Z(n18) );
  INVERT_J U21 ( .A(n17), .Z(n19) );
  INVERT_J U22 ( .A(n42), .Z(n20) );
  INVERT_O U23 ( .A(n20), .Z(c[2]) );
  INVERT_J U24 ( .A(n37), .Z(n22) );
  INVERT_O U25 ( .A(n22), .Z(c[7]) );
  INVERT_J U26 ( .A(n39), .Z(n24) );
  INVERT_O U27 ( .A(n24), .Z(c[5]) );
  INVERT_J U28 ( .A(n40), .Z(n26) );
  INVERT_O U29 ( .A(n26), .Z(c[4]) );
  INVERT_J U30 ( .A(n41), .Z(n28) );
  INVERT_O U31 ( .A(n28), .Z(c[3]) );
  INVERT_J U32 ( .A(n44), .Z(n30) );
  INVERT_O U33 ( .A(n30), .Z(c[0]) );
  INVERT_J U34 ( .A(n38), .Z(n32) );
  INVERT_O U35 ( .A(n32), .Z(c[6]) );
  INVERT_J U36 ( .A(n43), .Z(n34) );
  INVERT_O U37 ( .A(n34), .Z(c[1]) );
endmodule

