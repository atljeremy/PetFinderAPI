//
//  NSDate+Extras.h
//  RPiOSMobileAPI
//
//  Created by Jeremy Fox on 11/13/13.
//  Copyright (c) 2013 RentPath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extras)

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

@end
