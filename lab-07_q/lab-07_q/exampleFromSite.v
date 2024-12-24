module blocking;
  reg [3:0] data = 4'h4;
  real r_value;
  integer i_value;
  time T;
  
  initial begin
    $monitor("At time T = %0t: data = %0d, r_value = %0f, i_value = %0h", T, data, r_value, i_value);
    // blocking assignments
    // r_value = 3.14;
    // i_value = 4;
    // #2 data = 4'h5;
    // #3 data = 'd7;
    // i_value = 10;
    // i_value = 6;
    // $finish;

// At time T = x: data = 4, r_value = 3.140000, i_value = 4
// At time T = 1: data = 4, r_value = 3.140000, i_value = 4
// At time T = 2: data = 5, r_value = 3.140000, i_value = 4
// At time T = 3: data = 5, r_value = 3.140000, i_value = 4
// At time T = 4: data = 5, r_value = 3.140000, i_value = 4
// At time T = 4: data = 7, r_value = 3.140000, i_value = 6

//     // non-blocking assignments

//     r_value <= 3.14;
//     i_value <= 4;
//     #2 data <= 4'h5;
//     data <= #3 'd7;
//     i_value <= 10;
//     i_value <= 6;
//     #4 $finish;

// At time T = x: data = 4, r_value = 3.140000, i_value = 4
// At time T = 1: data = 4, r_value = 3.140000, i_value = 4
// At time T = 2: data = 5, r_value = 3.140000, i_value = 6
// At time T = 3: data = 5, r_value = 3.140000, i_value = 6
// At time T = 4: data = 5, r_value = 3.140000, i_value = 6
// At time T = 5: data = 7, r_value = 3.140000, i_value = 6

    r_value <= 3.14;
    i_value <= 4;
    #2 data <= 4'h5;
    data <=  #3 'd7;
    i_value <= 10;
    i_value <= 6;
    #4 $finish;

// At time T = x: data = 4, r_value = 3.140000, i_value = 4
// At time T = 1: data = 4, r_value = 3.140000, i_value = 4
// At time T = 2: data = 5, r_value = 3.140000, i_value = 4
// At time T = 3: data = 5, r_value = 3.140000, i_value = 4
// At time T = 4: data = 5, r_value = 3.140000, i_value = 4
// At time T = 4: data = 7, r_value = 3.140000, i_value = 6

  end
  
  always #1 T = $time;
endmodule