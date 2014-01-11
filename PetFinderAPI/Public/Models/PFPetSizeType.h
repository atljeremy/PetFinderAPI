//
//  PFPetSizeType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petSizeType">
    //<xs:restriction base="xs:string">
        //<xs:enumeration value="S"/>
        //<xs:enumeration value="M"/>
        //<xs:enumeration value="L"/>
        //<xs:enumeration value="XL"/>
    //</xs:restriction>
//</xs:simpleType>

@interface PFPetSizeType : NSObject

@property (nonatomic, strong, readonly) NSString* size;

+ (instancetype)sizeTypeWithSize:(NSString*)size;

@end
