//
//  PFPetVideoType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/8/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetVideoType.h"

NSString* const kPetVideoIDKey = @"@id";
NSString* const kPetVideoSizeKey = @"@size";

NSString* vURL(NSDictionary* dict)
{
    return [dict objectForKey:kPFAPIContentKey];
}

NSNumber* vID(NSDictionary* dict)
{
    return [dict objectForKey:kPetPhotoIDKey];
}

NSString* vSize(NSDictionary* dict)
{
    return [dict objectForKey:kPetPhotoSizeKey];
}

@interface PFPetVideoType()
@property (nonatomic, strong, readwrite) NSString* imageURL;
@property (nonatomic, strong, readwrite) NSNumber* identifier;
@property (nonatomic, strong, readwrite) NSString* size;
@end

@implementation PFPetVideoType

- (id)initWithVideoURL:(NSString*)imageURL imageID:(NSNumber*)imageID andSize:(NSString*)size {
    if (self = [super init]) {
        _videoURL = imageURL;
        _identifier = imageID;
        _size = size;
    }
    return self;
}

+ (instancetype)fromDictionary:(NSDictionary*)dict
{
    if (!dict || dict.allKeys.count == 0) {
        return nil;
    }
    
    return [[self alloc] initWithVideoURL:vURL(dict) imageID:vID(dict) andSize:vSize(dict)];
}

@end
