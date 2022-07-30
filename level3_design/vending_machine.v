module vend(coin,clock,reset,newspaper);
//Input Output Port Declarations

input [1:0] coin;
input clock;
input reset;
output wire newspaper;

// internal FSM state Declarations
wire [1:0] Next_State;
reg [1:0] Pres_State;

//state encodings

parameter s0 = 2'b00;
parameter s5 = 2'b01;
parameter s10 = 2'b10;
parameter s15 = 2'b11;

// combinational logic

function [2:0] fsm;
    input [1:0] fsm_coin;
    input [1:0] fsm_Pres_State;

    reg fsm_newspaper;
    reg [1:0] fsm_Next_State;

begin
    case(fsm_Pres_State)
    s0://state =s0
    begin
        if (fsm_coin == 2'b10)
        begin
            fsm_newspaper =1'b0;
            fsm_Next_State=s10;
        end
        else if (fsm_coin == 2'b01)
        begin
            fsm_newspaper = 1'b0;
            fsm_Next_State =s5;
        end
        else
        begin
            fsm_newspaper = 1'b0;
            fsm_Next_State = s0;
        end
    end

    s5:  //state =s5 
    begin
        if (fsm_coin == 2'b10)
        begin 
            fsm_newspaper =1'b0;
            fsm_Next_State = s15;
        end
        else if (fsm_coin == 2'b01)
        begin
            fsm_newspaper = 1'b0;
            fsm_Next_State =s10;
        end
        else 
        begin
            fsm_newspaper = 1'b0;
            fsm_Next_State = s5;
        end
        else
        begin
            fsm_newspaper = 1'b0;
            fsm_Next_State = s5;
        end
    end

    s10:  //state = s10
        begin
            if (fsm_coin == 2'b10)
            begin
                fsm_newspaper = 1'b0;
                fsm_Next_State = s15;
            end 
            else if (fsm_coin == 2'b01)
            begin
                fsm_newspaper = 1'b0;
                fsm_Next_State = s15;
            end
            else
            begin 
                fsm_newspaper = 1'b0;
                fsm_Next_State = s10;
            end
        end

        s15: // state s15
        begin 
            fsm_newspaper = 1'b1;
            fsm_Next_State =s0;
        end
        endcase 
        fsm = {fsm_newspaper, fsm_Next_State};
    end
    endfunction

    // reevaluate combinational logic each time a coin 
    //is put or the present state changes
    assign {newspaper, Next_State} = fsm(coin, Pres_State);

    //clock the state flip flops
    //use synchronous reset
    always@ (posedge clock)
    begin 
        if (reset == 1'b1)
            Pres_State = s0;
        else
            Pres_State = Next_State;
    end
endmodule