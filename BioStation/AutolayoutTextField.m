//
//  AutolayoutTextField.m
//  MapMyDoctor
//
//  Created by Akash on 17/09/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import "AutolayoutTextField.h"

//IB_DESIGNABLE

@implementation AutolayoutTextField


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
}


- (void)setCornerRadius:(int)cornerRadius{
    
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}


- (void)setLayerWidth:(CGFloat)layerWidth{
    
    _layerWidht = layerWidth;
    self.layer.borderWidth = layerWidth;
}

- (CGFloat)layerWidth{
    
    return _layerWidht;
}

- (void)setRightMargin:(CGFloat)rightMargin{
    
    _rightMargin = rightMargin;
    [self textRectForBounds:self.bounds];
}

- (CGFloat)rightMargin{
    
    return _rightMargin;
}

- (int)isRounded{
    
    return _cornerRadius;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
}


- (void)setTextFontIBName:(NSString *)textFontIBName{
    
    _textFontIBName = textFontIBName;
    self.font = [UIFont fontWithName:_textFontIBName  size:self.font.pointSize];
}

- (NSString *)textFontIBName{
    
    return _textFontIBName;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    
    _placeHolderColor = placeHolderColor;
//    NSLog(@"_placeholdercolor== %@", _placeHolderColor);
//    if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
//        
//        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeHolderColor}];
//    }
    [self setValue:_placeHolderColor
                    forKeyPath:@"_placeholderLabel.textColor"];
    
}

- (UIColor *)placeHolderColor{
    
    return _placeHolderColor;
}


- (void)setLeftMargin:(CGFloat)leftMargin{
    
    _leftMargin = leftMargin;
    [self textRectForBounds:self.bounds];
}

- (CGFloat)leftMargin{
    
    return _leftMargin;
}

- (void)setBorderLayerColor:(UIColor *)borderLayerColor{
    
    _borderLayerColor = borderLayerColor;
    [self.layer setBorderColor:[borderLayerColor CGColor]];
    
}

- (UIColor *)borderLayerColor{
    
    return _borderLayerColor;
}


- (CGRect)textRectForBounds:(CGRect)bounds
{
    bounds.origin.x += _leftMargin;
    bounds.size.width -=_rightMargin;
    return bounds;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    bounds.origin.x += _leftMargin;
    bounds.size.width -=_rightMargin;
    return bounds;
}



@end
