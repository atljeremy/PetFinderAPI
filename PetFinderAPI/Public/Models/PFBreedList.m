//
//  PFBreedList.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFBreedList.h"

NSString* const kPetBreedListBreedsKey = @"breeds";
NSString* const kPetBreedListBreedKey = @"breed";
NSString* const kPetBreedListAnimalKey = @"@animal";

@implementation PFBreedList

- (id)initWithBreeds:(NSArray*)breeds forAnimal:(NSString*)animal {
    if (self = [super init]) {
        _breeds = breeds;
        _animal = animal;
    }
    return self;
}

+ (instancetype)breedListFromBreedsDictionary:(NSDictionary*)breeds
{
    if (!breeds || breeds.allKeys.count == 0) {
        return nil;
    }
    
    return [[self alloc] initWithBreeds:[self parseBreeds:breeds] forAnimal:[self parseAnimal:breeds]];
}

+ (NSString*)parseAnimal:(NSDictionary*)breedsDict
{
    return [breedsDict objectForKey:kPetBreedListAnimalKey];
}

+ (NSArray*)parseBreeds:(NSDictionary*)breedsDict
{
    id breeds = [breedsDict objectForKey:kPetBreedListBreedKey];
    NSMutableArray* breedsArray = [@[] mutableCopy];
    if ([breeds isNSArrayClass]) {
        /**
           Example:
           "breeds": {
               "breed": [
                 {
                   "$t": "Tortoiseshell"
                 },
                 {
                   "$t": "Domestic Medium Hair"
                 }
               ]
           },
         */
        
        for (NSDictionary* breed in [breeds allObjects]) {
            if (breed && breed.allKeys.count > 0) {
                [breedsArray addObject:[PFBreedType breedTypeWithBreed:[breed objectForKey:kPFAPIContentKey]]];
            }
        }
        
    } else if ([breeds isNSDictionaryClass]) {
        /**
           Exmaple:
           "breeds": {
               "breed": {
                   "$t": "Basset Hound"
               }
           },
         */
        
        [breedsArray addObject:[PFBreedType breedTypeWithBreed:[breeds objectForKey:kPFAPIContentKey]]];
        
    }
    return [breedsArray copy];
}

@end
