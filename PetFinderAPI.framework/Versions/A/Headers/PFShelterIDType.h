//
//  PFShelterIDType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="shelterIdType">
//<xs:restriction base="xs:string">
//<xs:pattern value="[A-Z]{2}[0-9]+"/>
//</xs:restriction>
//</xs:simpleType>

@interface PFShelterIDType : NSObject

@property (nonatomic, strong, readonly) NSString* identifier;

+ (instancetype)shelterIDTypeWithID:(NSString*)id_;

@end
