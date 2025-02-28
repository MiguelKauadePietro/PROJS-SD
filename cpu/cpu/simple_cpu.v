module simple_cpu (
    input clk,
    input rst,
    input [15:0] memory_data,
    output reg mw,
    output reg [15:0] acc,
    output reg [7:0] mar,
    output reg [7:0] pc
);

    // Registradores internos
    reg [15:0] ir;      // Instruction Register
    reg [15:0] mdr;     // Memory Data Register

    // Definição de estados
    parameter RST_PC = 0, FETCH = 1, DECODE = 2, EXEC_ADD = 3, EXEC_STORE = 4, STORE_WAIT = 5;
    
    reg [2:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Resetando o processador
            state <= RST_PC;
            pc <= 8'h00;
            acc <= 16'h0000;
            mar <= 8'h00;
            mdr <= 16'h0000;
            ir <= 16'h0000;
            mw <= 1'b0;
        end else begin
            case (state)
                RST_PC: begin
                    pc <= 8'h00;
                    state <= FETCH;
                end
                FETCH: begin
                    mar <= pc;
                    mdr <= memory_data;
                    ir <= mdr;
                    pc <= pc + 1;
                    state <= DECODE;
                end
                DECODE: begin
                    mar <= ir[7:0];
                    case (ir[15:8])
                        8'h02: state <= EXEC_ADD;  // Opcode para ADD
                        8'h03: state <= EXEC_STORE; // Opcode para STORE
                        default: state <= FETCH;
                    endcase
                end
                EXEC_ADD: begin
                    acc <= acc + memory_data;
                    state <= FETCH;
                end
                EXEC_STORE: begin
                    mw <= 1'b1; // Ativa sinal de escrita
                    state <= STORE_WAIT;
                end
                STORE_WAIT: begin
                    mw <= 1'b0; // Desativa o sinal de escrita
                    state <= FETCH;
                end
                default: state <= FETCH;
            endcase
        end
    end

endmodule
