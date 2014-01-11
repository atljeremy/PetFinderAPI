//
//  PFPetSizeType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetSizeType.h"

@interface PFPetSizeType()
@property (nonatomic, strong, readwrite) NSString* size;
@end

@implementation PFPetSizeType

- (id)initWithPetSize:(NSString*)size {
    if (self = [super init]) {
        _size = size;
    }
    return self;
}

+ (instancetype)sizeTypeWithSize:(NSString*)size
{
    return [[self alloc] initWithPetSize:size];
}

@end
