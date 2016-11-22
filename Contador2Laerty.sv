module Contador1 (
input logic clk,
				reset, 
				direction,
output logic [3:0] cont);


always_ff @(posedge clk)

begin
if(reset)
	begin
	cont <= 4'd0;
	direction <= 1'b0;
	end
else
	if(direction == 1'b0)
		if(saida == 4'd15)
			begin
			direction <= 1'b1;
			cont <= cont - 4'd1;
			end
		else
			cont <= cont + 4'd1;
	else
		if(saida == 4'd0)
			begin
			direction <= 1'b0;
			cont = cont + 4'd1;
			end
		else
			cont <= cont - 4'd1;
end
endmodule