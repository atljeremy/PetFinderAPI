//
//  PFOptionType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petOptionType">
    //<xs:restriction base="xs:string">
        //<xs:enumeration value="specialNeeds"/>
        //<xs:enumeration value="noDogs"/>
        //<xs:enumeration value="noCats"/>
        //<xs:enumeration value="noKids"/>
        //<xs:enumeration value="noClaws"/>
        //<xs:enumeration value="hasShots"/>
        //<xs:enumeration value="housebroken"/>
        //<xs:enumeration value="altered"/>
    //</xs:restriction>
//</xs:simpleType>

@interface PFPetOptionType : NSObject

@property (nonatomic, strong, readonly) NSString* option;

+ (instancetype)optionTypeWithOption:(NSString*)option;

@end
