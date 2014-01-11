//
//  PFPetAgeType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petAgeType">
    //<xs:restriction base="xs:string">
        //<xs:enumeration value="Baby"/>
        //<xs:enumeration value="Young"/>
        //<xs:enumeration value="Adult"/>
        //<xs:enumeration value="Senior"/>
    //</xs:restriction>
//</xs:simpleType>

@interface PFPetAgeType : NSObject

@property (nonatomic, strong, readonly) NSString* age;

+ (instancetype)ageTypeWithAge:(NSString*)age;

@end
