//
//  NSDictionary+Extras.h
//  RPiOSMobileAPI
//
//  Created by Jeremy Fox on 6/21/13.
//  Copyright (c) 2013 RentPath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extras)

- (NSString*)stringFromURLEncodedQueryParams;
- (NSString*)stringFromQueryParams;

@end
