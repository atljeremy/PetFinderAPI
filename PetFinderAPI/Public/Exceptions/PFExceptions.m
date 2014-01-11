//
//  PFExceptions.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFExceptions.h"

NSString* const kPFInvalidGenericInitializationException = @"PFInvalidGenericInitializationException";
NSString* const kPFInvalidPFClientInitializationException = @"PFInvalidInitializationExceptionPFCLient";
NSString* const kPFInvalidPFBaseRequestInitializationException = @"PFInvalidPFBaseRequestInitializationException";

@implementation PFExceptions

+ (NSException*)invalidInitializationExceptionGeneric
{
    return [NSException exceptionWithName:kPFInvalidGenericInitializationException reason:@"" userInfo:@{NSLocalizedDescriptionKey: @"Invalid initialization. Please refer to the documentation for proper initialization."}];
}

+ (NSException*)invalidInitializationExceptionPFCLient
{
    return [NSException exceptionWithName:kPFInvalidPFClientInitializationException reason:@"" userInfo:@{NSLocalizedDescriptionKey: @"Must use initializeWithAPIKey: to initialize PFClient."}];
}

+ (NSException*)invalidInitializationExceptionPFBaseRequest
{
    return [NSException exceptionWithName:kPFInvalidPFBaseRequestInitializationException reason:@"" userInfo:@{NSLocalizedDescriptionKey: @"Must use initWithAPIKey: to initialize PFBaseRequest."}];
}

@end
