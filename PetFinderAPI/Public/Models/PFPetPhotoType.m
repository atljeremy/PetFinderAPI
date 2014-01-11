//
//  PFPetPhotoType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetPhotoType.h"

NSString* const kPetPhotoIDKey = @"@id";
NSString* const kPetPhotoSizeKey = @"@size";

NSString* iURL(NSDictionary* dict)
{
    return [dict objectForKey:kPFAPIContentKey];
}

NSNumber* iID(NSDictionary* dict)
{
    return [dict objectForKey:kPetPhotoIDKey];
}

NSString* iSize(NSDictionary* dict)
{
    return [dict objectForKey:kPetPhotoSizeKey];
}

@interface PFPetPhotoType()
@property (nonatomic, strong, readwrite) NSString* imageURL;
@property (nonatomic, strong, readwrite) NSNumber* identifier;
@property (nonatomic, strong, readwrite) NSString* size;
@end

@implementation PFPetPhotoType

- (id)initWithImageURL:(NSString*)imageURL imageID:(NSNumber*)imageID andSize:(NSString*)size {
    if (self = [super init]) {
        _imageURL = imageURL;
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
    
    return [[self alloc] initWithImageURL:iURL(dict) imageID:iID(dict) andSize:iSize(dict)];
}

@end
