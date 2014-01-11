//
//  PFAnimalType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFAnimalType.h"

@interface PFAnimalType()
@property (nonatomic, strong, readwrite) NSString* animal;
@end

@implementation PFAnimalType

- (id)initWithAnimal:(NSString*)animal {
    if (self = [super init]) {
        _animal = animal;
    }
    return self;
}

+ (instancetype)animalTypeWithAnimal:(NSString*)animal
{
    return [[self alloc] initWithAnimal:animal];
}

- (NSString*)animal
{
    if (_animal) {
        return _animal;
    }
    return @"Unkown";
}

@end
