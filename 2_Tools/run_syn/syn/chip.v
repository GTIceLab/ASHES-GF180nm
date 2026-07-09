module TOP(port1);


	/* Island 0 */
	TunnelingChargePump I__0 (.island_num(0), .row(0), .col(0), .matrix_row(1), .matrix_col(1), .GND_wrow_0(net5), .Vout_erow_0(net6));

 	/*Programming Mux */ 


	/* Island 1 */
	SchottkyDiode I__0 (.island_num(1), .row(0), .col(0), .matrix_row(1), .matrix_col(1), .GND_erow_0(net5), .Anode_nrow_0(net7), .Cathode_srow_0(net6));
	SchottkyDiode I__1 (.island_num(1), .row(3), .col(3), .matrix_row(1), .matrix_col(1), .Anode_nrow_0(net7));

 	/*Programming Mux */ 

 endmodule