export BUILD_HARNESS_PATH ?= projects/tools/build-harness

include $(BUILD_HARNESS_PATH)/Makefile

# Parse a make target and turn it into parts
ARG0 = $(word 1,$(subst /, ,$@))
ARG1 = $(word 2,$(subst /, ,$@))
ARG2 = $(word 3,$(subst /, ,$@))
ARG3 = $(word 4,$(subst /, ,$@))

include tasks/Makefile.*

## Install native dependencies
deps:: packages/install/aws-vault packages/install/chamber
	@exit 0
