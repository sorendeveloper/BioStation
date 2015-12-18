//
//  BSDateFormatter.h
//  BioStation
//
//  Created by Akash on 13/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSDateFormatter : NSObject

+ (id)sharedFormatter;
- (id)dateFormatter;
- (NSString *)parseDate:(id)date inFormat:(NSString *)dateFormat;
- (NSDate *)dateFromString:(NSString *)string inFormat:(NSString *)dateFormat;

@end
