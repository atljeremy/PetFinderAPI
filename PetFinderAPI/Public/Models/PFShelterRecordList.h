//
//  PFShelterRecordList.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petfinderShelterRecordList">
//<xs:sequence>
//<xs:element name="shelter" type="petfinderShelterRecord" minOccurs="0" maxOccurs="unbounded"/>
//</xs:sequence>
//</xs:complexType>

@interface PFShelterRecordList : NSObject

@property (nonatomic, strong, readonly) NSArray* shelters;

+ (instancetype)shelterRecordListFromDictionary:(NSDictionary*)shelterDict;

@end
