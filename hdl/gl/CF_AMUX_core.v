// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
