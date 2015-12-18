//
//  AutolayoutLabel.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutLabel : UILabel
{
    
    NSString* _fontIBName;
    BOOL _isRounded;
    CGFloat _leftMargin;
    CGFloat _rightMargin;
    CGFloat _cornerRadius;
    NSString *validText;
    NSString *_hexaColor;
    NSString *_fontHexaColor;
}

@property(nonatomic, assign) IBInspectable NSString *fontIBName;
@property(nonatomic, assign) IBInspectable BOOL isRounded;
@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat leftMargin;
@property (nonatomic, assign) IBInspectable CGFloat rightMargin;

@property (nonatomic, assign)IBInspectable NSString *hexaColor;
@property (nonatomic, assign)IBInspectable NSString *fontHexaColor;


@end
