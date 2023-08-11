module syndown_counter(clk,rst,count);
input clk,rst;
output reg [2:0]count;
always @(posedge clk)
begin
if(rst)
count=3'b111;    // up counter only change count=3'b000 and count = count + 3'b001
else 
count=count - 3'b001;
end
endmodule

module syndown_counter_tb();
reg clk,rst;
wire [2:0]count;

syndown_counter uut(.clk(clk),.rst(rst),.count(count));

initial begin
clk=0;
forever #10 clk=~clk;
end

initial begin
rst=0;
#50 rst=1;
#50 rst=0;
#50 $finish();
end

endmodule
