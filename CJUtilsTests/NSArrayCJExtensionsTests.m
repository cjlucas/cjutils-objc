//
//  NSArrayCJExtensionsTests.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+CJExtensions.h"

@interface NSArrayCJExtensionsTests : XCTestCase

@end

@implementation NSArrayCJExtensionsTests

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

- (void)testFilterUsingBlock
{
    // Testing NSArray implementation
    NSArray *names = @[@"Christopher", @"Markus", @"Paul", @"Johnathan", @"James"];
    NSArrayFilterBlock longNamesBlock = ^ BOOL (NSString *object) { return [object length] > 5; };
    
    NSArray *filteredNames = [names filterArrayUsingBlock:longNamesBlock];
    
    XCTAssert([filteredNames count] == 3, @"expected count: 3, actual count: %lu", (unsigned long)[filteredNames count]);
    
    
    // Testing NSMutableArray implementation
    NSMutableArray *numbers = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
    NSArrayFilterBlock evenFilter = ^BOOL(NSNumber *object) { return [object intValue] % 2 == 0; };
    
    [numbers filterUsingBlock:evenFilter];
    
    XCTAssert([numbers count] == 2, @"expected count: 2, actual count: %lu", (unsigned long)[filteredNames count]);
}

@end
