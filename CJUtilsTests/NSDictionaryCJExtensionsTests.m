//
//  NSDictionaryCJExtensionsTests.m
//  CJUtils
//
//  Created by Chris Lucas on 7/8/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSDictionary+CJExtensions.h"

@interface NSDictionaryCJExtensionsTests : XCTestCase
@property NSDictionary *testDictionary;
@end

@implementation NSDictionaryCJExtensionsTests

- (void)setUp
{
    [super setUp];
    self.testDictionary =  @{
      @"nullObject" : [NSNull null],
      @"actualObject" : @"HI",
      };
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTAssertNil([self.testDictionary nonNullObjectForKey:@"nullObject"], @"check if NSNull object is returned as nil");
    XCTAssertEqual([self.testDictionary objectForKey:@"actualObject"],
                    [self.testDictionary nonNullObjectForKey:@"actualObject"],
                    @"check if ");
}

@end
