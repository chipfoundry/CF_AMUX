`timescale 1ns / 1ps

module tb_CF_AMUX;
    integer errors;
    reg enpdb_hv, holdb_hv, start_hv, vda, vda_shield, vnba, vpbd, vpmp, vpwr, vssa, sw_on_lv, vssa_shield, vgnd;
    wire t2b_hv, t2a_hv, t2c_hv, t2d_hv, t1_hv;

    CF_AMUX u (
        .t2b_hv(t2b_hv), .t2a_hv(t2a_hv), .t2c_hv(t2c_hv), .t2d_hv(t2d_hv),
        .enpdb_hv(enpdb_hv), .holdb_hv(holdb_hv), .start_hv(start_hv),
        .vda(vda), .vda_shield(vda_shield), .vnba(vnba), .vpbd(vpbd), .vpmp(vpmp),
        .vpwr(vpwr), .vssa(vssa), .sw_on_lv(sw_on_lv), .vssa_shield(vssa_shield),
        .vgnd(vgnd), .t1_hv(t1_hv)
    );

    task expect_bit;
        input got;
        input exp;
        input [8*24-1:0] tag;
        begin
            if (got !== exp) begin
                $display("FAIL %s got=%b exp=%b", tag, got, exp);
                errors = errors + 1;
            end else $display("PASS %s %b", tag, got);
        end
    endtask

    initial begin
        errors = 0;
        enpdb_hv = 1; holdb_hv = 1; start_hv = 0; vda = 1; vda_shield = 0;
        vnba = 0; vpbd = 1; vpmp = 0; vpwr = 1; vssa = 0; sw_on_lv = 0;
        vssa_shield = 0; vgnd = 0;
        u.u_core.t1_v = 1.2;
        #1;
        expect_bit(t2a_hv, 1'bz, "open");
        sw_on_lv = 1;
        #1;
        expect_bit(t2a_hv, 1'b1, "closed");
        expect_bit(t2d_hv, 1'b1, "closed d");
        if (u.u_core.t2a_v < 1.19 || u.u_core.t2a_v > 1.21) begin
            $display("FAIL t2a_v %g", u.u_core.t2a_v);
            errors = errors + 1;
        end else $display("PASS t2a_v %g", u.u_core.t2a_v);
        u.u_core.t1_v = 0.0;
        #1;
        expect_bit(t2b_hv, 1'b0, "low");
        sw_on_lv = 0;
        #1;
        expect_bit(t2c_hv, 1'bz, "released");
        if (errors == 0) $display("CF_AMUX behavioral self-check passed");
        else $display("CF_AMUX behavioral self-check FAILED %0d", errors);
        $finish(errors != 0);
    end
endmodule
