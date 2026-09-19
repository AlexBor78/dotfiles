-- slurp region-selection overlay (hyprshot -m region without -z)
hl.layer_rule({
    name    = "no-anim-selection",
    match   = { namespace = "selection" },
    no_anim = true,
})

-- hyprpicker freeze overlay (hyprshot -zm ...)
hl.layer_rule({
    name    = "no-anim-hyprpicker",
    match   = { namespace = "hyprpicker" },
    no_anim = true,
})
