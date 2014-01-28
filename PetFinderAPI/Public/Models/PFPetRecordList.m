//
//  PFPetRecordList.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetRecordList.h"

static NSString* const kPetRecordListLastOffsetKey = @"lastOffset";

@implementation PFPetRecordList

- (id)initWithPets:(NSArray*)pets forLastOffset:(NSNumber*)lastOffset {
    if (self = [super init]) {
        _pets = pets;
        _lastOffset = lastOffset;
    }
    return self;
}

+ (instancetype)petRecordListFromDictionary:(NSDictionary*)petDict
{
    if (!petDict || petDict.allKeys.count == 0) {
        return nil;
    }
    
    return [[self alloc] initWithPets:[self parsePets:petDict] forLastOffset:[self parseLastOffset:petDict]];
}

+ (instancetype)petRecordListWithPets:(NSArray*)pets andLastOffset:(NSNumber*)lastOffset
{
    if (!pets || pets.count == 0 || !lastOffset) {
        return nil;
    }
    
    return [[self alloc] initWithPets:pets forLastOffset:lastOffset];
}

+ (NSNumber*)parseLastOffset:(NSDictionary*)petDict
{
    return [[petDict objectForKey:kPetRecordListLastOffsetKey] objectForKey:kPFAPIContentKey];
}

+ (NSArray*)parsePets:(NSDictionary*)petDict
{
    id pets = [[petDict objectForKey:kPetRecordPetsKey] objectForKey:kPetRecordPetKey];
    NSMutableArray* petsArray = [@[] mutableCopy];
    if ([pets isNSArrayClass]) {
        
        for (NSDictionary* pet in [pets allObjects]) {
            if (pet && pet.allKeys.count > 0) {
                [petsArray addObject:[PFPetRecord petRecordFromDictionary:pet]];
            }
        }
        
    } else if ([pets isNSDictionaryClass]) {
        
        [petsArray addObject:[PFPetRecord petRecordFromDictionary:pets]];
        
    }
    return petsArray;
}


@end
