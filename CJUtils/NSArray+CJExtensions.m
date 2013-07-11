//
//  NSArray+CJExtensions.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "NSArray+CJExtensions.h"

@implementation NSArray (CJExtensions)

- (NSArray *)filterArrayUsingBlock:(NSArrayFilterBlock)block
{
    NSMutableArray *filteredArray = [self mutableCopy];
    
    [filteredArray filterUsingBlock:block];
    
    return [filteredArray copy];
}

@end
