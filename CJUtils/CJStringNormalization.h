//
//  CJStringNormalization.h
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString * const CJStringNormalizationCaseInsensitivityKey;
NSString * const CJStringNormalizationDiacriticInsensitivityKey;
NSString * const CJStringNormalizationRemovePunctuationKey;
NSString * const CJStringNormalizationRemoveSymbolsKey;
NSString * const CJStringNormalizationTrimWhitespaceKey;
NSString * const CJStringNormalizationRemoveRedudantWhitespaceKey; // not implemented
NSString * const CJStringNormalizationRemoveAllWhitespaceKey; // not implemented

@interface CJStringNormalization : NSObject

+ (NSString *)normalizeString:(NSString *)str;

+ (NSString *)normalizeString:(NSString *)str
                  withOptions:(NSDictionary *)options;


@end
