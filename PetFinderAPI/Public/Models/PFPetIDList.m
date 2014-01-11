//
//  PFPetIDList.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetIDList.h"

@implementation PFPetIDList

- (id)initWithPetIDs:(NSArray*)petIds {
    if (self = [super init]) {
        _petIDs = petIds;
    }
    return self;
}

+ (instancetype)petIDListWithPetIDs:(NSArray*)petIds
{
    return [[self alloc] initWithPetIDs:petIds];
}

@end
