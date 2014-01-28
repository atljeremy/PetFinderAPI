//
//  PFPetFindRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetFindRequest.h"

@implementation PFPetFindRequest

- (id)init {
    if (self = [super initWithPath:@"pet.find"]) {
    }
    return self;
}

- (void)setAnimal:(NSString *)animal
{
    _animal = animal;
    if (_animal && _animal.length > 0) {
        [self.params setObject:_animal forKey:kPetRecordAnimalKey];
    } else {
        [self.params removeObjectForKey:kPetRecordAnimalKey];
    }
}

- (void)setBreed:(NSString *)breed
{
    _breed = breed;
    if (_breed && _breed.length > 0) {
        [self.params setObject:_breed forKey:kPetRecordBreedKey];
    } else {
        [self.params removeObjectForKey:kPetRecordBreedKey];
    }
}

- (void)setSize:(NSString *)size
{
    _size = size;
    if (_size && _size.length > 0) {
        [self.params setObject:_size forKey:kPetRecordSizeKey];
    } else {
        [self.params removeObjectForKey:kPetRecordSizeKey];
    }
}

- (void)setSex:(NSString *)sex
{
    _sex = sex;
    if (_sex && _sex.length > 0) {
        [self.params setObject:_sex forKey:kPetRecordSexKey];
    } else {
        [self.params removeObjectForKey:kPetRecordSexKey];
    }
}

- (void)setLocation:(NSString *)location
{
    _location = location;
    if (_location && _location.length > 0) {
        [self.params setObject:_location forKey:kPetRecordLocationKey];
    } else {
        [self.params removeObjectForKey:kPetRecordLocationKey];
    }
}

- (void)setAge:(NSString *)age
{
    _age = age;
    if (_age && _age.length > 0) {
        [self.params setObject:_age forKey:kPetRecordAgeKey];
    } else {
        [self.params removeObjectForKey:kPetRecordAgeKey];
    }
}

- (void)setOffset:(NSString *)offset
{
    _offset = offset;
    if (_offset && _offset.length > 0) {
        [self.params setObject:_offset forKey:kPetRecordOffsetKey];
    } else {
        [self.params removeObjectForKey:kPetRecordOffsetKey];
    }
}

- (void)setCount:(NSNumber *)count
{
    _count = count;
    if (_count && _count.intValue > 0) {
        [self.params setObject:_count forKey:kPetRecordCountKey];
    } else {
        [self.params removeObjectForKey:kPetRecordCountKey];
    }
}

@end
