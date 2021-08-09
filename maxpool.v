`timescale 1ns / 1ps

module maxpool(image_out,clk,rst);

output reg [15:0]image_out;
input clk,rst;

//  bits           depth
reg [9:0] image_addr[3:0];  
reg [9:0]last_coloum_value;
reg stride;

wire [15:0] image_value[3:0];

always @ (posedge clk or posedge rst)
 begin 
   if (rst==1)
	  begin
        image_out=0;
		  image_addr[0]=0;  image_addr[1]=1; 
		  image_addr[2]=26; image_addr[3]=27;
		  stride=2;
        last_coloum_value=25;
       end
	else begin 
	       if (image_value[0]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	         begin
		        image_out = image_value[0]; 
		        end 
				  
		    if (image_value[1]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	           begin
		        image_out = image_value[1]; 
		        end
				  
			if (image_value[2]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	         begin
		        image_out = image_value[2]; 
		       end
				  
		  if (image_value[3]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	         begin
		        image_out = image_value[3]; 
		        end
		
	        if (image_addr[1]!== last_coloum_value)
				    begin
		       	  image_addr[0]=image_addr[0]+stride;
		           image_addr[1]=image_addr[1]+stride;  
		           image_addr[2]=image_addr[2]+stride;
		           image_addr[3]=image_addr[3]+stride; 
					  
             if (image_value[0]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	              begin
		             image_out = image_value[0]; 
		             end 
				  
		       if (image_value[1]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	               begin
		              image_out = image_value[1]; 
		             end
				  
		     	if (image_value[2]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	            begin
		          image_out = image_value[2]; 
		          end
				  
		       if (image_value[3]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	             begin
		           image_out = image_value[3]; 
		            end
				    	  
	             end
				else begin 
				        if (image_addr[3]!== 783)
				             image_addr[0]=image_addr[0]+2;
		                   image_addr[1]=image_addr[1]+2;  
		                   image_addr[2]=image_addr[2]+2;
		                   image_addr[3]=image_addr[3]+2;
								 last_coloum_value =last_coloum_value+26;
								 
					 if (image_value[0]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	              begin
		             image_out = image_value[0]; 
		             end 
				  
		       if (image_value[1]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	               begin
		              image_out = image_value[1]; 
		             end
				  
		     	if (image_value[2]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	            begin
		          image_out = image_value[2]; 
		          end
				  
		       if (image_value[3]>=image_value[1] && image_value[0]>=image_value[2]&& image_value[0]>=image_value[3])
	             begin
		           image_out = image_value[3]; 
		            end
						
				     		end
		  end
  end
  
                
				   image_rom1 A4 (clk,image_addr[0],image_value[0]);
		         image_rom1 A5 (clk,image_addr[1],image_value[1]);
		         image_rom1 A6 (clk,image_addr[2],image_value[2]);
		         image_rom1 A7 (clk,image_addr[3],image_value[3]);
  
  
endmodule

