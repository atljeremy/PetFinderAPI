//
//  PFShelterGetPetsRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFShelterGetPetsRequest.h"

@implementation PFShelterGetPetsRequest

- (id)init {
    return [super initWithPath:@"shelter.getPets"];
}

- (void)setShelterID:(NSString *)shelterID
{
    _shelterID = shelterID;
    [self.params setObject:_shelterID forKey:kPFAPIIDKey];
}

- (void)setStatus:(NSString *)status
{
    _status = status;
    [self.params setObject:_status forKey:kPFAPIStatusKey];
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
