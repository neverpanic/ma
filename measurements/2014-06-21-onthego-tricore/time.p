reset
set terminal svg size 600,400 dynamic enhanced fname 'Liberation Sans' fsize 10 mousing name 'KESOPlot' butt solid
set key outside bottom right horizontal Left reverse enhanced
set autoscale
set auto fix
set offsets graph 0.02, graph 0.02, 0.02, 0.05
set xlabel 'tick'
set title 'Runtimes'
set ylabel 'percentage of reference'
set output 'time.svg'
plot \
    './reltime-ea_stack.txt'          using 0:1 title 'EA stack'          with linespoints, \
    './reltime-ea_tlh_nooverlap.txt'  using 0:1 title 'EA TLH NOL'        with linespoints, \
    './reltime-ea_tlh.txt'            using 0:1 title 'EA TLH'            with linespoints, \
    './reltime-eea_stack.txt'         using 0:1 title 'EEA stack'         with linespoints, \
    './reltime-eea_tlh_nooverlap.txt' using 0:1 title 'EEA TLH NOL'       with linespoints, \
    './reltime-eea_tlh.txt'           using 0:1 title 'EEA TLH'           with linespoints, \
    './reltime-baseline.txt'          using 0:1 title 'w/o optimizations' with lines;

reset
set terminal svg size 600,400 dynamic enhanced fname 'Liberation Sans' fsize 10 mousing name 'KESOPlot' butt solid
set key outside bottom right horizontal Left reverse enhanced
set autoscale
set auto fix
set offsets graph 0.02, graph 0.02, 0.02, 0.05
set xlabel 'tick'
set title 'Runtimes'
set ylabel 'Nanoseconds'
set output 'abstime.svg'
plot \
    './avg-time-ea_stack.txt'          using 0:1 title 'EA stack'          with linespoints, \
    './avg-time-ea_tlh_nooverlap.txt'  using 0:1 title 'EA TLH NOL'        with linespoints, \
    './avg-time-ea_tlh.txt'            using 0:1 title 'EA TLH'            with linespoints, \
    './avg-time-eea_stack.txt'         using 0:1 title 'EEA stack'         with linespoints, \
    './avg-time-eea_tlh_nooverlap.txt' using 0:1 title 'EEA TLH NOL'       with linespoints, \
    './avg-time-eea_tlh.txt'           using 0:1 title 'EEA TLH'           with linespoints, \
    './avg-time-baseline.txt'          using 0:1 title 'w/o optimizations' with lines;
