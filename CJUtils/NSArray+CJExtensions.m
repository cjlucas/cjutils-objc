//
//  NSArray+CJExtensions.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "NSArray+CJExtensions.h"

@implementation NSArray (CJExtensions)

- (NSArray *)filterArrayUsingBlock:(CJFilterBlock)block
{
    NSMutableArray *filteredArray = [[NSMutableArray alloc] init];
    
    for (id object in self) {
        if (block(object)) {
            [filteredArray addObject:object];
        }
    }
    
    return [filteredArray copy];
}

@end
