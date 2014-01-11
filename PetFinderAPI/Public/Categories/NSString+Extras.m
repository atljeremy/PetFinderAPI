//
//  NSString+util.m
//  Apartments
//
//  Created by Krisna Gendo on 5/11/12.
//  Copyright (c) 2012 Primedia. All rights reserved.
//

#import "NSString+Extras.h"
#import "NSDictionary+Extras.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extras)

-(BOOL) isEmpty {
	
	return 0==self.length
		|| 0==[[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length];
	
}

- (NSString *)stringByAppendingQueryParameters:(NSDictionary *)queryParameters
{
    if ([queryParameters count] > 0) {
        return [NSString stringWithFormat:@"%@?%@", self, [queryParameters stringFromQueryParams]];
    }
    return [NSString stringWithString:self];
}

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

- (NSString *)stringByReplacingURLEncoding
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSArray *)keyValueArrayFromQuery {
    NSString* decodedQuery = [self stringByReplacingURLEncoding];
    NSRange range = [decodedQuery rangeOfString:@"?"];
    
    NSString *trimmedQuery;
    if (range.length == 0) {
        range = [decodedQuery rangeOfString:@".com"];
        trimmedQuery = [decodedQuery substringFromIndex:range.location + range.length + 1];
    } else {
        trimmedQuery = [decodedQuery substringFromIndex:range.location + range.length];
    }
    
    trimmedQuery = [trimmedQuery stringByReplacingOccurrencesOfString:@" & " withString:@" and "];
    NSArray *keyValues = [trimmedQuery componentsSeparatedByString:@"&"];
    return keyValues;
}

- (NSString*)urlEncodedString {
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                     (CFStringRef)self,
                                                                     NULL,
                                                                     (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
}

- (NSString*)urlDecodedString {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


@end
