//
//  PFBreedList.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petfinderBreedList">
//<xs:sequence>
//<xs:element name="breed" type="petfinderBreedType" minOccurs="1" maxOccurs="unbounded"/>
//</xs:sequence>
//<xs:attribute name="animal" type="xs:string"/>
//</xs:complexType>

extern NSString* const kPetBreedListBreedsKey;
extern NSString* const kPetBreedListBreedKey;
extern NSString* const kPetBreedListAnimalKey;

@interface PFBreedList : NSObject

@property (nonatomic, strong, readonly) NSArray* breeds;
@property (nonatomic, strong, readonly) NSString* animal;

+ (instancetype)breedListFromBreedsDictionary:(NSDictionary*)breeds;

@end
