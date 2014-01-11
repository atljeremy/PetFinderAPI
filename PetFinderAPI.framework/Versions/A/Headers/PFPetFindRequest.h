//
//  PFPetFindRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFPetFindRequest : PFBaseRequest

/**
 * @return animal string optional. Type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
 */
@property (nonatomic, strong) NSString* animal;

/**
 * @return breed string optional. Breed of animal (use a PFBreedListRequest to retreive a list of valid breeds)
 */
@property (nonatomic, strong) NSString* breed;

/**
 * @return size string optional. Size of animal (S=small, M=medium, L=large, XL=extra-large)
 */
@property (nonatomic, strong) NSString* size;

/**
 * @return sex character optional. M=male, F=female
 */
@property (nonatomic, strong) NSString* sex;

/**
 * @return location string optional. The ZIP/postal code or city and state the animal should be located (NOTE: the closest possible animal will be selected)
 */
@property (nonatomic, strong) NSString* location;

/**
 * @return age string optional. Age of the animal (Baby, Young, Adult, Senior)
 */
@property (nonatomic, strong) NSString* age;

/**
 * @return offset string optional. Set this to the value of lastOffset returned by a previous PFPetFindRequest, and it will retrieve the next result set
 */
@property (nonatomic, strong) NSString* offset;

/**
 * @return count integer optional. How many records to return for this particular API call (default is 25)
 */
@property (nonatomic, strong) NSNumber* count;

@end
