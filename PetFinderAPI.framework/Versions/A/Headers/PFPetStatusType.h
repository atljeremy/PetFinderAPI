//
//  PFPetStatusType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petStatusType">
    //<xs:restriction base="xs:string">
        //<xs:enumeration value="A"/>
        //<xs:enumeration value="H"/>
        //<xs:enumeration value="P"/>
        //<xs:enumeration value="X"/>
    //</xs:restriction>
//</xs:simpleType>

@interface PFPetStatusType : NSObject

@property (nonatomic, strong, readonly) NSString* status;

+ (instancetype)statusTypeWithStatus:(NSString*)status;

@end
