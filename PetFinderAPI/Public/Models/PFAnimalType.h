//
//  PFAnimalType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="animalType">
    //<xs:restriction base="xs:string">
        //<xs:enumeration value="Dog"/>
        //<xs:enumeration value="Cat"/>
        //<xs:enumeration value="Small&Furry"/>
        //<xs:enumeration value="BarnYard"/>
        //<xs:enumeration value="Bird"/>
        //<xs:enumeration value="Horse"/>
        //<xs:enumeration value="Pig"/>
        //<xs:enumeration value="Rabbit"/>
        //<xs:enumeration value="Reptile"/>
    //</xs:restriction>
//</xs:simpleType>

@interface PFAnimalType : NSObject

@property (nonatomic, strong, readonly) NSString* animal;

+ (instancetype)animalTypeWithAnimal:(NSString*)animal;

@end
