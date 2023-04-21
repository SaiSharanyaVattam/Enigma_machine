// This is the keypart of the enigma machine.
// It contains all rotors and the reflector.

module encryption(out, in, r1, r2, r3,mode,counter,signal);
    output [4:0] out;
    input [4:0] in;
    input [4:0] r1, r2, r3;
    input mode,signal;
    input [5:0] counter;
    

    wire [4:0] w1, w2, w3, w4, w5, w6;

    rotor1 ro1(w1, in, r1,mode,counter,signal);
    rotor2 ro2(w2, w1, r2,mode,counter,signal);
    rotor3 ro3(w3, w2, r3,mode,counter,signal);
    reflector ro4(w4, w3);
    rotor3_inv ro5(w5, w4, r3,mode,signal,counter);
    rotor2_inv ro6(w6, w5, r2,mode,signal,counter);
    rotor1_inv ro7(out, w6, r1,mode, signal,counter);

endmodule // encryption