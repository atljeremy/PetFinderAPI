//
//  PFPetGetRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFPetGetRequest : PFBaseRequest

@property (nonatomic, strong, readonly) NSNumber* petID;

+ (instancetype)petGetRequestWithPetID:(NSNumber*)petID;

@end
