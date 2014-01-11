//
//  NSObject+Extras.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "NSObject+Extras.h"

@implementation NSObject (Extras)

- (BOOL)isNSArrayClass
{
    return [self isKindOfClass:[NSArray class]];
}

- (BOOL)isNSDictionaryClass
{
    return [self isKindOfClass:[NSDictionary class]];
}

@end
