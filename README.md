# Group Elimination in CEASER

The following is a simulation of the Group Elimination (GE) Attack as cited in this paper [here](https://arxiv.org/pdf/2008.01957.pdf). We used an existing implementation of CEASER secure caches in Champsim and modified the code to run the attack.

## Compile and Execution
First build the champsim code using
```console
./build_champsim.sh bimodal no no no lru 1 0 -1 1 1 1 3 1 0 1
```

Then run the code using the command
```console 
./run_champsim.sh bimodal-no-no-no-lru-1-1-1-3-1-0-1core-1core_llc 1 3 tracer main.trace.xz
```

The relevant logs for the GE attack will be visible in `GE Attack/results.txt`.

## Code Changes:

To simulate the attack, we commuicate with the LLC through ChampSim code itself, with lines 1251-1411 in `main.cc` for our code and 1 fix for correct checking in `cache_hit` in `cache.cc`.

