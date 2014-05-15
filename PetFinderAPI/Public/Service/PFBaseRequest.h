//
//  PFBaseRequest.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/8/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFBaseRequest : NSObject

/**
 * @return The baseURL of the Pet Finder API. Readonly.
 */
@property (nonatomic, strong, readonly) NSString* baseURL;

/**
 * @return Pet Finder authentication token to use for signing requests. Optional, Readonly.
 */
@property (nonatomic, strong, readonly) NSString* token;

/**
 * @return The key value pairs to use when making requests to the Pet Finder API.
 */
@property (nonatomic, strong) NSMutableDictionary* params;

/**
 * @return The specific path for the request. This is the part of the URL immediately following the baseURL. For example: pet.get is the path for the following request http://api.petfinder.com/pet.get?key=someAPIKey&format=json&id=27864848
 */
@property (nonatomic, strong) NSString* path;

/**
 * @return output string optional (default=full). How much of the pet record to return: id, basic, full
 */
@property (nonatomic, strong) NSString* output;

- (instancetype)initWithPath:(NSString*)path_;

- (NSString*)urlWithParams;

@end
