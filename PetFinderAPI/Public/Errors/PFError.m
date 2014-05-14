//
//  PFErrors.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFError.h"

static NSString* const kPFErrorDomain = @"PFErrorDomain";

static NSString* const kPFErrorNoPetRecordAvailableErrorMessage = @"The requested pet record is no longer available.";
static NSInteger const kPFErrorNoPetRecordAvailableErrorCode = 111;

static NSString* const kPFErrorSearchFailureErrorMessage = @"The web service used to get pet info is experiencing temporary technical difficulties.";
static NSInteger const kPFErrorSearchFailureErrorCode = -9898;

@implementation PFError

+ (instancetype)errorForNoPetRecordAvailable
{
    return [PFError errorWithDomain:kPFErrorDomain
                               code:kPFErrorNoPetRecordAvailableErrorCode
                           userInfo:@{NSLocalizedDescriptionKey: kPFErrorNoPetRecordAvailableErrorMessage}];
}

+ (instancetype)errorForSearchFailure
{
    return [PFError errorWithDomain:kPFErrorDomain
                               code:kPFErrorSearchFailureErrorCode
                           userInfo:@{NSLocalizedDescriptionKey: kPFErrorSearchFailureErrorMessage}];
}


@end
