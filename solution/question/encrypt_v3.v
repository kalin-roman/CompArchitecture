/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v3(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c,

                    input wire                  clk );
  // Stage 4: complete this module implementation
  reg [ 4 : 0 ] ticks;
  reg [ 4 : 0 ] pipeline;
  reg [  `N_B - 1 : 0 ] res;

  reg [ `N_K - 1 : 0 ] k0 [ 0 : `N_V - 1];
  reg [ `N_B - 1 : 0 ] m0 [ 0 : `N_V - 1];

  wire [ `N_K - 1 : 0 ] k1 [ 0 : `N_V - 1];
  wire [ `N_B - 1 : 0 ] m1 [ 0 : `N_V - 1];
  wire [ `N_B - 1 : 0 ] c1 [ 0 : `N_V - 1];

  genvar i;
  generate
    for( i = 0; i < `N_V; i++) begin:id 
      round t0(m1[i],  m0[i],  k0[i]);
      key_schedule t1(k1[i],  k0[i], ticks - i[4:0]);
      key_addition t5(c1[i],  m0[i],  k0[i]); 
    end
  endgenerate

  assign c = res;

  initial begin
    ticks = 0;
    pipeline = 0;
  end

  always @(clk) begin
    if( pipeline < `N_V) begin
      m0 [pipeline] =  m;
      k0 [pipeline] =  k;
      pipeline = pipeline + 1;
    end   
    ticks = ticks + 1;
    #1 for(integer i = 0; i <= pipeline; i++) begin 
      m0[i] = m1[i];
      k0[i] = k1[i];
    end
    if (ticks + `N_R <= `N_R + `N_V) begin
      res = c1[ticks];
    end
  end
endmodule
