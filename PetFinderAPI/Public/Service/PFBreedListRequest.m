//
//  PFBreedListRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFBreedListRequest.h"

@interface PFBreedListRequest()
@property (nonatomic, strong, readwrite) NSString* animal;
@end

@implementation PFBreedListRequest

- (id)initWithAnimal:(NSString*)animal {
    if (self = [super initWithPath:@"breed.list"]) {
        _animal = animal;
        [self.params setObject:_animal forKey:kPetRecordAnimalKey];
    }
    return self;
}

+ (instancetype)breedListRequestForAnimal:(NSString*)animal
{
    return [[self alloc] initWithAnimal:animal];
}

@end
