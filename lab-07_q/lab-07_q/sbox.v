
module sbox( output wire [ 3 : 0 ] r,
              input wire [ 3 : 0 ] x );

   // Stage 1: complete this module implementation
   reg [3:0] res; 
   assign r = res; 

  always @(x) begin
   
  case(x)

     4'h0 : res = 4'hC;
     4'h1 : res = 4'h5;
     4'h2 : res = 4'h6;
     4'h3 : res = 4'hB;
     
     4'h4 : res = 4'h9;
     4'h5 : res = 4'h0;
     4'h6 : res = 4'hA;
     4'h7 : res = 4'hD;
     
     4'h8 : res = 4'h3;
     4'h9 : res = 4'hE;
     4'hA : res = 4'hF;
     4'hB : res = 4'h8;
     
     4'hC : res = 4'h4;
     4'hD : res = 4'h7;
     4'hE : res = 4'h1;
     4'hF : res = 4'h2;

  endcase;
  end

endmodule       