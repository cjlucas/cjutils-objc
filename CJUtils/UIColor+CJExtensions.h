//
//  UIColor+CJExtensions.h
//  
//
//  Created by Chris Lucas on 7/26/13.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (CJExtensions)

/*
 * From http://stackoverflow.com/questions/1243201/is-macro-better-than-uicolor-for-setting-rgb-color/7364572#7364572
 */
+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (UIColor *)colorWithHexValue:(NSInteger)hex;

@end
