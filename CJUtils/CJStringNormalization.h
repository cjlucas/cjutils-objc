//
//  CJStringNormalization.h
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, CJStringNormalizationOptions) {
    CJStringNormalizationCaseInsensitivityOption        = 1 << 1,
    CJStringNormalizationDiacriticInsensitivityOption   = 1 << 2,
    CJStringNormalizationRemovePunctuationOption        = 1 << 3,
    CJStringNormalizationRemoveSymbolsOption            = 1 << 4,
    CJStringNormalizationTrimWhitespaceOption           = 1 << 5,
    CJStringNormalizationRemoveRedudantWhitespaceOption = 1 << 6,
    CJStringNormalizationRemoveAllWhitespaceOption      = 1 << 7,
};

CJStringNormalizationOptions CJStringNormalizationAllOptions;



@interface CJStringNormalization : NSObject

+ (NSString *)normalizeString:(NSString *)str;

+ (NSString *)normalizeString:(NSString *)str
                  withOptions:(CJStringNormalizationOptions)options;


@end
