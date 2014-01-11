//
//  PFPetGenderType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetGenderType.h"

@interface PFPetGenderType()
@property (nonatomic, strong, readwrite) NSString* gender;
@end

@implementation PFPetGenderType

- (id)initWithGender:(NSString*)gender {
    if (self = [super init]) {
        _gender = gender;
    }
    return self;
}

+ (instancetype)genderTypeWithGender:(NSString*)gender
{
    return [[self alloc] initWithGender:gender];
}

@end
