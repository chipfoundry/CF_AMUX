// Structural PG wrapper. Analog leaf is CF_AMUX_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_AMUX (
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
    vpwr,
    vssa,
    sw_on_lv,
    vssa_shield,
    vgnd,
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
    input vpwr;
    input vssa;
    input sw_on_lv;
    input vssa_shield;
    input vgnd;
    inout t1_hv;
    CF_AMUX_core u_core (
        .t2b_hv(t2b_hv),
        .t2a_hv(t2a_hv),
        .t2c_hv(t2c_hv),
        .t2d_hv(t2d_hv),
        .enpdb_hv(enpdb_hv),
        .holdb_hv(holdb_hv),
        .start_hv(start_hv),
        .vda(vda),
        .vda_shield(vda_shield),
        .vnba(vnba),
        .vpbd(vpbd),
        .vpmp(vpmp),
        .vpwrd(vpwr),
        .vssa(vssa),
        .sw_on_lv(sw_on_lv),
        .vssa_shield(vssa_shield),
        .vssd(vgnd),
        .t1_hv(t1_hv)
    );
endmodule
