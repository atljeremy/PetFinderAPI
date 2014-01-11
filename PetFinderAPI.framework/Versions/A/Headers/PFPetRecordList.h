//
//  PFPetRecordList.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petfinderPetRecordList">
//<xs:sequence>
//<xs:element name="pet" type="petfinderPetRecord" minOccurs="0" maxOccurs="unbounded"/>
//</xs:sequence>
//</xs:complexType>

@interface PFPetRecordList : NSObject

@property (nonatomic, strong, readonly) NSArray* pets;
@property (nonatomic, strong, readonly) NSNumber* lastOffset;

+ (instancetype)petRecordListFromDictionary:(NSDictionary*)petDict;

@end
