/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

/* Modules that split x into n subwords, where r_i denotes the i-th subword for 
 * 0 <= i < n; the size of subwords, and thus the number and size of inputs and
 * outputs, depends on the module.
 */

module split_0( output wire [  3 : 0 ] r0,
                output wire [  3 : 0 ] r1,
                output wire [  3 : 0 ] r2,
                output wire [  3 : 0 ] r3,
                output wire [  3 : 0 ] r4,
                output wire [  3 : 0 ] r5,
                output wire [  3 : 0 ] r6,
                output wire [  3 : 0 ] r7,
		            output wire [  3 : 0 ] r8,
                output wire [  3 : 0 ] r9,
                output wire [  3 : 0 ] rA,
                output wire [  3 : 0 ] rB,
                output wire [  3 : 0 ] rC,
                output wire [  3 : 0 ] rD,
                output wire [  3 : 0 ] rE,
                output wire [  3 : 0 ] rF,
                 input wire [ 63 : 0 ]  x );

  assign { rF, rE, rD, rC, rB, rA, r9, r8,
           r7, r6, r5, r4, r3, r2, r1, r0 } = x;

endmodule

/* Modules that merge r from n subwords, where x_i denotes the i-th subword for 
 * 0 <= i < n; the size of subwords, and thus the number and size of inputs and
 * outputs, depends on the module.
 */

module merge_0( output wire [ 63 : 0 ]  r,
                 input wire [  3 : 0 ] x0,
                 input wire [  3 : 0 ] x1,
                 input wire [  3 : 0 ] x2,
                 input wire [  3 : 0 ] x3,
                 input wire [  3 : 0 ] x4,
                 input wire [  3 : 0 ] x5,
                 input wire [  3 : 0 ] x6,
                 input wire [  3 : 0 ] x7,
                 input wire [  3 : 0 ] x8,
                 input wire [  3 : 0 ] x9,
                 input wire [  3 : 0 ] xA,
                 input wire [  3 : 0 ] xB,
                 input wire [  3 : 0 ] xC,
                 input wire [  3 : 0 ] xD,
                 input wire [  3 : 0 ] xE,
                 input wire [  3 : 0 ] xF );

  assign r = { xF, xE, xD, xC, xB, xA, x9, x8,
               x7, x6, x5, x4, x3, x2, x1, x0 };

endmodule

/* A module that implements the PRESENT key addition operation: it combines
 * an 80-bit key k and state x using XOR, e.g., encapsulating the fact that 
 * only a subset of bits of k are actually used.
 */

module key_addition( output wire [ 63 : 0 ] r,
		      input wire [ 63 : 0 ] x,
		      input wire [ 79 : 0 ] k );

  assign r = x ^ k[ 79 : 16 ];
   
endmodule

/* A module that implements the PRESENT P-layer (or  permutation layer): it
 * will compute a 64-bit output r = f( x ) given a 64-bit input x, where f 
 * is the PRESENT (64-to-64)-bit permutation.
 */

module perm( output wire [ 63 : 0 ] r,
              input wire [ 63 : 0 ] x );

  assign r = { x[ 63 ], x[ 59 ], x[ 55 ], x[ 51 ], 
               x[ 47 ], x[ 43 ], x[ 39 ], x[ 35 ],
               x[ 31 ], x[ 27 ], x[ 23 ], x[ 19 ],
               x[ 15 ], x[ 11 ], x[  7 ], x[  3 ], 
               x[ 62 ], x[ 58 ], x[ 54 ], x[ 50 ], 
               x[ 46 ], x[ 42 ], x[ 38 ], x[ 34 ], 
               x[ 30 ], x[ 26 ], x[ 22 ], x[ 18 ], 
               x[ 14 ], x[ 10 ], x[  6 ], x[  2 ], 
               x[ 61 ], x[ 57 ], x[ 53 ], x[ 49 ], 
               x[ 45 ], x[ 41 ], x[ 37 ], x[ 33 ], 
               x[ 29 ], x[ 25 ], x[ 21 ], x[ 17 ], 
               x[ 13 ], x[  9 ], x[  5 ], x[  1 ], 
               x[ 60 ], x[ 56 ], x[ 52 ], x[ 48 ], 
               x[ 44 ], x[ 40 ], x[ 36 ], x[ 32 ], 
               x[ 28 ], x[ 24 ], x[ 20 ], x[ 16 ], 
               x[ 12 ], x[  8 ], x[  4 ], x[  0 ] };

endmodule
