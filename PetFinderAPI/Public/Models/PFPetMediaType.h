//
//  PFPetMediaType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kPetMediaPhotosIDKey;
extern NSString* const kPetMediaPhotoIDKey;
extern NSString* const kPetMediaVideosIDKey;
extern NSString* const kPetMediaVideoIDKey;

@interface PFPetMediaType : NSObject

@property (nonatomic, strong, readonly) NSArray* photos;
@property (nonatomic, strong, readonly) NSArray* videos;

+ (instancetype)mediaTypeWithMediaDictionary:(NSDictionary*)mediaDict;
+ (instancetype)mediaTypeWithPhotos:(NSArray*)photos;
+ (instancetype)mediaTypeWithVideos:(NSArray*)videos;

@end
