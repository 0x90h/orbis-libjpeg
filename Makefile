ifndef Ps4Sdk
ifdef ps4sdk
Ps4Sdk := $(ps4sdk)
endif
ifdef PS4SDK
Ps4Sdk := $(PS4SDK)
endif
ifndef Ps4Sdk
$(error Neither PS4SDK, Ps4Sdk nor ps4sdk set)
endif
endif

target := ps4_lib
OutPath := lib
TargetFile := libjpeg
AllTarget = $(OutPath)/$(TargetFile).a

include $(Ps4Sdk)/make/ps4sdk.mk

CompilerFlags += #-DLIBJEG_JSUPPORT_EA_H

$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

