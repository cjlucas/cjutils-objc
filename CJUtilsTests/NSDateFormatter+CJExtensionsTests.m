//
//  NSDateFormatter+CJExtensionsTests.m
//  CJUtils
//
//  Created by Chris Lucas on 7/11/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSDateFormatter+CJExtensions.h"

@interface NSDateFormatter_CJExtensionsTests : XCTestCase

@end

@implementation NSDateFormatter_CJExtensionsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testCases:(NSDictionary *)cases withDateFormatter:(NSDateFormatter *)formatter
{
    [cases enumerateKeysAndObjectsUsingBlock:^(NSString *dateString, NSNumber *expectedNumber, BOOL *stop) {
        NSDate *date = [formatter dateFromString:dateString];
        NSTimeInterval expectedTimeInterval = [expectedNumber doubleValue];
        NSTimeInterval actualTimeInterval = [date timeIntervalSince1970];
        
        XCTAssertEquals(expectedTimeInterval, actualTimeInterval, @"dateString = %@", dateString);
        
    }];
}

- (void)testISO8601DateFormatter
{
    NSDictionary *cases = @{
                            @"1988-11-07T12:25:01Z"         : @594908701.0,
                            @"1988-11-07T04:25:01-08:00"    : @594908701.0,
                            };
    [self testCases:cases withDateFormatter:[NSDateFormatter iso8601]];
}

- (void)testRFC2822DateFormatter
{
    NSDictionary *cases = @{
                            @"Mon, 7 Nov 1988 12:25:01 UTC"     : @594908701.0,
                            @"Mon, 07 Nov 1988 12:25:01 +00:00" : @594908701.0,
                            @"Fri, 22 Nov 1963 12:30:00 CST"    : @-192778200.0,
                            @"Fri, 22 Nov 63 12:30:00 -06:00"   : @-192778200.0,
                            };
    
    [self testCases:cases withDateFormatter:[NSDateFormatter rfc2822]];
}

- (void)testRFC3339DateFormatter
{
    NSDictionary *cases = @{
                            @"1988-11-07T12:25:01Z"         : @594908701.0,
                            @"1988-11-07T04:25:01-08:00"    : @594908701.0,
                            @"1963-11-22T12:30:00-06:00"    : @-192778200.0,
                            };
    
    [self testCases:cases withDateFormatter:[NSDateFormatter rfc3339]];
}

@end
