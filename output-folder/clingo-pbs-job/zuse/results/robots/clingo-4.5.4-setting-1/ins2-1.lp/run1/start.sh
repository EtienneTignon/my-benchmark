#!/bin/bash
# http://www.cril.univ-artois.fr/~roussel/runsolver/

CAT="../../../../../../../../programs/gcat.sh"

cd "$(dirname $0)"

#top -n 1 -b > top.txt

[[ -e .finished ]] || $CAT "../../../../../../../../benchmarks/action_juggling_robot/inst/ins2-1.lp" | "../../../../../../../../programs/runsolver-3.4.0" \
	-M 20000 \
	-w runsolver.watcher \
	-o runsolver.solver \
	-W 1200 \
	"../../../../../../../../programs/clingo-4.5.4" --stats --quiet=1,0 ~/benchmark/benchmark-tool/benchmarks/action_juggling_robot/Encodings/basic.lp

touch .finished
