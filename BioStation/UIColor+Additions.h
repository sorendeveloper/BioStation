//
//  UIColor+Additions.h
//  MapMyDoctor
//
//  Created by Akash on 20/09/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

+ (UIColor *) colorWithHexString: (NSString *) hexString;

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

@end
