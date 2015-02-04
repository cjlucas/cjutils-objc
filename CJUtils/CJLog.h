//
//  CJLog.h
//  CJUtils
//
//  Created by Chris Lucas on 7/9/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#include "string.h"

#ifndef CJUtils_CJLog_h
#define CJUtils_CJLog_h

#define BASEFILENAME (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)
#define CJLog(fmt, ...) do { NSLog(@"[%s:%d] %s " fmt, BASEFILENAME, __LINE__, __PRETTY_FUNCTION__, __VA_ARGS__); } while(0)

#endif
