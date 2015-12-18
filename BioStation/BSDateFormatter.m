//
//  BSDateFormatter.m
//  BioStation
//
//  Created by Akash on 13/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BSDateFormatter.h"

@implementation BSDateFormatter

+ (id) sharedFormatter {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}


- (id)dateFormatter {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[NSDateFormatter alloc] init];
    });
    return _sharedObject;
}

- (NSString *)parseDate:(id)date inFormat:(NSString *)dateFormat{
    
    NSDateFormatter *dateFormatter = [self dateFormatter];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter stringFromDate:date];
}

- (NSDate *)dateFromString:(NSString *)string inFormat:(NSString *)dateFormat{
    
    NSDateFormatter *dateFormatter = [self dateFormatter];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:string];
}



@end
