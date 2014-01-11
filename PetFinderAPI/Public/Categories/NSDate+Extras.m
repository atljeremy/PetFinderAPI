//
//  NSDate+Extras.m
//  RPiOSMobileAPI
//
//  Created by Jeremy Fox on 11/13/13.
//  Copyright (c) 2013 RentPath. All rights reserved.
//

#import "NSDate+Extras.h"

@implementation NSDate (Extras)

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}


@end
