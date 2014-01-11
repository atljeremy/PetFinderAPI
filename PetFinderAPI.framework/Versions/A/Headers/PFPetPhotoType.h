//
//  PFPetPhotoType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petPhotoType">
    //<xs:simpleContent>
        //<xs:extension base="xs:string">
            //<xs:attribute name="id" type="xs:positiveInteger"/>
            //<xs:attribute name="size">
                //<xs:simpleType>
                    //<xs:restriction base="xs:string">
                        //<!--  large (max 500x500)  -->
                        //<xs:enumeration value="x"/>
                        //<!--  thumbnail (max 50 pixels high)  -->
                        //<xs:enumeration value="t"/>
                        //<!--  petnote (max 300x250)  -->
                        //<xs:enumeration value="pn"/>
                        //<!--  petnote thumbnail (max 60 pixels wide) -->
                        //<xs:enumeration value="pnt"/>
                        //<!--  featured pet module (max 95 pixels wide)  -->
                        //<xs:enumeration value="fpm"/>
                    //</xs:restriction>
                //</xs:simpleType>
            //</xs:attribute>
        //</xs:extension>
    //</xs:simpleContent>
//</xs:complexType>

NSString* const kPetPhotoIDKey;
NSString* const kPetPhotoSizeKey;

@interface PFPetPhotoType : NSObject

@property (nonatomic, strong, readonly) NSString* imageURL;
@property (nonatomic, strong, readonly) NSNumber* identifier;
@property (nonatomic, strong, readonly) NSString* size;

+ (instancetype)fromDictionary:(NSDictionary*)dict;

@end
