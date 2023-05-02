module data_memory(input [23:0] address, input [23:0] write_data, input mem_write, input mem_read,input clk,
    output reg [23:0] read_data);
    reg [23:0] mem[1023:0]; // memory with 1Kx24 bits
	
	initial begin
		for(int i =0;i<1023;i++)begin
			mem[i]=i;	
		end
	end
	
    always @(posedge clk) begin
        if (mem_write) begin
            mem[address] <= write_data;
        end
    end

	
	always @(*)begin
		if (mem_read) begin
            read_data <= mem[address];
        end
	end
endmodule
