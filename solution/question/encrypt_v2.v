/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v2(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c,

                    input wire                  clk,
                    input wire                  req,
                   output wire                  ack );

  // Stage 3: complete this module implementation

  reg [ 4 : 0 ] idx;
  reg rAck;

  reg [ `N_B - 1 : 0 ] mOrg;
  reg [ `N_K - 1 : 0 ] kOrg;

  wire [ `N_B - 1 : 0 ] mNext;
  wire [ `N_K - 1 : 0 ] kNext;

  round t0(mNext, mOrg, kOrg);
  key_schedule t1(kNext, kOrg, idx);
  key_addition t5(c, mOrg, kOrg);

  assign ack = rAck;

  initial begin
    idx = 0;
    mOrg = 0;
    kOrg = 0; 
    rAck = 0;
  end

  always @(negedge req) begin
    rAck = 0;
  end

  always @(posedge req) begin
    idx = 1;
    mOrg = m;
    kOrg = k;
  end
    
  always @(posedge clk) begin
    if (req) begin
      idx <= idx + 5'b00001;
      mOrg = mNext;
      kOrg = kNext;
      if ( idx >= `N_R )begin
        rAck <= 1;
      end 
    end
  end

endmodule