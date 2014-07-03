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
    './reltime-ea_stack_loop.txt'       using 0:1 title 'using loop'       with linespoints, \
    './reltime-ea_stack_ploop.txt'      using 0:1 title 'using *loop'      with linespoints, \
    './reltime-ea_tlh_loop.txt'         using 0:1 title 'tlh loop'         with linespoints, \
    './reltime-ea_tlh_ploop.txt'        using 0:1 title 'tlh *loop'        with linespoints, \
    './reltime-baseline.txt'            using 0:1 title 'using memset()'   with lines;

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
    './avg-time-ea_stack_loop.txt'       using 0:1 title 'using loop'       with linespoints, \
    './avg-time-ea_stack_ploop.txt'      using 0:1 title 'using *loop'      with linespoints, \
    './avg-time-ea_tlh_loop.txt'         using 0:1 title 'TLH loop'         with linespoints, \
    './avg-time-ea_tlh_ploop.txt'        using 0:1 title 'TLH *loop'        with linespoints, \
    './avg-time-baseline.txt'            using 0:1 title 'using memset()'   with lines;
