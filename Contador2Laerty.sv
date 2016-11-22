module Contador2 (
input logic clk,
			reset, 
			
output logic [3:0] cont);
  
 logic direction;

always_ff @(posedge clk)

begin
if(reset)
	begin
	cont <= 4'd0;
	direction <= 1'b0;
	end
else
	if(direction == 1'b0)
      if(cont == 4'd15)
			direction <= 1'b1;
			
		else
			cont <= cont + 4'd1;
	else
      if(cont == 4'd0)
			direction <= 1'b0;
	  else
			cont <= cont - 4'd1;
end
endmodule