//
//  NSArray+Extras.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/10/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "NSArray+Extras.h"

@implementation NSArray (Extras)

- (id)randomObject
{
    if (self.count == 0) {
        return nil;
    }
    return [self objectAtIndex:arc4random() % self.count];
}

@end
