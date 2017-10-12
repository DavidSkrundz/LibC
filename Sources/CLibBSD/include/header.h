#if defined(__linux__)
	#include "Linux.h"
#endif

#if defined(__APPLE__) && defined(__MACH__)
	#include <TargetConditionals.h>
	#if TARGET_OS_MAC == 1
		#include "macOS.h"
	#endif
#endif
