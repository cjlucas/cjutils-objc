//
//  CJStringNormalization.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "CJStringNormalization.h"

NSString * const CJStringNormalizationCaseInsensitivityKey = @"caseInsensitivity";
NSString * const CJStringNormalizationDiacriticInsensitivityKey = @"diacriticInsensitivity";
NSString * const CJStringNormalizationRemovePunctuationKey = @"removePunctuation";
NSString * const CJStringNormalizationRemoveSymbolsKey = @"removeSymbols";
NSString * const CJStringNormalizationTrimWhitespaceKey = @"trimWhitespace";
NSString * const CJStringNormalizationRemoveRedudantWhitespaceKey = @"removeRedundantWhitespace";
NSString * const CJStringNormalizationRemoveAllWhitespaceKey = @"removeAllWhitespace";

@interface CJStringNormalization ()

// this could probably go in it's own category
+ (NSString *)replaceCharactersInCharacterSet:(NSCharacterSet *)characterSet
                                   withString:(NSString *)replacementString
                                   fromString:(NSString *)string;

+ (NSString *)stripCharactersInCharacterSet:(NSCharacterSet *)characterSet
                                 fromString:(NSString *)string;

//+ (NSDictionary *)processNormalizationOptions:(NSDictionary *)options;
//+ (NSArray *)normalizationOptionsKeys;

@end


@implementation CJStringNormalization

+ (NSString *)replaceCharactersInCharacterSet:(NSCharacterSet *)characterSet
                                   withString:(NSString *)replacementString
                                   fromString:(NSString *)string
{
    NSArray *stringComponents = [string componentsSeparatedByCharactersInSet:characterSet];
    return [stringComponents componentsJoinedByString:replacementString];
}

+ (NSString *)stripCharactersInCharacterSet:(NSCharacterSet *)characterSet
                                 fromString:(NSString *)string
{
    return [self replaceCharactersInCharacterSet:characterSet withString:@"" fromString:string];
}


+ (NSString *)normalizeString:(NSString *)str
{
    return nil;
}

/*
 * NOTE: the next two methods are not actually necessary because 
 * the boolValue of nil typecast to an NSNumber is NO
 */

//+ (NSArray *)normalizationOptionsKeys
//{
//    return @[CJStringNormalizationCaseInsensitivityKey,
//      CJStringNormalizationDiacriticInsensitivityKey,
//      CJStringNormalizationRemovePunctuationKey,
//      CJStringNormalizationRemoveSymbolsKey,
//      CJStringNormalizationTrimWhitespaceKey,
//      CJStringNormalizationRemoveRedudantWhitespaceKey,
//      CJStringNormalizationRemoveAllWhitespaceKey,
//      ];
//}

/*
 * Ensures all options are inserted (defaults to NO)
 */
//+ (NSDictionary *)processNormalizationOptions:(NSDictionary *)options
//{
//    NSMutableDictionary *mutableOptions = [options mutableCopy];
//    
//    for (NSString *normalizationOptionKey in [self normalizationOptionsKeys]) {
//        id obj = [options objectForKey:normalizationOptionKey];
//        if (obj == nil) {
//            [mutableOptions setValue:@NO forKey:normalizationOptionKey];
//        }
//    }
//    
//    return [mutableOptions copy];
//}

+ (NSString *)normalizeString:(NSString *)str withOptions:(NSDictionary *)options
{
    NSString *output = str;
    
    if ([(NSNumber *)[options objectForKey:CJStringNormalizationCaseInsensitivityKey] boolValue]) {
        output = [output lowercaseString];
    }
    
    if ([(NSNumber *)[options objectForKey:CJStringNormalizationDiacriticInsensitivityKey] boolValue]) {
        NSData *asciiData = [output dataUsingEncoding:NSASCIIStringEncoding
                                 allowLossyConversion:YES];
        
        output = [[NSString alloc] initWithData:asciiData
                                       encoding:NSASCIIStringEncoding];
    }
    
    if ([(NSNumber *)[options objectForKey:CJStringNormalizationRemovePunctuationKey] boolValue]) {
        output = [self stripCharactersInCharacterSet:[NSCharacterSet punctuationCharacterSet]
                                          fromString:output];
    }
    
    if ([(NSNumber *)[options objectForKey:CJStringNormalizationCaseInsensitivityKey] boolValue]) {
        output = [output lowercaseString];
    }
    
    if ([(NSNumber *)[options objectForKey:CJStringNormalizationRemoveSymbolsKey] boolValue]) {
        output = [self stripCharactersInCharacterSet:[NSCharacterSet symbolCharacterSet]
                                          fromString:output];
    }
    
    if ([(NSNumber *)[options objectForKey:CJStringNormalizationTrimWhitespaceKey] boolValue]) {
        output = [output stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    
    return output;
}

@end
