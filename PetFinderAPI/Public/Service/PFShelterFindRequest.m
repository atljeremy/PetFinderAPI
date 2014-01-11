//
//  PFShelterFindRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFShelterFindRequest.h"

@implementation PFShelterFindRequest

- (id)init {
    return [super initWithPath:@"shelter.find"];
}

- (void)setLocation:(NSString *)location
{
    _location = location;
    [self.params setObject:_location forKey:kPetRecordLocationKey];
}

- (void)setName:(NSString *)name
{
    _name = name;
    [self.params setObject:_name forKey:kPFAPINameKey];
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
