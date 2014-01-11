//
//  PFBreedListRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

// breed.list
// Returns a list of breeds for a particular animal.
// ARGUMENTS
// Name	Type	Required?	Description
// key	string	required	your developer key
// token	string	optional	session token
// animal	string	required	type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
// format	string	optional (default=xml)	Response format: xml, json

@interface PFBreedListRequest : PFBaseRequest

@property (nonatomic, strong, readonly) NSString* animal;

+ (instancetype)breedListRequestForAnimal:(NSString*)animal;

@end
