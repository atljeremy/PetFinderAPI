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
NSString* const kPetPhotoXKey = @"x";
NSString* const kPetPhotoTKey = @"t";
NSString* const kPetPhotoPNKey = @"pn";
NSString* const kPetPhotoPNTKey = @"pnt";
NSString* const kPetPhotoFPMKey = @"fpm";

NSString* iURL(NSDictionary* dict)
{
    return [dict objectForKey:kPFAPIContentKey];
}

NSString* iID(NSDictionary* dict)
{
    return [dict objectForKey:kPetPhotoIDKey];
}

NSString* iSize(NSDictionary* dict)
{
    return [dict objectForKey:kPetPhotoSizeKey];
}

@implementation PFPetPhotoType

- (id)initWithImageURL:(NSString*)imageURL imageID:(NSString*)imageID andSize:(NSString*)size {
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
