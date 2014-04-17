reset
set terminal svg size 600,400 dynamic enhanced fname 'Liberation Sans' fsize 10 mousing name 'KESOPlot' butt solid
set key outside bottom right horizontal Left reverse enhanced
set autoscale
set auto fix
set offsets graph 0.02, graph 0.02, 0.02, 0.05
set xlabel 'tick'
set title 'Memory'
set ylabel 'percentage of reference'
set output 'memory.svg'
plot \
    './relmemory-plain.txt' using 0:1 title 'w/o optimizations' with lines, \
    './relmemory-eea.txt'   using 0:1 title 'EEA only'          with linespoints, \
    './relmemory-sext.txt'  using 0:1 title 'EEA + ScopeExt'    with linespoints;
reset
set terminal svg size 600,400 dynamic enhanced fname 'Liberation Sans' fsize 10 mousing name 'KESOPlot' butt solid
set key outside bottom right horizontal Left reverse enhanced
set autoscale
set auto fix
set offsets graph 0.02, graph 0.02, 0.02, 0.05
set xlabel 'tick'
set title 'Memory'
set ylabel 'Bytes'
set output 'absmemory.svg'
plot \
    './avg-memory-plain.txt' using 0:1 title 'w/o optimizations' with linespoints, \
    './avg-memory-eea.txt'   using 0:1 title 'EEA only'          with linespoints, \
    './avg-memory-sext.txt'  using 0:1 title 'EEA + ScopeExt'    with linespoints;
