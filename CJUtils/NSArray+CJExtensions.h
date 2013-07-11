//
//  NSArray+CJExtensions.h
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+CJExtensions.h"

@interface NSArray (CJExtensions)

- (NSArray *)filterArrayUsingBlock:(NSArrayFilterBlock)block;

@end
