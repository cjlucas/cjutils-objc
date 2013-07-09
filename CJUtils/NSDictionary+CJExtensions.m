//
//  NSDictionary+CJExtensions.m
//  CJUtils
//
//  Created by Chris Lucas on 7/8/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import "NSDictionary+CJExtensions.h"

@implementation NSDictionary (CJExtensions)

- (id)nonNullObjectForKey:(id)key
{
    id object = [self objectForKey:key];
    return (object == [NSNull null]) ? nil : object;
}

@end
