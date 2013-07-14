//
//  CJStringNormalization.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "CJStringNormalization.h"

CJStringNormalizationOptions CJStringNormalizationAllOptions =
CJStringNormalizationCaseInsensitivityOption |
CJStringNormalizationDiacriticInsensitivityOption |
CJStringNormalizationRemovePunctuationOption |
CJStringNormalizationRemoveSymbolsOption |
CJStringNormalizationRemoveAllWhitespaceOption;

@interface CJStringNormalization ()

// this could probably go in it's own category
+ (NSString *)replaceCharactersInCharacterSet:(NSCharacterSet *)characterSet
                                   withString:(NSString *)replacementString
                                   fromString:(NSString *)string;

+ (NSString *)stripCharactersInCharacterSet:(NSCharacterSet *)characterSet
                                 fromString:(NSString *)string;

+ (NSArray *)componentsOfString:(NSString *)string
     separatedByCharactersInSet:(NSCharacterSet *)characterSet
             removeEmptyStrings:(BOOL)removeEmptyStrings;
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
    return [CJStringNormalization normalizeString:str withOptions:CJStringNormalizationAllOptions];
}

+ (NSArray *)componentsOfString:(NSString *)string
     separatedByCharactersInSet:(NSCharacterSet *)characterSet
             removeEmptyStrings:(BOOL)removeEmptyStrings
{
    NSArray *split = [string componentsSeparatedByCharactersInSet:characterSet];
    if (removeEmptyStrings) {
        split = [split filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 0"]];
    }
    
    return split;
}

+ (NSString *)normalizeString:(NSString *)str withOptions:(CJStringNormalizationOptions)options
{
    NSString *output = str;
    
    if (options & CJStringNormalizationCaseInsensitivityOption) {
        output = [output lowercaseString];
    }
    
    if (options & CJStringNormalizationDiacriticInsensitivityOption) {
        NSData *asciiData = [output dataUsingEncoding:NSASCIIStringEncoding
                                 allowLossyConversion:YES];
        
        output = [[NSString alloc] initWithData:asciiData
                                       encoding:NSASCIIStringEncoding];
    }
    
    if (options & CJStringNormalizationRemovePunctuationOption) {
        output = [self stripCharactersInCharacterSet:[NSCharacterSet punctuationCharacterSet]
                                          fromString:output];
    }
    
    if (options & CJStringNormalizationRemoveSymbolsOption) {
        output = [self stripCharactersInCharacterSet:[NSCharacterSet symbolCharacterSet]
                                          fromString:output];
    }
    
    /*
     * Each of the following whitespace normalizations are mutually exclusive
     * Remove redundant whitespace will also trim string of whitespace
     */
    
    if (options & CJStringNormalizationRemoveAllWhitespaceOption) {
        NSArray *split = [self componentsOfString:output separatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet] removeEmptyStrings:YES];
        output = [split componentsJoinedByString:@""];
        
    } else if (options & CJStringNormalizationRemoveRedudantWhitespaceOption) {
        NSArray *split = [self componentsOfString:output separatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet] removeEmptyStrings:YES];
        output = [split componentsJoinedByString:@" "];
        
    } else if (options & CJStringNormalizationTrimWhitespaceOption) {
        output = [output stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    
    return output;
}

@end
