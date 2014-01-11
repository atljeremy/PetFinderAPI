//
//  PFPetContactType.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetContactType.h"

@interface PFPetContactType()
@property (nonatomic, strong, readwrite) NSString* name;
@property (nonatomic, strong, readwrite) NSString* address1;
@property (nonatomic, strong, readwrite) NSString* address2;
@property (nonatomic, strong, readwrite) NSString* city;
@property (nonatomic, strong, readwrite) NSString* state;
@property (nonatomic, strong, readwrite) NSString* zip;
@property (nonatomic, strong, readwrite) NSString* phone;
@property (nonatomic, strong, readwrite) NSString* fax;
@property (nonatomic, strong, readwrite) NSString* email;
@end

@implementation PFPetContactType

+ (instancetype)contactTypeFromContactDictionary:(NSDictionary*)dict
{
    PFPetContactType* contactType = [[self alloc] init];
    contactType.name = [[dict objectForKey:kPFAPINameKey] objectForKey:kPFAPIContentKey];
    contactType.address1 = [[dict objectForKey:kPFAPIAddress1Key] objectForKey:kPFAPIContentKey];
    contactType.address2 = [[dict objectForKey:kPFAPIAddress2Key] objectForKey:kPFAPIContentKey];
    contactType.city = [[dict objectForKey:kPFAPICityKey] objectForKey:kPFAPIContentKey];
    contactType.state = [[dict objectForKey:kPFAPIStateKey] objectForKey:kPFAPIContentKey];
    contactType.zip = [[dict objectForKey:kPFAPIZipKey] objectForKey:kPFAPIContentKey];
    contactType.phone = [[dict objectForKey:kPFAPIPhoneKey] objectForKey:kPFAPIContentKey];
    contactType.fax = [[dict objectForKey:kPFAPIFaxKey] objectForKey:kPFAPIContentKey];
    contactType.email = [[dict objectForKey:kPFAPIEmailKey] objectForKey:kPFAPIContentKey];
    return contactType;
}

@end
