//
//  PFPetGetRandomRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFPetGetRandomRequest : PFPetFindRequest

/**
 * @return shelterid string optional. ID of the shelter that posted the pet
 */
@property (nonatomic, strong) NSString* shelterid;

@end
