//
//  PFShelterRecord.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petfinderShelterRecord">
    //<xs:sequence>
        //<xs:element name="id" type="shelterIdType"/>
        //<xs:element name="name" type="xs:string"/>
        //<xs:element name="address1" type="xs:string"/>
        //<xs:element name="address2" type="xs:string"/>
        //<xs:element name="city" type="xs:string"/>
        //<xs:element name="state" type="xs:string"/>
        //<xs:element name="zip" type="xs:string"/>
        //<xs:element name="country" type="xs:string"/>
        //<xs:element name="latitude" type="xs:decimal"/>
        //<xs:element name="longitude" type="xs:decimal"/>
        //<xs:element name="phone" type="xs:string"/>
        //<xs:element name="fax" type="xs:string"/>
        //<xs:element name="email" type="xs:string"/>
    //</xs:sequence>
//</xs:complexType>

@interface PFShelterRecord : NSObject

@property (nonatomic, strong) PFShelterIDType* shelterID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* address1;
@property (nonatomic, strong) NSString* address2;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* state;
@property (nonatomic, strong) NSString* zip;
@property (nonatomic, strong) NSString* country;
@property (nonatomic, strong) NSNumber* latitude;
@property (nonatomic, strong) NSNumber* longitude;
@property (nonatomic, strong) NSString* phone;
@property (nonatomic, strong) NSString* fax;
@property (nonatomic, strong) NSString* email;

+ (instancetype)shelterRecordFromDictionary:(NSDictionary*)shelterDict;

@end
