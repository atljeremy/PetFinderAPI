//
//  PFPetAgeType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetAgeType.h"

@interface PFPetAgeType()
@property (nonatomic, strong, readwrite) NSString* age;
@end

@implementation PFPetAgeType

- (id)initWithAge:(NSString*)age {
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

+ (instancetype)ageTypeWithAge:(NSString*)age
{
    return [[self alloc] initWithAge:age];
}

@end
