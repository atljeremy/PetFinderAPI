//
//  NSDictionary+Extras.m
//  RPiOSMobileAPI
//
//  Created by Jeremy Fox on 6/21/13.
//  Copyright (c) 2013 RentPath. All rights reserved.
//

#import "NSDictionary+Extras.h"

static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    return [string urlEncodedString];
}

@implementation NSDictionary (Extras)

- (NSString*)stringFromURLEncodedQueryParams {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

- (NSString*)stringFromQueryParams {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", key, value];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

@end
