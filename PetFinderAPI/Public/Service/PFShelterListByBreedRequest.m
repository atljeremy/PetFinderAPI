//
//  PFShelterListByBreedRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFShelterListByBreedRequest.h"

@implementation PFShelterListByBreedRequest

- (id)init {
    return [super initWithPath:@"shelter.listByBreed"];
}

- (void)setAnimal:(NSString *)animal
{
    _animal = animal;
    [self.params setObject:_animal forKey:kPetRecordAnimalKey];
}

- (void)setBreed:(NSString *)breed
{
    _breed = breed;
    [self.params setObject:_breed forKey:kPetRecordBreedKey];
}

- (void)setOffset:(NSString *)offset
{
    _offset = offset;
    [self.params setObject:_offset forKey:kPetRecordOffsetKey];
}

- (void)setCount:(NSNumber *)count
{
    _count = count;
    [self.params setObject:_count forKey:kPetRecordCountKey];
}

@end
