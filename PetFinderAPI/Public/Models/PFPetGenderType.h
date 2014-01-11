//
//  PFPetGenderType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petGenderType">
    //<xs:restriction base="xs:string">
        //<xs:enumeration value="M"/>
        //<xs:enumeration value="F"/>
    //</xs:restriction>
//</xs:simpleType>

@interface PFPetGenderType : NSObject

@property (nonatomic, strong, readonly) NSString* gender;

+ (instancetype)genderTypeWithGender:(NSString*)gender;

@end
