`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_AMUX_core.
// Drop this file in place of hdl/gl/CF_AMUX_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Analog values are Verilog real backdoors (1-bit pins stay digital):
//   t1_v, t2a_v, t2b_v, t2c_v, t2d_v
//
// Assumed protocol (ideal, not silicon-verified):
//   * sw_on_lv high → t1_v is copied onto every t2* terminal
//   * sw_on_lv low → t2* terminals are released
// High-voltage sequence pins are not modeled.

module CF_AMUX_core (
    t2b_hv,
    t2a_hv,
    t2c_hv,
    t2d_hv,
    enpdb_hv,
    holdb_hv,
    start_hv,
    vda,
    vda_shield,
    vnba,
    vpbd,
    vpmp,
    vpwrd,
    vssa,
    sw_on_lv,
    vssa_shield,
    vssd,
    t1_hv
);
    inout t2b_hv;
    inout t2a_hv;
    inout t2c_hv;
    inout t2d_hv;
    input enpdb_hv;
    input holdb_hv;
    input start_hv;
    input vda;
    input vda_shield;
    input vnba;
    input vpbd;
    input vpmp;
    input vpwrd;
    input vssa;
    input sw_on_lv;
    input vssa_shield;
    input vssd;
    inout t1_hv;

    localparam real V_PRESENT = 0.05;

    real t1_v;
    real t2a_v;
    real t2b_v;
    real t2c_v;
    real t2d_v;

    initial t1_v = 0.0;

    always @(*) begin
        if (sw_on_lv === 1'b1) begin
            t2a_v = t1_v;
            t2b_v = t1_v;
            t2c_v = t1_v;
            t2d_v = t1_v;
        end else begin
            t2a_v = 0.0;
            t2b_v = 0.0;
            t2c_v = 0.0;
            t2d_v = 0.0;
        end
    end

    assign t2a_hv = (sw_on_lv === 1'b1) ? ((t1_v > V_PRESENT) ? 1'b1 : 1'b0) : 1'bz;
    assign t2b_hv = (sw_on_lv === 1'b1) ? ((t1_v > V_PRESENT) ? 1'b1 : 1'b0) : 1'bz;
    assign t2c_hv = (sw_on_lv === 1'b1) ? ((t1_v > V_PRESENT) ? 1'b1 : 1'b0) : 1'bz;
    assign t2d_hv = (sw_on_lv === 1'b1) ? ((t1_v > V_PRESENT) ? 1'b1 : 1'b0) : 1'bz;
endmodule
