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
    './reltime-plain.txt' using 0:1 title 'w/o optimizations' with lines, \
    './reltime-eea.txt'   using 0:1 title 'EEA only'          with linespoints, \
    './reltime-sext.txt'  using 0:1 title 'EEA + ScopeExt'    with linespoints;
