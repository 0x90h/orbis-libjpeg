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

CompilerFlags += -MD -MP    #-DLIBJPEG_EA_SUPPORT_ENABLED

$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

#jconfig.h jerror.h jmemsys.h jmorecfg.h jpeglib.h jsupport_ea.h 
install:
	@cp $(OutPath)/$(TargetFile).a $(Ps4Sdk)/lib
	@cp include/jconfig.h $(Ps4Sdk)/include
	@cp include/jerror.h $(Ps4Sdk)/include
	@cp include/jmemsys.h $(Ps4Sdk)/include
	@cp include/jmorecfg.h $(Ps4Sdk)/include
	@cp include/jpeglib.h $(Ps4Sdk)/include
	@cp include/jsupport_ea.h $(Ps4Sdk)/include
	@echo "Installed!" 