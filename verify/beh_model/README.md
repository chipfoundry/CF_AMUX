# CF_AMUX behavioral model

Ideal functional model for digital simulation. It is **not** SPICE-accurate
and it is **not** silicon-verified. Do not add this file to OpenLane
`VERILOG_FILES`.

## Files

| File | Replaces |
|---|---|
| `CF_AMUX_core.v` | `hdl/gl/CF_AMUX_core.v` |

Keep the customer wrap in `hdl/gl/CF_AMUX.v`. Do **not** compile the empty
`hdl/gl/CF_AMUX_core.v` stub in the same sim (duplicate module name).

```bash
./verify/beh_model/run_tb.sh
```

## Behavior

Ideal analog switch. `sw_on_lv` high copies `t1_v` onto `t2a_v` / `t2b_v` / `t2c_v` / `t2d_v` and drives those pins. Low releases them.
