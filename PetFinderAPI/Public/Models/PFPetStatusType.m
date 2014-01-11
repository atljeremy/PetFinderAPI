//
//  PFPetStatusType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetStatusType.h"

@interface PFPetStatusType()
@property (nonatomic, strong, readwrite) NSString* status;
@end

@implementation PFPetStatusType

- (id)initWithStatus:(NSString*)status {
    if (self = [super init]) {
        _status = status;
    }
    return self;
}

+ (instancetype)statusTypeWithStatus:(NSString*)status
{
    return [[self alloc] initWithStatus:status];
}

@end
