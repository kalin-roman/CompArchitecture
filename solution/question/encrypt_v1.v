/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v1(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c );

  // Stage 2: complete this module implementation
  wire [`N_K - 1 : 0] keys   [ 0 : `N_R];
  wire [`N_B - 1 : 0] blocks [ 0 : `N_R];
  
  assign keys[0] = k;
  assign blocks[0] = m;

  genvar i;

  generate
    for( i = 1; i <= `N_R ; i++ ) begin:id 
      round round1 (blocks[i], blocks[i - 1], keys[i - 1]);
      key_schedule keyschedule1 ( keys[i],  keys[i - 1], i[4:0]);
    end
  endgenerate

  key_addition t5(c, blocks[`N_R], keys[`N_R]);
  
endmodule
