//
//  NSDateFormatter+CJExtensions.m
//  CJUtils
//
//  Created by Chris Lucas on 7/11/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "NSDateFormatter+CJExtensions.h"

NSString * const DateFormatForISO8601TimeAndDateStandard = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
NSString * const DateFormatForRFC2822TimeAndDateStandard = @"EEE',' dd MMM yyyy HH:mm:ss zzz";

@implementation NSDateFormatter (CJExtensions)

+ (NSDateFormatter *)dateFormatterForTimeAndDateStandard:(NSDateFormatterTimeAndDateStandard)standard
{
    NSDateFormatter *dateFormatter = nil;
    NSString *dateFormat = nil;
    
    switch (standard) {
        case NSDateFormatterISO8601TimeAndDateStandard:
            dateFormat = DateFormatForISO8601TimeAndDateStandard;
            break;
        case NSDateFormatterRFC2822TimeAndDateStandard:
            dateFormat = DateFormatForRFC2822TimeAndDateStandard;
            break;
        case NSDateFormatterRFC3339TimeAndDateStandard:
            // going to treat these as the same for now
            dateFormat = DateFormatForISO8601TimeAndDateStandard;
    };
    
    assert(dateFormat != nil);
    
    // initWithDateFormat:allowNaturalLanguage: doesn't work with fixed formats
    // See: Data Formatting Guide
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (NSDateFormatter *)iso8601
{
    return [self dateFormatterForTimeAndDateStandard:NSDateFormatterISO8601TimeAndDateStandard];
}

+ (NSDateFormatter *)rfc2822
{
    return [self dateFormatterForTimeAndDateStandard:NSDateFormatterRFC2822TimeAndDateStandard];
}

+ (NSDateFormatter *)rfc3339
{
    return [self dateFormatterForTimeAndDateStandard:NSDateFormatterRFC3339TimeAndDateStandard];
}


@end
