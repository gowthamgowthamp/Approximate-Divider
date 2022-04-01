# Cadence Genus(TM) Synthesis Solution, Version 17.21-s010_1, built Feb  7 2018

# Date: Thu Aug 19 21:36:42 2021
# Host: cad055 (x86_64 w/Linux 2.6.32-71.el6.x86_64) (2cores*4cpus*1physical cpu*Intel(R) Core(TM) i3-2120 CPU @ 3.30GHz 3072KB)
# OS:   Red Hat Enterprise Linux Server release 6.0 (Santiago)

set_db library /cad/FOUNDRY/digital/180nm/dig/lib/typical.lib
read_hdl exact_mux.v
elaborate
synthesize -to_mapped -effort medium
syn_opt
report timing -unconstrained > timing_exact.txt
report power > power_exact.txt
report area > area_exact.txt
exit
