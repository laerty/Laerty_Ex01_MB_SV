/*Definindo um contador Crescente / Decrescente de 4 bits que vai 
de 0 a 15 e de 15 a 0, sendo que após o ciclo de clock o contador 
incrementa ou decrementa dependendo do sentido da contagem.*/

`timescale 1ns/1ns //Diretiva necessária para poder simular

// 4'd0 representa o número zero com 4 bits na base decimal
// 1'b0 representa o número zero com 1 bit na base binária (aqui usado para representar um valor lógico, ativo/inativo, direita/esquerda)

module Contador1 (
input logic clk,
				reset, 
				direction,// 
				
output logic [3:0] cont);

always_ff @(posedge clk) //Flip Flop com Borda positiva de Clock

begin
if(reset) //Reset síncrono que inicia em 0 e na direção positiva.
	begin
	cont <= 4'd0;
	direction <= 1'b0;
	end
else
	if(direction == 1'b0)
		if(cont == 4'd15)
			begin
			direction <= 1'b1;
			cont <= cont - 4'd1;
			end
		else
			cont <= cont + 4'd1;
	else 
		if(cont == 4'd0)
			begin
			direction <= 1'b0;
			cont = cont + 4'd1;
			end
		else
			cont <= cont - 4'd1;
end
endmodule