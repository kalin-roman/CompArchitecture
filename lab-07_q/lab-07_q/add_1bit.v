/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module add_1bit( output wire co,
                 output wire s,

                  input wire ci,
                  input wire x,
                  input wire y );

  wire w0, w1, w2, w3;
  xor t0(w0, x, y);
  and t1(w1, x, y);

  xor t3(s, w0, ci);
  and t4(w3, ci, w0);

   or t5(co, w3, w1);

endmodule
