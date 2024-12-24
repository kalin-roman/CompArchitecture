/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v3_test();

  integer i;
   
  reg  [ `N_K - 1 : 0 ] v_k [ 0 : `N_V - 1 ]; // test vector cipher key
  reg  [ `N_B - 1 : 0 ] v_m [ 0 : `N_V - 1 ]; // test vector  plaintext message
  reg  [ `N_B - 1 : 0 ] v_c [ 0 : `N_V - 1 ]; // test vector ciphertext message

  reg  [ `N_B - 1 : 0 ] t_t;
   
  reg  [ `N_K - 1 : 0 ] t_k;                  // DUT         cipher key
  reg  [ `N_B - 1 : 0 ] t_m;                  // DUT          plaintext message
  wire [ `N_B - 1 : 0 ] t_c;                  // DUT         ciphertext message
      
  reg                   t_clk;                // DUT       clock signal
   
  encrypt_v3 t( .clk( t_clk ), .k( t_k ), .m( t_m ), .c( t_c ) );

  task test( input integer i );
   begin
      t_k = ( i < `N_V ) ? v_k[ i ] : `N_K'hZ;
      t_m = ( i < `N_V ) ? v_m[ i ] : `N_B'hZ;
	 
      @ ( posedge t_clk );
      @ ( negedge t_clk );

      t_t = t_c;

      $display( ">[%0d] k=%h", i, t_k );
      $display( ">[%0d] m=%h", i, t_m );
      $display( "<[%0d] c=%h", i, t_t );

      if( ( i - `N_R ) >= 0 ) begin
        $display( "?[%0d] %s", i, ( t_t === v_c[ i - `N_R ] ) ? "pass" : "fail" );
      end
    end
  endtask

  initial begin
        t_clk =      0;  
  end

  always  begin
    #1  t_clk = ~t_clk;
  end
   
  initial begin
        $readmemh( "./vectors_k.txt", v_k );
        $readmemh( "./vectors_m.txt", v_m );
        $readmemh( "./vectors_c.txt", v_c );
     
        $dumpfile( "encrypt_v3_test.vcd" );
        $dumplimit( 10485760 );
        $dumpvars;

        $dumpon;

        for( i = 0; i < ( `N_V + `N_R ); i = i + 1 ) begin
          test( i );
        end
     
    #10 $dumpoff;
        $finish;
  end

endmodule
