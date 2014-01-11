//
//  PFPetRecord.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petfinderPetRecord">
//<xs:sequence>
    //<xs:element name="id" type="petIdType"/>
    //<xs:element name="shelterId" type="shelterIdType"/>
    //<xs:element name="shelterPetId" type="xs:string" minOccurs="0"/>
    //<xs:element name="name" type="xs:string"/>
    //<xs:element name="animal" type="animalType"/>
    //<xs:element name="breeds" type="petfinderBreedList"/>
    //<xs:element name="mix">
        //<xs:simpleType>
            //<xs:restriction base="xs:string">
                //<xs:enumeration value="yes"/>
                //<xs:enumeration value="no"/>
            //</xs:restriction>
        //</xs:simpleType>
    //</xs:element>
    //<xs:element name="age" type="petAgeType"/>
    //<xs:element name="sex" type="petGenderType"/>
    //<xs:element name="size" type="petSizeType"/>
    //<xs:element name="options">
        //<xs:complexType>
            //<xs:sequence>
                //<xs:element name="option" type="petOptionType" minOccurs="0" maxOccurs="unbounded"/>
            //</xs:sequence>
        //</xs:complexType>
    //</xs:element>
    //<xs:element name="description" type="xs:string"/>
    //<xs:element name="lastUpdate" type="xs:dateTime"/>
    //<xs:element name="status" type="petStatusType"/>
    //<xs:element name="media">
        //<xs:complexType>
            //<xs:sequence>
                //<xs:element name="photos" minOccurs="0">
                    //<xs:complexType>
                        //<xs:sequence>
                            //<xs:element name="photo" type="petPhotoType" minOccurs="0" maxOccurs="15"/>
                        //</xs:sequence>
                    //</xs:complexType>
                //</xs:element>
            //</xs:sequence>
        //</xs:complexType>
    //</xs:element>
    //<xs:element name="contact" type="petContactType" minOccurs="0"/>
//</xs:sequence>
//</xs:complexType>

@interface PFPetRecord : NSObject

@property (nonatomic, strong) PFPetIDType* petID;
@property (nonatomic, strong) PFShelterIDType* shelterID;
@property (nonatomic, strong) NSString* shelterPetID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) PFAnimalType* animalType;
@property (nonatomic, strong) PFBreedList* breedsList;
@property (nonatomic, assign) NSString* mix;
@property (nonatomic, strong) PFPetAgeType* ageType;
@property (nonatomic, strong) PFPetGenderType* genderType;
@property (nonatomic, strong) PFPetSizeType* sizeType;
@property (nonatomic, strong) PFPetOptionList* optionsList;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSDate* lastUpdate;
@property (nonatomic, strong) PFPetStatusType* statusType;
@property (nonatomic, strong) PFPetMediaType* mediaType;
@property (nonatomic, strong) PFPetContactType* contactType;

+ (instancetype)petRecordFromDictionary:(NSDictionary*)dict;

@end
