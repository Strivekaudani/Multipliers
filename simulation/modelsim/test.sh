set -e
./clean.sh
./compile.sh
./run_sim.sh $@
./clean.sh
