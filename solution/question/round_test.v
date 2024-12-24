/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module round_test();

  wire [ 63 : 0 ] t_r;
  reg  [ 63 : 0 ] t_x;
  reg  [ 79 : 0 ] t_k;

  round t( .r( t_r ), .x( t_x ), .k( t_k ) );

  initial begin
        $dumpfile( "round_test.vcd" );
        $dumplimit( 10485760 );
        $dumpvars;

        $dumpon;
        t_x = 64'h54110E827441213D; t_k = 80'hDC8770E93EA141E1FC67;
        if( !$value$plusargs( "x=%h", t_x ) ) begin
          $display( "warning: need an unsigned 64-bit hexadecimal value for x" );
          $display( "         e.g., +x=D66E4DEF4CF03750"                       );
        end
        if( !$value$plusargs( "k=%h", t_k ) ) begin
          $display( "warning: need an unsigned 80-bit hexadecimal value for k" );
          $display( "         e.g., +k=385594D326F713925305"                   );
        end
     
    #10 $display( ">[%0d] x=%h", 0, t_x );
        $display( ">[%0d] k=%h", 0, t_k );
        $display( "<[%0d] r=%h", 0, t_r );     

    #10 $dumpoff;
        $finish;
  end

endmodule
