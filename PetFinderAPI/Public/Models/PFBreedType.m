//
//  PFBreedType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFBreedType.h"

@interface PFBreedType()
@property (nonatomic, strong, readwrite) NSString* breed;
@end

@implementation PFBreedType

- (id)initWithBreed:(NSString*)breed {
    if (self = [super init]) {
        _breed = breed;
    }
    return self;
}

+ (instancetype)breedTypeWithBreed:(NSString*)breed
{
    return [[self alloc] initWithBreed:breed];
}

@end
