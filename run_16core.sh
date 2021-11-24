#!/bin/bash

if [ "$#" -lt 21 ] || [ "$#" -gt 22 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./run_4core.sh [BINARY] [N_WARM] [N_SIM] [N_MIX] [TRACE0] [TRACE1] [TRACE2] [TRACE3] [OPTION]"
    exit 1
fi

TRACE_DIR=/home/sujeet/Study/Study/Thesis/EnclaveSim_for_multicore/EnclaveSim/tracer
BINARY=${1}
N_WARM=${2}
N_SIM=${3}
N_MIX=${4}
TRACE0=${5}
TRACE1=${6}
TRACE2=${7}
TRACE3=${8}
TRACE4=${9}
TRACE5=${10}
TRACE6=${11}
TRACE7=${12}
TRACE8=${13}
TRACE9=${14}
TRACE10=${15}
TRACE11=${16}
TRACE12=${17}
TRACE13=${18}
TRACE14=${19}
TRACE15=${20}
results_folder=${21}
OPTION=${22}

# Sanity check
if [ -z $TRACE_DIR ] || [ ! -d "$TRACE_DIR" ] ; then
    echo "[ERROR] Cannot find a trace directory: $TRACE_DIR"
    exit 1
fi

if [ ! -f "bin/$BINARY" ] ; then
    echo "[ERROR] Cannot find a ChampSim binary: bin/$BINARY"
    exit 1
fi

re='^[0-9]+$'
if ! [[ $N_WARM =~ $re ]] || [ -z $N_WARM ] ; then
    echo "[ERROR]: Number of warmup instructions is NOT a number" >&2;
    exit 1
fi

re='^[0-9]+$'
if ! [[ $N_SIM =~ $re ]] || [ -z $N_SIM ] ; then
    echo "[ERROR]: Number of simulation instructions is NOT a number" >&2;
    exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE0" ] ; then
    echo "[ERROR] Cannot find a trace0 file: $TRACE_DIR/$TRACE0"
    exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE1" ] ; then
    echo "[ERROR] Cannot find a trace1 file: $TRACE_DIR/$TRACE1"
    exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE2" ] ; then
    echo "[ERROR] Cannot find a trace2 file: $TRACE_DIR/$TRACE2"
    exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE3" ] ; then
    echo "[ERROR] Cannot find a trace3 file: $TRACE_DIR/$TRACE3"
    exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE4" ] ; then
	    echo "[ERROR] Cannot find a trace4 file: $TRACE_DIR/$TRACE0"
	    exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE5" ] ; then
	echo "[ERROR] Cannot find a trace5 file: $TRACE_DIR/$TRACE1"
	exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE6" ] ; then
	echo "[ERROR] Cannot find a trace6 file: $TRACE_DIR/$TRACE2"
	exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE7" ] ; then
	echo "[ERROR] Cannot find a trace7 file: $TRACE_DIR/$TRACE3"
	exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE8" ] ; then
        echo "[ERROR] Cannot find a trace8 file: $TRACE_DIR/$TRACE3"
	        exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE9" ] ; then
	        echo "[ERROR] Cannot find a trace9 file: $TRACE_DIR/$TRACE3"
		exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE10" ] ; then
	        echo "[ERROR] Cannot find a trace10 file: $TRACE_DIR/$TRACE3"
		        exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE11" ] ; then
	        echo "[ERROR] Cannot find a trace11 file: $TRACE_DIR/$TRACE3"
		        exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE12" ] ; then
	        echo "[ERROR] Cannot find a trace12 file: $TRACE_DIR/$TRACE3"
		        exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE13" ] ; then
	        echo "[ERROR] Cannot find a trace13 file: $TRACE_DIR/$TRACE3"
		        exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE14" ] ; then
	        echo "[ERROR] Cannot find a trace14 file: $TRACE_DIR/$TRACE3"
		        exit 1
fi

if [ ! -f "$TRACE_DIR/$TRACE15" ] ; then
	        echo "[ERROR] Cannot find a trace15 file: $TRACE_DIR/$TRACE3"
		        exit 1
fi




mkdir -p ${results_folder}
(./bin/${BINARY} -warmup_instructions ${N_WARM}000000 -simulation_instructions ${N_SIM}000000 ${OPTION} -traces ${TRACE_DIR}/${TRACE0} ${TRACE_DIR}/${TRACE1} ${TRACE_DIR}/${TRACE2} ${TRACE_DIR}/${TRACE3} ${TRACE_DIR}/${TRACE4} ${TRACE_DIR}/${TRACE5} ${TRACE_DIR}/${TRACE6} ${TRACE_DIR}/${TRACE7} ${TRACE_DIR}/${TRACE8} ${TRACE_DIR}/${TRACE9} ${TRACE_DIR}/${TRACE10} ${TRACE_DIR}/${TRACE11} ${TRACE_DIR}/${TRACE12} ${TRACE_DIR}/${TRACE13} ${TRACE_DIR}/${TRACE14} ${TRACE_DIR}/${TRACE15} ) &> ${results_folder}/mix${N_MIX}-${BINARY}${OPTION}.txt
