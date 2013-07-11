//
//  NSMutableArray+CJExtensions.m
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "NSMutableArray+CJExtensions.h"

@implementation NSMutableArray (CJExtensions)

- (void)filterUsingBlock:(NSArrayFilterBlock)block
{
    NSMutableIndexSet *failedObjects = [[NSMutableIndexSet alloc] init];
    
    NSUInteger count = 0;
    for (id object in self) {
        if (!block(object)) {
            [failedObjects addIndex:count];
        }
        count += 1;
    }
    
    [self removeObjectsAtIndexes:failedObjects];
}

@end
