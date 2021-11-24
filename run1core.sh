IS_HUGE_PAGE=1
IS_DIVIDED_QUEUES=-1
traces=(657.xz_s-56B.champsimtrace.xz)    #(605.mcf_s-1554B.champsimtrace.xz)
CEASER_LATENCY=3  
CEASER_rq_wq_ratio=21
L1D_PREFETCHER=(no)  #(ipcp)      #(ip_stride)
L2C_PREFETCHER=(no) #(ipcp) #(bingo_dpc3)
LLC_PREFETCHER=(no)
policy=(srrip)  #(srrip)
policies=(lru) #hawkeye srrip lru ship drrip)
num_cpus=1
remap=1
LLC_SIZE=1
CEASER_S_LLC=0
pipelined_encryption_engine=1
remapping_on_eviction=0
Trace_Dir=/home/sujeet/SPEC_2017/tracer
for trace in ${traces[*]}          
do
for policy in ${policies[*]}
do 
for partitions in 1     #4 6 8 10 12 14 16 18 20 21  #100 50 20 10 5 2 
do
   for CEASER_S_LLC in 1   #1
   do
	for remap in 1 
	do
	war=1
	sim=1

	 ./build_champsim.sh hashed_perceptron ${L1D_PREFETCHER} ${L2C_PREFETCHER} ${LLC_PREFETCHER} $policy ${num_cpus} ${IS_HUGE_PAGE} ${IS_DIVIDED_QUEUES}  ${CEASER_S_LLC} ${partitions} ${pipelined_encryption_engine} ${CEASER_LATENCY} ${remap} ${remapping_on_eviction} ${LLC_SIZE}	
	
	 ./run_champsim.sh hashed_perceptron-${L1D_PREFETCHER}-${L2C_PREFETCHER}-no-${policy}-${CEASER_S_LLC}-${partitions}-${pipelined_encryption_engine}-${CEASER_LATENCY}-${remap}-${remapping_on_eviction}-1core-${LLC_SIZE}core_llc $war $sim ${Trace_Dir} ${trace}  & 
  done
done
done
done
done
