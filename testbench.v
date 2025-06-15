

module candy_vending_machine_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] coin;
	wire candy;

	// Instantiate the Unit Under Test (UUT)
	candy_vending_machine_using_moore uut (
		.clk(clk), 
		.rst(rst),
		.coin(coin),
		.candy(candy)
	);
	always #5 clk=~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		coin = 0;
	end

	initial begin 
		rst = 1;
		#10 rst = 0;
	end
	
	initial begin 
		coin = 4'b0101;
		#10;
		coin = 4'b1010;
		#10;
	end
	
	initial begin 
		coin = 4'b1010;
		#10;
		coin = 4'b0101;
		#10;
	end
	
	initial begin 
		coin = 4'b0101;
		#10;
		coin = 4'b0101;
		#10;
		coin = 4'b1010;
		#10;
	end
	
	initial begin 
		coin = 4'b1010;
		#10;
		coin = 4'b0101;
		#10;
	end
	
	
	
      
endmodule

