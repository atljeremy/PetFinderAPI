//
//  PFShelterRecord.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFShelterRecord.h"

@implementation PFShelterRecord

- (id)initWithDict:(NSDictionary*)shelterDict {
    if (self = [super init]) {
        NSString* shelterID = [[shelterDict objectForKey:kPFAPIIDKey] objectForKey:kPFAPIContentKey];
        NSString* name = [[shelterDict objectForKey:kPFAPINameKey] objectForKey:kPFAPIContentKey];
        NSString* address1 = [[shelterDict objectForKey:kPFAPIAddress1Key] objectForKey:kPFAPIContentKey];
        NSString* address2 = [[shelterDict objectForKey:kPFAPIAddress2Key] objectForKey:kPFAPIContentKey];
        NSString* city = [[shelterDict objectForKey:kPFAPICityKey] objectForKey:kPFAPIContentKey];
        NSString* state = [[shelterDict objectForKey:kPFAPIStateKey] objectForKey:kPFAPIContentKey];
        NSString* zip = [[shelterDict objectForKey:kPFAPIZipKey] objectForKey:kPFAPIContentKey];
        NSString* country = [[shelterDict objectForKey:kPFAPICountryKey] objectForKey:kPFAPIContentKey];
        NSNumber* latitude = [[shelterDict objectForKey:kPFAPILatitudeKey] objectForKey:kPFAPIContentKey];
        NSNumber* longitude = [[shelterDict objectForKey:kPFAPILongitudeKey] objectForKey:kPFAPIContentKey];
        NSString* phone = [[shelterDict objectForKey:kPFAPIPhoneKey] objectForKey:kPFAPIContentKey];
        NSString* fax = [[shelterDict objectForKey:kPFAPIFaxKey] objectForKey:kPFAPIContentKey];
        NSString* email = [[shelterDict objectForKey:kPFAPIEmailKey] objectForKey:kPFAPIContentKey];
        
        _shelterID = VALUE_OR_DEFAULT([PFShelterIDType shelterIDTypeWithID:shelterID], [PFShelterIDType new]);
        _name = VALUE_OR_DEFAULT(name, @"");
        _address1 = VALUE_OR_DEFAULT(address1, @"");
        _address2 = VALUE_OR_DEFAULT(address2, @"");
        _city = VALUE_OR_DEFAULT(city, @"");
        _state = VALUE_OR_DEFAULT(state, @"");
        _zip = VALUE_OR_DEFAULT(zip, @"");
        _country = VALUE_OR_DEFAULT(country, @"");
        _latitude = VALUE_OR_DEFAULT(latitude, @0);
        _longitude = VALUE_OR_DEFAULT(longitude, @0);
        _phone = VALUE_OR_DEFAULT(phone, @"");
        _fax = VALUE_OR_DEFAULT(fax, @"");
        _email = VALUE_OR_DEFAULT(email, @"");
    }
    return self;
}

+ (instancetype)shelterRecordFromDictionary:(NSDictionary*)shelterDict
{
    return [[self alloc] initWithDict:shelterDict];
}

@end
