//
//  NSDateFormatter+CJExtensions.h
//  CJUtils
//
//  Created by Chris Lucas on 7/11/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

/*
 * Date Formats comply with LDML version tr35-25 (OS X 10.8 and iOS 6.0)
 * The LDML versions used by each OS are listed in the Date Formatting Guide
 */

#import <Foundation/Foundation.h>

typedef enum {
    NSDateFormatterISO8601TimeAndDateStandard = 0,
    NSDateFormatterRFC2822TimeAndDateStandard = 1,
    NSDateFormatterRFC3339TimeAndDateStandard = 2,
} NSDateFormatterTimeAndDateStandard;

@interface NSDateFormatter (CJExtensions)

+ (NSDateFormatter *)dateFormatterForTimeAndDateStandard:(NSDateFormatterTimeAndDateStandard)standard;

+ (NSDateFormatter *)iso8601;
+ (NSDateFormatter *)rfc2822;
+ (NSDateFormatter *)rfc3339;
@end