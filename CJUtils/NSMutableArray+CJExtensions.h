//
//  NSMutableArray+CJExtensions.h
//  CJUtils
//
//  Created by Chris Lucas on 7/10/13.
//  Copyright (c) 2013 Chris Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^NSArrayFilterBlock)(id);

@interface NSMutableArray (CJExtensions)

- (void)filterUsingBlock:(NSArrayFilterBlock)block;

@end
