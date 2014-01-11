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
    return [super initWithPath:@"pet.find"];
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

- (void)setSize:(NSString *)size
{
    _size = size;
    [self.params setObject:_size forKey:kPetRecordSizeKey];
}

- (void)setSex:(NSString *)sex
{
    _sex = sex;
    [self.params setObject:_sex forKey:kPetRecordSexKey];
}

- (void)setLocation:(NSString *)location
{
    _location = location;
    [self.params setObject:_location forKey:kPetRecordLocationKey];
}

- (void)setAge:(NSString *)age
{
    _age = age;
    [self.params setObject:_age forKey:kPetRecordAgeKey];
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
