//
//  PFExceptions.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kPFInvalidGenericInitializationException;
extern NSString* const kPFInvalidPFClientInitializationException;
extern NSString* const kPFInvalidPFBaseRequestInitializationException;

@interface PFExceptions : NSObject

+ (NSException*)invalidInitializationExceptionGeneric;
+ (NSException*)invalidInitializationExceptionPFCLient;
+ (NSException*)invalidInitializationExceptionPFBaseRequest;

@end
