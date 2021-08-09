`timescale 1ns / 1ps

module conv(clk,rst,image_out);

output reg signed [15:0] image_out; //Because of after convolution image will 26x26
input clk,rst;                                                           
 //Edge Detector Filter                    values, each bit is 8  
reg signed [7:0] filter[8:0];   
//  bits           depth
reg [9:0] image_addr[8:0];  //total image = 28x28=784
reg [9:0]last_coloum_value;

wire [7:0] image_value[8:0];
reg signed [15:0] product[8:0];

always @ (posedge clk or posedge rst)
  begin
     if (rst==1)
	    begin
		  image_out=0;
		  image_addr[0]=0;  image_addr[1]=1;  image_addr[2]=2;
		  image_addr[3]=28; image_addr[4]=29; image_addr[5]=30;
		  image_addr[6]=56; image_addr[7]=57; image_addr[8]=58;
		  //Filter
		  filter [0]=1; filter [1]=0; filter [2]=-1;
		  filter [3]=1; filter [4]=0; filter [5]=-1;
		  filter [6]=1; filter [7]=0; filter [8]=-1;
		  product[0] =0;  product[1] =0;  product[2] =0;  product[3] =0;  product[4] =0;  product[5] =0;  product[6] =0; product[7] =0;  product[8] =0;
		  last_coloum_value=27;  
		  end
		else begin 
		         //product
		product[0] = image_value[0]*filter[0]; product[1] = image_value[1]*filter[1]; product[2] = image_value[2]*filter[2]; 
		product[3] = image_value[3]*filter[3]; product[4] = image_value[4]*filter[4]; product[5] = image_value[5]*filter[5];
		product[6] = image_value[6]*filter[6]; product[7] = image_value[7]*filter[7]; product[8] = image_value[8]*filter[8];
		            //Sum
	   image_out = product[0]+product[1]+product[2]+product[3]+product[4]+product[5]+product[6]+product[7]+product[8];
		
		       if (image_addr[2]!== last_coloum_value)
				    begin
		       	  image_addr[0]=image_addr[0]+1;
		           image_addr[1]=image_addr[1]+1;  
		           image_addr[2]=image_addr[2]+1;
		           image_addr[3]=image_addr[3]+1;
		           image_addr[4]=image_addr[4]+1;
		           image_addr[5]=image_addr[5]+1;
		           image_addr[6]=image_addr[6]+1;
		           image_addr[7]=image_addr[7]+1;
		           image_addr[8]=image_addr[8]+1;
      product[0] = image_value[0]*filter[0]; product[1] = image_value[1]*filter[1]; product[2] = image_value[2]*filter[2]; 
		product[3] = image_value[3]*filter[3]; product[4] = image_value[4]*filter[4]; product[5] = image_value[5]*filter[5];
		product[6] = image_value[6]*filter[6]; product[7] = image_value[7]*filter[7]; product[8] = image_value[8]*filter[8];
		            //Sum
	   image_out = product[0]+product[1]+product[2]+product[3]+product[4]+product[5]+product[6]+product[7]+product[8];					  
					  end
					  else begin
					         if (image_addr[8]!=783)
								  begin
					          image_addr[0]=image_addr[0]+3;
		                   image_addr[1]=image_addr[1]+3;  
		                   image_addr[2]=image_addr[2]+3;
		                   image_addr[3]=image_addr[3]+3;
		                   image_addr[4]=image_addr[4]+3;
		                   image_addr[5]=image_addr[5]+3;
		                   image_addr[6]=image_addr[6]+3;
		                   image_addr[7]=image_addr[7]+3;
		                   image_addr[8]=image_addr[8]+3; 
								 last_coloum_value =last_coloum_value+28;
      product[0] = image_value[0]*filter[0]; product[1] = image_value[1]*filter[1]; product[2] = image_value[2]*filter[2]; 
		product[3] = image_value[3]*filter[3]; product[4] = image_value[4]*filter[4]; product[5] = image_value[5]*filter[5];
		product[6] = image_value[6]*filter[6]; product[7] = image_value[7]*filter[7]; product[8] = image_value[8]*filter[8];
		            //Sum
	   image_out = product[0]+product[1]+product[2]+product[3]+product[4]+product[5]+product[6]+product[7]+product[8];
								   end
							  end		    
		      end
   end //always end
	  
				   image_rom1 A0 (clk,image_addr[0],image_value[0]);
		         image_rom1 A1 (clk,image_addr[1],image_value[1]);
		         image_rom1 A2 (clk,image_addr[2],image_value[2]);
		         image_rom1 A3 (clk,image_addr[3],image_value[3]);
				   image_rom1 A4 (clk,image_addr[4],image_value[4]);
		         image_rom1 A5 (clk,image_addr[5],image_value[5]);
		         image_rom1 A6 (clk,image_addr[6],image_value[6]);
		         image_rom1 A7 (clk,image_addr[7],image_value[7]);
		         image_rom1 A8 (clk,image_addr[8],image_value[8]);
		        
            
endmodule
