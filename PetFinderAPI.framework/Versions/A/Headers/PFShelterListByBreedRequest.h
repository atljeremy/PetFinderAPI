//
//  PFShelterListByBreedRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//animal	string	required	type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
//breed	string	required	greed of animal(use breed.list for a list of valid breeds)
//offset	integer	optional	offset into the result set (default is 0)
//count	integer	optional	how many records to return for this particular API call (default is 25)

@interface PFShelterListByBreedRequest : PFBaseRequest

/**
 * @return type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
 */
@property (nonatomic, strong) NSString* animal;

/**
 * @return breed of animal (use PFBreedListRequest for a list of valid breeds)
 */
@property (nonatomic, strong) NSString* breed;

/**
 * @return offset into the result set (default is 0)
 */
@property (nonatomic, strong) NSString* offset;

/**
 * @return count integer optional. How many records to return for this particular API call (default is 25)
 */
@property (nonatomic, strong) NSNumber* count;

@end
