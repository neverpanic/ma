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
    './reltime-ea_stack_inlineinit.txt' using 0:1 title 'EA + inline init' with linespoints, \
    './reltime-ea_stack.txt'            using 0:1 title 'EA'               with linespoints, \
    './reltime-baseline.txt'            using 0:1 title 'w/o stack alloc'  with lines;

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
    './avg-time-ea_stack_inlineinit.txt' using 0:1 title 'EA + inline init' with linespoints, \
    './avg-time-ea_stack.txt'            using 0:1 title 'EA'               with linespoints, \
    './avg-time-baseline.txt'            using 0:1 title 'w/o stack alloc'  with lines;
