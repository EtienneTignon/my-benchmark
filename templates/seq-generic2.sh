#!/bin/bash
# http://www.cril.univ-artois.fr/~roussel/runsolver/

CAT="{run.root}/programs/gcat.sh"

cd "$(dirname $0)"

#top -n 1 -b > top.txt

[[ -e .finished ]] || $CAT "{run.file}" | "runsolver" \
	-M 20000 \
	-w runsolver.watcher \
	-o runsolver.solver \
	-W {run.timeout} \
	"{run.root}/programs/{run.solver}" {run.args}

touch .finished
