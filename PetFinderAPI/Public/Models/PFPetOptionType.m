//
//  PFOptionType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetOptionType.h"

@interface PFPetOptionType()
@property (nonatomic, strong, readwrite) NSString* option;
@end

@implementation PFPetOptionType

- (id)initWithOption:(NSString*)option {
    if (self = [super init]) {
        _option = option;
    }
    return self;
}

+ (instancetype)optionTypeWithOption:(NSString*)option
{
    return [[self alloc] initWithOption:option];
}

@end
