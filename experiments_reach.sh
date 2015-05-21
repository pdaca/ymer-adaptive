#!/bin/bash

TOOL='GLOG_logtostderr=1 ./ymer'
COMMON_ARG='--seed=0 --alpha=0.01 --beta=0.01 --delta=0.01 --false-cnd-probability=0.001 --termination-probability=0.0001  --trials=5'

BENCHMARKS=(
    # "examples/crowds/crowds_nodl.pm examples/crowds/positive_qual.pctl --const=TotalRuns=6,CrowdSize=15 --min-transition-probability=0.0666"
    # "examples/crowds/crowds_nodl.pm examples/crowds/positive_qual.pctl --const=TotalRuns=7,CrowdSize=20 --min-transition-probability=0.05"
    "examples/crowds/crowds_nodl.pm examples/crowds/positive_qual.pctl --const=TotalRuns=8,CrowdSize=20 --min-transition-probability=0.05"
    # "examples/brp/brp_nodl.pm examples/brp/p1_qual.pctl --const=N=500,MAX=500 --min-transition-probability=0.01"
    # "examples/brp/brp_nodl.pm examples/brp/p1_qual.pctl --const=N=1500,MAX=1500 --min-transition-probability=0.01"
    "examples/brp/brp_nodl.pm examples/brp/p1_qual.pctl --const=N=2000,MAX=1500 --min-transition-probability=0.01"
    # "examples/nand/nand.pm examples/nand/reliable_qual.pctl --const=N=50,K=3 --min-transition-probability=0.02	"
    # "examples/nand/nand.pm examples/nand/reliable_qual.pctl --const=N=60,K=4 --min-transition-probability=0.02	"
    "examples/nand/nand.pm examples/nand/reliable_qual.pctl --const=N=70,K=5 --min-transition-probability=0.02	"
    # "examples/contract_eql/egl.pm examples/contract_eql/unfairA_qual.pctl --const=N=15,L=10 --min-transition-probability=0.5"
    # "examples/contract_eql/egl.pm examples/contract_eql/unfairA_qual.pctl --const=N=20,L=15 --min-transition-probability=0.5"
    "examples/contract_eql/egl.pm examples/contract_eql/unfairA_qual.pctl --const=N=20,L=20 --min-transition-probability=0.5"
    # "examples/leader/synchronous/leader6_6.pm examples/leader/synchronous/elected_qual.pctl  --min-transition-probability=2.144e-05"
    # "examples/leader/synchronous/leader6_8.pm examples/leader/synchronous/elected_qual.pctl  --min-transition-probability=3.8e-06"
    "examples/leader/synchronous/leader6_11.pm examples/leader/synchronous/elected_qual.pctl  --min-transition-probability=5.6e-07"
    # "examples/self-stabilisation/herman/herman17_oneinit.pm examples/self-stabilisation/herman/reach.pctl  --min-transition-probability=7.62e-06"
    # "examples/self-stabilisation/herman/herman19_oneinit.pm examples/self-stabilisation/herman/reach.pctl  --min-transition-probability=1.9e-06"
    "examples/self-stabilisation/herman/herman21_oneinit.pm examples/self-stabilisation/herman/reach.pctl  --min-transition-probability=4.76e-07"
    # "examples/bluetooth/bluetooth_oneinit.pm examples/bluetooth/time_qual.pctl --const=mrec=4 --min-transition-probability=7.81e-03-m"
    # "examples/bluetooth/bluetooth_oneinit.pm examples/bluetooth/time_qual.pctl --const=mrec=7 --min-transition-probability=7.81e-03-m"
    "examples/bluetooth/bluetooth_oneinit.pm examples/bluetooth/time_qual.pctl --const=mrec=10 --min-transition-probability=7.81e-03-m"
    # "examples/extreme/extreme.pm examples/extreme/prop1_qual.pctl --const=N=18 --min-transition-probability=0.5"
    # "examples/extreme/extreme.pm examples/extreme/prop1_qual.pctl --const=N=19 --min-transition-probability=0.5"
    "examples/extreme/extreme.pm examples/extreme/prop1_qual.pctl --const=N=20 --min-transition-probability=0.5"
    # "examples/scale/scale2.pm examples/scale/prop1_qual.pctl --const=N=1000,M=5 --min-transition-probability=0.5"
    # "examples/scale/scale2.pm examples/scale/prop1_qual.pctl --const=N=10000,M=5 --min-transition-probability=0.5"
    "examples/scale/scale2.pm examples/scale/prop1_qual.pctl --const=N=100000,M=5 --min-transition-probability=0.5"
    #"examples/scale/scale2.pm examples/scale/prop1_qual.pctl --const=N=1000,M=50 --min-transition-probability=0.5"
    "examples/scale/scale2.pm examples/scale/prop1_qual.pctl --const=N=1000,M=500 --min-transition-probability=0.5")

ENGINE="--engine=adaptive"

for TEST in "${BENCHMARKS[@]}"; do
    CMD="$TOOL $COMMON_ARG $ENGINE $TEST"
    echo
    echo "Running '$CMD'"
    echo
    eval "$CMD"
    echo "----------------------------"
    echo
done

# ENGINE="--engine=sampling"

# for TEST in "${BENCHMARKS[@]}"; do
#     CMD="$TOOL $COMMON_ARG $ENGINE $TEST"
#     echo
#     echo "Running '$CMD'"
#     echo
#     eval "$CMD"
#     echo "----------------------------"
#     echo
# done

# ENGINE="--engine=mixed"

# for TEST in "${BENCHMARKS[@]}"; do
#     CMD="$TOOL $COMMON_ARG $ENGINE $TEST"
#     echo
#     echo "Running '$CMD'"
#     echo
#     eval "$CMD"
#     echo "----------------------------"
#     echo
# done
