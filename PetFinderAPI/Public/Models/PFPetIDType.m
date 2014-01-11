//
//  PFPetIDType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetIDType.h"

@interface PFPetIDType()
@property (nonatomic, strong, readwrite) NSString* identifier;
@end

@implementation PFPetIDType

- (id)initWithID:(NSString*)id_ {
    if (self = [super init]) {
        _identifier = id_;
    }
    return self;
}

+ (instancetype)petIDTypeWithID:(NSString*)id_
{
    return [[self alloc] initWithID:id_];
}

@end
