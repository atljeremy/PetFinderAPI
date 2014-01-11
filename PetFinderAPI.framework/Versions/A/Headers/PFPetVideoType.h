//
//  PFPetVideoType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/8/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* const kPetVideoIDKey;
NSString* const kPetVideoSizeKey;

@interface PFPetVideoType : NSObject

@property (nonatomic, strong, readonly) NSString* videoURL;
@property (nonatomic, strong, readonly) NSNumber* identifier;
@property (nonatomic, strong, readonly) NSString* size;

+ (instancetype)fromDictionary:(NSDictionary*)dict;

@end
