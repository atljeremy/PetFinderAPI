//
//  PFShelterFindRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//location	string	required	the ZIP/postal code or city and state where the search should begin
//name
//offset	integer	optional	offset into the result set (default is 0)
//count	integer	optional	how many records to return for this particular API call (default is 25)

@interface PFShelterFindRequest : PFBaseRequest

/**
 * @return location string optional. The ZIP/postal code or city and state the animal should be located (NOTE: the closest possible animal will be selected)
 */
@property (nonatomic, strong) NSString* location;

/**
 * @return name. Optional if location is specified. Full or partial shelter name
 */
@property (nonatomic, strong) NSString* name;

/**
 * @return offset string optional. Set this to the value of lastOffset returned by a previous PFPetFindRequest, and it will retrieve the next result set
 */
@property (nonatomic, strong) NSString* offset;

/**
 * @return count integer optional. How many records to return for this particular API call (default is 25)
 */
@property (nonatomic, strong) NSNumber* count;


@end
