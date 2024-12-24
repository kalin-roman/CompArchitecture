/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module sbox_test();

  wire [ 3 : 0 ] t_r;   
  reg  [ 3 : 0 ] t_x;

  sbox t( .r( t_r ), .x( t_x ) );

  initial begin
        $dumpfile( "sbox_test.vcd" );
        $dumplimit( 10485760 );
        $dumpvars;

        $dumpon;

        if( !$value$plusargs( "x=%h", t_x ) ) begin
          $display( "warning: need an unsigned 4-bit hexadecimal value for x" );
          $display( "         e.g., +x=A"                                     );
        end

    #10 $display( ">[%0d] x=%h", 0, t_x );
        $display( "<[%0d] r=%h", 0, t_r );     

    #10 $dumpoff;
        $finish;
  end

endmodule
