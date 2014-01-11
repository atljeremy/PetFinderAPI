//
//  PFPetMediaType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetMediaType.h"

typedef NS_ENUM(NSInteger, PFMediaType) {
    PFMediaTypePhoto,
    PFMediaTypeVideo
};

NSString* const kPetMediaPhotosIDKey = @"photos";
NSString* const kPetMediaPhotoIDKey = @"photo";
NSString* const kPetMediaVideosIDKey = @"videos";
NSString* const kPetMediaVideoIDKey = @"video";

@interface PFPetMediaType()
@property (nonatomic, strong, readwrite) NSArray* photos;
@end

@implementation PFPetMediaType

- (id)initWithPhotos:(NSArray*)photos andVideos:(NSArray*)videos {
    if (self = [super init]) {
        _photos = photos;
        _videos = videos;
    }
    return self;
}

+ (instancetype)mediaTypeWithMediaDictionary:(NSDictionary*)mediaDict
{
    if (!mediaDict || mediaDict.allKeys.count == 0) {
        return nil;
    }
    
    NSArray* photos = [self parseMediaFor:PFMediaTypePhoto fromDictionary:mediaDict];
    NSArray* videos = [self parseMediaFor:PFMediaTypeVideo fromDictionary:mediaDict];
    return [[self alloc] initWithPhotos:photos andVideos:videos];
}

+ (NSArray*)parseMediaFor:(PFMediaType)type fromDictionary:(NSDictionary*)media
{
    NSString* typesKey;
    NSString* typeKey;
    Class MediaType;
    switch (type) {
        case PFMediaTypePhoto:
            typesKey = kPetMediaPhotosIDKey;
            typeKey = kPetMediaPhotoIDKey;
            MediaType = [PFPetPhotoType class];
            break;
            
        case PFMediaTypeVideo:
            typesKey = kPetMediaVideosIDKey;
            typeKey = kPetMediaVideoIDKey;
            MediaType = [PFPetVideoType class];
            break;
            
        default:
            break;
    }
    
    
    NSDictionary* typeDict = [media objectForKey:typesKey];
    if (!typeDict || typeDict.allKeys.count == 0) {
        return nil;
    }
    
    id typeObject = [typeDict objectForKey:typeKey];
    if (!typeObject) {
        return nil;
    }
    
    NSMutableArray* typeArray = [@[] mutableCopy];
    if ([typeObject isNSArrayClass]) {

        for (NSDictionary* itemDict in typeObject) {
            [typeArray addObject:[MediaType fromDictionary:itemDict]];
        }
        
    } else if ([typeObject isNSDictionaryClass]) {

        [typeArray addObject:[MediaType fromDictionary:typeObject]];
        
    }
    return [typeArray copy];
}

@end
