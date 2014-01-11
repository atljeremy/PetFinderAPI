//
//  PFPetIDType.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

//<xs:simpleType name="petIdType">
//<xs:restriction base="xs:positiveInteger"/>
//</xs:simpleType>

@interface PFPetIDType : NSObject

@property (nonatomic, strong, readonly) NSString* identifier;

+ (instancetype)petIDTypeWithID:(NSString*)id_;

@end
