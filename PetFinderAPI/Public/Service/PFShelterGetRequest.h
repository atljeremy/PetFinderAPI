//
//  PFShelterGetRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFShelterGetRequest : PFBaseRequest

@property (nonatomic, strong, readonly) NSString* shelterID;

+ (instancetype)shelterGetRequestWithShelterID:(NSString*)shelterID;

@end
