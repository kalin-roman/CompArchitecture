/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module round( output wire [ 63 : 0 ] r, 
               input wire [ 63 : 0 ] x, 
               input wire [ 79 : 0 ] k );

  // Stage 1: complete this module implementation
  wire [ 63 : 0 ] w0;
  wire [ 63 : 0 ] w1;
  wire [ 63 : 0 ] w2;

  key_addition t0(.r(w0), .x(x), .k(k));

  genvar i;

  generate
    for( i = 0; i < 64; i = i + 4 ) begin:id 
      sbox t1( w1 [ i + 3 : i ], w0[ i + 3 : i ]);
    end
  endgenerate

  perm t2(w2, w1);

  assign r = w2;

endmodule
