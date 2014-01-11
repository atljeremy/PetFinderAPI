//
//  PFPetIDList.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:complexType name="petfinderPetIdList">
//<xs:sequence>
//<xs:element name="id" type="petIdType" minOccurs="0" maxOccurs="unbounded"/>
//</xs:sequence>
//</xs:complexType>

@interface PFPetIDList : NSObject

@property (nonatomic, strong, readonly) NSArray* petIDs;

+ (instancetype)petIDListWithPetIDs:(NSArray*)petIds;

@end
