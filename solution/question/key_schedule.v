/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module key_schedule( output wire [ 79 : 0 ] r,
                      input wire [ 79 : 0 ] x,
                      input wire [  4 : 0 ] i );

  // Stage 1: complete this module implementation
   wire [  3 : 0 ] box;
   wire [ 79 : 0 ] res;
   wire [  4 : 0 ] aX;
   
   assign res [ 79:0 ] = {x[ 18:0 ], x[ 79:19 ]};
   sbox t0( box, res[79:76]);

   assign aX = res[ 19:15 ] ^ i;

   assign r = {box, res[75:20], aX, res[14:0]};


endmodule