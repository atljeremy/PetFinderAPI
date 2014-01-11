//
//  PFOptionList.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFPetOptionList : NSObject

@property (nonatomic, strong, readonly) NSArray* options;

+ (instancetype)optionsListFromOptions:(id)options;

@end
