module TB_Teste();

   logic Rst, Clk;
   logic [3:0] Saida;

   //Instanciando o módulo Teste, com o nome de Tst
  Contador1 Teste1(.clk(Clk),  .reset(Rst), .cont(Saida));

   always #50 Clk <= ~Clk; //Gerando o sinal de clock, com período de 100 ns

   initial begin
     $dumpfile("dump.vcd");
 	$dumpvars(1);
		
     //Instante inicial na simulação
		Clk <= 0;
		//Dir <= 0;
		Rst <= 1;
		
		#100 //instante de 100 ns na simulação
		Rst <= 0;
		
		#800 //instante de 900 ns na simulação
		Rst <= 1;
		
		#900 //instante de 1800 ns na simulação
		//Dir <= 1;
		
		#50 //instante de 1850 ns na simulação
		Rst <= 0;
		
		#4000 $finish; //simulação para com 5850 ns
   end
endmodule
