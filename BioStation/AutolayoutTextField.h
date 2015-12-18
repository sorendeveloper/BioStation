//
//  AutolayoutTextField.h
//  MapMyDoctor
//
//  Created by Akash on 17/09/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutTextField : UITextField
{
    
    int _cornerRadius;
    NSString* _textFontIBName;
    UIColor* _placeHolderColor;
    CGFloat _leftMargin;
    CGFloat _rightMargin;
    CGFloat _layerWidht;
    UIColor *_borderLayerColor;
    
}

@property (nonatomic, assign) IBInspectable int cornerRadius;
@property (nonatomic, assign) IBInspectable NSString *textFontIBName;
@property (nonatomic, assign) IBInspectable UIColor *placeHolderColor;
@property (nonatomic, assign) IBInspectable UIColor *borderLayerColor;
@property (nonatomic, assign) IBInspectable CGFloat leftMargin;
@property (nonatomic, assign) IBInspectable CGFloat rightMargin;
@property (nonatomic, assign) IBInspectable CGFloat layerWidth;
@end

