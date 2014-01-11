//
//  PFOptionList.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetOptionList.h"

@implementation PFPetOptionList

- (id)initWithPetOptions:(NSArray*)options {
    if (self = [super init]) {
        _options = options;
    }
    return self;
}

+ (instancetype)optionsListFromOptions:(id)options
{
    if (!options) {
        return nil;
    }
    
    return [[self alloc] initWithPetOptions:[self parseOptions:options]];
}

+ (NSArray*)parseOptions:(id)options
{
    NSMutableArray* optionsArray = [@[] mutableCopy];
    if ([options isNSArrayClass]) {
        
        for (NSDictionary* optionDict in [options allObjects]) {
            if (optionDict && optionDict.allKeys.count > 0) {
                [optionsArray addObject:[PFPetOptionType optionTypeWithOption:[optionDict objectForKey:kPFAPIContentKey]]];
            }
        }
        
    } else if ([options isNSDictionaryClass]) {

        [optionsArray addObject:[PFPetOptionType optionTypeWithOption:[options objectForKey:kPFAPIContentKey]]];
        
    }
    return [optionsArray copy];
}


@end
