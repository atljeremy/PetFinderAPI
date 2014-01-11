//
//  PFShelterGetRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFShelterGetRequest.h"

@interface PFShelterGetRequest()
@property (nonatomic, strong, readwrite) NSString* shelterID;
@end

@implementation PFShelterGetRequest

- (id)initWithShelterID:(NSString*)shelterID {
    if (self = [super initWithPath:@"shelter.get"]) {
        _shelterID = shelterID;
        [self.params setObject:_shelterID forKey:kPFAPIIDKey];
    }
    return self;
}

+ (instancetype)shelterGetRequestWithShelterID:(NSString*)shelterID
{
    return [[self alloc] initWithShelterID:shelterID];
}

@end
