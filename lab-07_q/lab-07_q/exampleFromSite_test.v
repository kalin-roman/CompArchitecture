module example_test();

  wire t_co;
  wire t_s;
  reg  t_x; 
  reg  t_y;

  example t( .co( t_co ), .s( t_s ), .x( t_x ), .y( t_y ) );

  initial begin
        $dumpfile( "example_test.vcd" );
        $dumplimit( 10485760 );
        $dumpvars;

        $dumpon;

    #10 t_x = 1'b0; t_y = 1'b0;
    #10 t_x = 1'b0; t_y = 1'b1;
    #10 t_x = 1'b1; t_y = 1'b0;
    #10 t_x = 1'b1; t_y = 1'b1;
     
    #10 $dumpoff;
        $finish;
  end

endmodule
