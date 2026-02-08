// Code your design here
module fullAdder( output sum,
                 output cout,
                 input A,
                 input B,
                 input cin
                );
  wire w1,w2,w3;
  xor x1 ( w1,A,B);
  xor x2 (sum,w1,cin);
  
  and a1 ( w2, w1, cin);
  and a2 ( w3,A,B);
    
  
  or o1 ( cout,w2,w3);
  
endmodule

module RCA( input [3:0] A,
           input   [3:0] B,
           input cin,
           output cout,
           output [3:0] s
          );
  wire [3:0] w;
  
  fullAdder f1 ( s[0],w[0], cin , A[0],B[0]);
  fullAdder f2 ( s[1], w[1],w[0], A[1],B[1]);
  fullAdder f3 ( s[2], w[2],w[1] ,A[2],B[2]);
  fullAdder f4 ( s[3], w[3],w[2] , A[3],B[3]);
  
  assign cout=w[3];
  
endmodule;