//
//  AutolayoutUIButton.h
//  MapMyDoctor
//
//  Created by Akash on 21/09/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutUIButton : UIButton
{
    NSString* _fontIBName;
    BOOL _isRounded;
    
}

@property(nonatomic, assign) IBInspectable NSString *fontIBName;
@property(nonatomic, assign) IBInspectable CGFloat radius;
@property(nonatomic, assign) IBInspectable CGFloat width;
@property(nonatomic, assign) IBInspectable BOOL isRounded;
@property(nonatomic, assign) IBInspectable UIColor *borderColor;
@end
