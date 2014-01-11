//
//  PFPetContactType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petContactType">
    //<xs:sequence>
        //<xs:element name="name" type="xs:string"/>
        //<xs:element name="address1" type="xs:string"/>
        //<xs:element name="address2" type="xs:string"/>
        //<xs:element name="state" type="xs:string"/>
        //<xs:element name="zip" type="xs:string"/>
        //<xs:element name="phone" type="xs:string"/>
        //<xs:element name="fax" type="xs:string"/>
        //<xs:element name="email" type="xs:string"/>
    //</xs:sequence>
//</xs:complexType>

@interface PFPetContactType : NSObject

@property (nonatomic, strong, readonly) NSString* name;
@property (nonatomic, strong, readonly) NSString* address1;
@property (nonatomic, strong, readonly) NSString* address2;
@property (nonatomic, strong, readonly) NSString* city;
@property (nonatomic, strong, readonly) NSString* state;
@property (nonatomic, strong, readonly) NSString* zip;
@property (nonatomic, strong, readonly) NSString* phone;
@property (nonatomic, strong, readonly) NSString* fax;
@property (nonatomic, strong, readonly) NSString* email;

+ (instancetype)contactTypeFromContactDictionary:(NSDictionary*)dict;

@end
