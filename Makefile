-include $(shell (which curl >/dev/null && curl -sSL -o .build-harness "https://git.io/build-harness"); echo .build-harness)

ARG = $(lastword $(subst /, ,$@))

include tasks/Makefile.*

## Install native dependencies
deps:: packages/install/aws-vault packages/install/chamber
	@exit 0
