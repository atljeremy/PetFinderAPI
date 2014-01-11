//
//  PFPetGetRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetGetRequest.h"

@interface PFPetGetRequest()
@property (nonatomic, strong, readwrite) NSNumber* petID;
@end

@implementation PFPetGetRequest

- (id)initWithPetID:(NSNumber*)petID {
    if (self = [super initWithPath:@"pet.get"]) {
        _petID = petID;
        [self.params setObject:petID forKey:kPFAPIIDKey];
    }
    return self;
}

+ (instancetype)petGetRequestWithPetID:(NSNumber*)petID;
{
    return [[self alloc] initWithPetID:petID];
}

@end
