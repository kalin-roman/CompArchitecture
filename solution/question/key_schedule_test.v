/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module key_schedule_test();

  wire [ 79 : 0 ] t_r;
  reg  [ 79 : 0 ] t_x;
  reg  [  4 : 0 ] t_i;

  key_schedule t( .r( t_r ), .x( t_x ), .i( t_i ) );

  initial begin
        $dumpfile( "key_schedule_test.vcd" );
        $dumplimit( 10485760 );
        $dumpvars;

        $dumpon;

        t_x = 80'hdc8770e93ea141e1fc67; t_i = 5'h01;

        if( !$value$plusargs( "x=%h", t_x ) ) begin
          $display( "warning: need an unsigned 80-bit hexadecimal value for x" );
          $display( "         e.g., +x=9A60A70AB29A64D1E272"                   );
        end
        if( !$value$plusargs( "i=%h", t_i ) ) begin
          $display( "warning: need an unsigned  5-bit hexadecimal value for i" );
          $display( "         e.g., +i=1F"                                     );
        end

    #10 $display( ">[%0d] x=%h", 0, t_x );
        $display( ">[%0d] i=%h", 0, t_i );
        $display( "<[%0d] r=%h", 0, t_r );     

    #10 $dumpoff;
        $finish;
  end

endmodule
