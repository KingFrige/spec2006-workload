# We use a branch of Speckle (https://github.com/ccelio/Speckle) to cross
# compile the binaries for SPEC2006. These can be compiled locally on a machine
# with the Spec installation, and the overlay directories
# ($SPECKLE_DIR/build/overlay) can be moved EC2

# Default to the submodule
SPECKLE_DIR ?= speckle
#Default to ref input size for SPEC06
INPUT ?= ref
RATE ?= 0
SUITE ?= int

#TODO: Provide runscripts for fp{speed, rate}
spec06_suites = int fp all
spec06_rootfs_dirs = $(patsubst %, spec06-%, $(spec06-suites))

$(SPECKLE_DIR)/build/overlay/%/$(INPUT):
	-cd $(SPECKLE_DIR) && ./gen_binaries.sh --compile --input $(INPUT) --rate $(RATE) --suite $(SUITE)

spec06-%: $(SPECKLE_DIR)/build/overlay/%/$(INPUT);
	echo $^

clean:
	rm -rf $(SPECKLE_DIR)/build

.PHONY: $(spec06_overlays) $(spec06_rootfs_dirs) clean
.PRECIOUS: $(SPECKLE_DIR)/build/overlay/%/$(INPUT)
