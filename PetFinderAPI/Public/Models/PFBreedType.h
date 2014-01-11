//
//  PFBreedType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petfinderBreedType">
    //<xs:restriction base="xs:string">
        //<!--  Rare cases when breed is not known or is omitted  -->
        //<xs:enumeration value="Unknown"/>
        //<!--  Dog Breeds  -->
        //<xs:enumeration value="Affenpinscher"/>
        //<xs:enumeration value="Afghan Hound"/>
        //<xs:enumeration value="Airedale Terrier"/>
        //<xs:enumeration value="Akbash"/>
        //<xs:enumeration value="Akita"/>
        // ETC...
    //</xs:restriction>
//</xs:simpleType>

@interface PFBreedType : NSObject

@property (nonatomic, strong, readonly) NSString* breed;

+ (instancetype)breedTypeWithBreed:(NSString*)breed;

@end
