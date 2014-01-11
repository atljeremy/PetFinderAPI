//
//  PFShelterGetPetsRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFShelterGetPetsRequest : PFBaseRequest

/**
 * @return shelter ID (e.g. NJ94)
 */
@property (nonatomic, strong) NSString* shelterID;

/**
 * @return A=adoptable, H=hold, P=pending, X=adopted/removed
 */
@property (nonatomic, strong) NSString* status;

/**
 * @return offset into the result set (default is 0)
 */
@property (nonatomic, strong) NSString* offset;

/**
 * @return count integer optional. How many records to return for this particular API call (default is 25)
 */
@property (nonatomic, strong) NSNumber* count;

@end
