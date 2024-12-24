# Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
#
# Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
# which can be found via http://creativecommons.org (and should be included as 
# LICENSE.txt within the associated archive or repository).

# =============================================================================

SOURCES         := $(wildcard *.v)
HEADERS         := $(wildcard *.h)

MODULES         := $(filter-out    %_test.v, ${SOURCES})

STIMULI         := $(filter        %_test.v, ${SOURCES})
STIMULI_VVP     := $(patsubst %.v, %.vvp,    ${STIMULI})
STIMULI_VCD     := $(patsubst %.v, %.vcd,    ${STIMULI})

# -----------------------------------------------------------------------------

FORCE          :

${STIMULI_VVP} : %_test.vvp : %_test.v %.v ${HEADERS} ${MODULES}
	@iverilog -Wall -g2012 -s ${*}_test -o ${@} ${^}

${STIMULI_VCD} : %_test.vcd : %_test.vvp FORCE
	@vvp ${<} ${ARGS}

# -----------------------------------------------------------------------------

all   :             ${STIMULI_VVP}

clean :
	@rm -f ${STIMULI_VVP} ${STIMULI_VCD}

# =============================================================================
