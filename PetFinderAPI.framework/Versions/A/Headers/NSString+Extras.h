//
//  NSString+util.h
//  Apartments
//
//  Created by Krisna Gendo on 5/11/12.
//  Copyright (c) 2012 Primedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extras)

- (BOOL)isEmpty;
- (NSString *)stringFromMD5;
- (NSString*)urlEncodedString;
- (NSString*)urlDecodedString;
- (NSString *)stringByAppendingQueryParameters:(NSDictionary *)queryParameters;
- (NSString *)stringByReplacingURLEncoding;
- (NSArray *)keyValueArrayFromQuery;

@end
