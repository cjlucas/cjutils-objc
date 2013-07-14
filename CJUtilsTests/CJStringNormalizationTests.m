//
//  CJStringNormalizationTests.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CJStringNormalization.h"

#define CJAssertEqualStrings(s1, s2) \
    do { XCTAssertTrue([s1 isEqualToString:s2], @"String Mismatch: \"%@\" != \"%@\"", s1, s2); } \
    while (0)

@interface CJStringNormalizationTests : XCTestCase
@end

@implementation CJStringNormalizationTests

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

- (void)testCaseInsensitiveNormalization
{
    NSString *normalized = [CJStringNormalization normalizeString:@"SomEThInG" withOptions:CJStringNormalizationCaseInsensitivityOption];

    CJAssertEqualStrings(normalized, @"something");
}

- (void)testDiacriticInsensitiveNormalization
{
    NSString *normalized = [CJStringNormalization normalizeString:@"Çïńgular" withOptions:CJStringNormalizationDiacriticInsensitivityOption];
    
    CJAssertEqualStrings(normalized, @"Cingular");
}

- (void)testTrimWhitespaceNormalization
{
    NSString *normalized = [CJStringNormalization normalizeString:@"   look   at all   the space   "withOptions:CJStringNormalizationTrimWhitespaceOption];
    
    CJAssertEqualStrings(normalized, @"look   at all   the space");
}

- (void)testRemoveRedundantWhitespaceNormalization
{
    NSString *normalized = [CJStringNormalization normalizeString:@"so   many   spaces   " withOptions:CJStringNormalizationRemoveRedudantWhitespaceOption];
    
    CJAssertEqualStrings(normalized, @"so many spaces");
}

- (void)testRemoveAllWhtiespaceNormalization
{
    NSString *normalized = [CJStringNormalization normalizeString:@"  i   dont want any   whitespace   " withOptions:CJStringNormalizationRemoveAllWhitespaceOption];
    
    CJAssertEqualStrings(normalized, @"idontwantanywhitespace");
}

- (void)testAllNormalization
{
    NSString *prenorm = @"  Oh. My. God. Lôök at all thè chickens. If I had $1 for every chicken, I'd be riçh!   ";
    NSString *postnorm = @"ohmygodlookatallthechickensifihad1foreverychickenidberich";
    CJStringNormalizationOptions options = CJStringNormalizationCaseInsensitivityOption | CJStringNormalizationDiacriticInsensitivityOption | CJStringNormalizationRemovePunctuationOption | CJStringNormalizationRemoveSymbolsOption | CJStringNormalizationRemoveAllWhitespaceOption;
    NSString *normalized = [CJStringNormalization normalizeString:prenorm withOptions:options];
                                                                                        
    
    CJAssertEqualStrings(normalized, postnorm);
}

@end
