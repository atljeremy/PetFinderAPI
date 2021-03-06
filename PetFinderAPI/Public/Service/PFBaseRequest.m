//
//  PFBaseRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/8/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFBaseRequest.h"

static NSString* const kPFAPIBaseURL = @"https://api.petfinder.com/";
static NSString* const kPFAPIKey     = @"key";
static NSString* const kPFAPIFormat  = @"format";
static NSString* const kPFAPIOutput  = @"output";
static NSString* const kPFAPIFormatDefaultValue = @"json";
static NSString* const kPFAPIOutputDefaultValue = @"full";

@interface PFBaseRequest()
@property (nonatomic, strong, readwrite) NSString* baseURL;
@property (nonatomic, strong, readwrite) NSString* token;
@end

@implementation PFBaseRequest

- (id)init
{
    @throw [PFExceptions invalidInitializationExceptionPFBaseRequest];
}

- (instancetype)initWithPath:(NSString*)path_
{
    if (self = [super init]) {
        _token = nil;
        _output = kPFAPIOutputDefaultValue;
        _baseURL = kPFAPIBaseURL;
        _path = path_;
        _params = [@{} mutableCopy];
    }
    return self;
}

- (NSString*)urlWithParams
{
    if (!self.baseURL) return nil;
    if (self.params) {
        [self.params addEntriesFromDictionary:@{kPFAPIKey: PFClient.sharedInstance.apiKey, kPFAPIFormat: kPFAPIFormatDefaultValue, kPFAPIOutput: _output}];
        NSString* params = [self.params stringFromURLEncodedQueryParams];
        return [self.baseURL stringByAppendingFormat:@"%@?%@", self.path, params];
    } else {
        return self.baseURL;
    }
}

- (NSString*)description
{
    return [self urlWithParams];
}

@end
