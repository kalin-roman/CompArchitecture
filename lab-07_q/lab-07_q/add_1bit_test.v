/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */


module add_1bit_test();

  wire t_co;
  wire t_s;
  reg  t_ci;
  reg  t_x; 
  reg  t_y;

  add_1bit t( .co( t_co ), .s( t_s ), .x( t_x ), .y( t_y ), .ci( t_ci) );

  initial begin
        $dumpfile( "add_1bit_test.vcd" );
        $dumplimit( 10485760 );
        $dumpvars;

        $dumpon;

    #10 t_x = 1'b0; t_y = 1'b0; t_ci = 1'b0;
    #10 t_x = 1'b0; t_y = 1'b1; t_ci = 1'b0;
    #10 t_x = 1'b1; t_y = 1'b0; t_ci = 1'b0;
    #10 t_x = 1'b1; t_y = 1'b1; t_ci = 1'b0;
     
    #10 $dumpoff;
        $finish;
  end

endmodule
