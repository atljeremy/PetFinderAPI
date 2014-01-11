//
//  PFErrors.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFErrors.h"

static NSString* const kPFErrorDomain = @"PFErrorDomain";
static NSInteger const kPFNoPetRecordAvailableErrorCode = 111;

@implementation PFErrors

+ (NSError*)errorForNoPetRecordAvailable
{
    return [NSError errorWithDomain:kPFErrorDomain code:kPFNoPetRecordAvailableErrorCode userInfo:@{NSLocalizedDescriptionKey: @"The requested pet record is no longer available."}];
}

@end
