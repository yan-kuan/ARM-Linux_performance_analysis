#!/bin/bash
echo "0 0 0 0" > /proc/sys/kernel/printk                                                                          
echo 0 > /sys/kernel/debug/tracing/tracing_on
echo 0 > /sys/kernel/debug/tracing/trace
echo sys_sched_rr_get_interval get_rr_interval_idle get_rr_interval_fair get_rr_interval_rt get_rr_interval_stop > /sys/kernel/debug/tracing/set_ftrace_filter
cat /sys/kernel/debug/tracing/set_ftrace_filter
echo nop > /sys/kernel/debug/tracing/current_tracer
echo 1 > /sys/kernel/debug/tracing/events/sched/enable
echo 0 > /sys/kernel/debug/tracing/events/syscalls/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
nohup chrt -f 90 ./io 1.txt &
pid1=$!
nohup chrt -f 45 ./io 2.txt &
pid2=$!
wait $pid1 $pid2
echo 0 > /sys/kernel/debug/tracing/tracing_on
cat /sys/kernel/debug/tracing/trace > ../fifo_result/io_90_45_fifo.txt
process="io-"
python process_ctx.py $process ../fifo_result/io_90_45_fifo.txt ../fifo_result/io_90_45_fifo_p.txt
process1="$process$pid1"
process2="$process$pid2"
grep $process1 ../fifo_result/io_90_45_fifo_p.txt > ../fifo_result/io_90_45_fifo_$pid1.txt
grep $process2 ../fifo_result/io_90_45_fifo_p.txt > ../fifo_result/io_90_45_fifo_$pid2.txt
gnuplot -e "filename1='../fifo_result/io_90_45_fifo_$pid1.txt' ; filename2='../fifo_result/io_90_45_fifo_$pid2.txt' ; outputfile='fifo_9045_io.png'" run.gp

