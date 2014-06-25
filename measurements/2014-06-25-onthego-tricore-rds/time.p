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
    './reltime-ea_tlh.txt'            using 0:1 title 'EA TLH'            with linespoints, \
    './reltime-ea_tlh_debug.txt'      using 0:1 title 'EA TLH dbg'        with linespoints, \
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
    './avg-time-ea_tlh.txt'            using 0:1 title 'EA TLH'            with linespoints, \
    './avg-time-ea_tlh_debug.txt'      using 0:1 title 'EA TLH dbg'        with linespoints, \
    './avg-time-baseline.txt'          using 0:1 title 'w/o optimizations' with lines;
