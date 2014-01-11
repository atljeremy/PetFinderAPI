//
//  PFShelterRecordList.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFShelterRecordList.h"

@interface PFShelterRecordList()
@property (nonatomic, strong, readwrite) NSArray* shelters;
@end

@implementation PFShelterRecordList

- (id)initWithShelters:(NSArray*)shelters {
    if (self = [super init]) {
        _shelters = shelters;
    }
    return self;
}

+ (instancetype)shelterRecordListFromDictionary:(NSDictionary*)shelterDict
{
    if (!shelterDict || shelterDict.allKeys.count == 0) {
        return nil;
    }
    
    return [[self alloc] initWithShelters:[self parseShelters:shelterDict]];
}

+ (NSArray*)parseShelters:(NSDictionary*)shelterDict
{
    id shelters = [[shelterDict objectForKey:kShelterRecordSheltersKey] objectForKey:kShelterRecordShelterKey];
    NSMutableArray* petsArray = [@[] mutableCopy];
    if ([shelters isNSArrayClass]) {
        
        for (NSDictionary* shelter in [shelters allObjects]) {
            if (shelter && shelter.allKeys.count > 0) {
                [petsArray addObject:[PFShelterRecord shelterRecordFromDictionary:shelter]];
            }
        }
        
    } else if ([shelters isNSDictionaryClass]) {
        
        [petsArray addObject:[PFPetRecord petRecordFromDictionary:shelters]];
        
    }
    return [petsArray copy];
}

@end
