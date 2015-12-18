//
//  AutolayoutLabel.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "AutolayoutLabel.h"
#import "UIColor+Additions.h"


@implementation AutolayoutLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
}

-(void)setFontIBName:(NSString*)name
{
    _fontIBName = name;
    self.font = [UIFont fontWithName:self.fontIBName  size:self.font.pointSize];
}

-(NSString *)fontIBName
{
    return _fontIBName;
}

//***************************************




- (void)setIsRounded:(BOOL)isRounded{
    
    _isRounded = isRounded;
    self.layer.cornerRadius = isRounded?self.frame.size.height/2:0;
}

- (BOOL)isRounded{
    
    return _isRounded;
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    _cornerRadius = cornerRadius;
    
    if (!_isRounded) {
        
        self.layer.cornerRadius = cornerRadius;
    }
}

- (CGFloat)cornerRadius{
    
    return _cornerRadius;
}

- (void)setLeftMargin:(CGFloat)leftMargin{
    
    _leftMargin = leftMargin;
    [self drawTextInRect:self.bounds];
}

- (CGFloat)leftMargin{
    
    return _leftMargin;
}


- (void)setRightMargin:(CGFloat)rightMargin{
    
    _rightMargin = rightMargin;
    [self drawTextInRect:self.bounds];
}

- (CGFloat)righMargin{
    
    return _rightMargin;
}


//*********** HEXA-COLOR **********

- (void)setHexaColor:(NSString *)hexaColor{
    
    _hexaColor = hexaColor;
    [self setBackgroundColor:[UIColor colorWithHexString:hexaColor]];
}

- (NSString *)hexaColor{
    
    return _hexaColor;
}

//************* FONT HEXA COLOR ************

- (void)setFontHexaColor:(NSString *)fontHexaColor{
    
    _fontHexaColor = fontHexaColor;
    self.textColor = [UIColor colorWithHexString:fontHexaColor];
}

- (NSString *)fontHexaColor{
    return _fontHexaColor;
}

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, _leftMargin, 0, _rightMargin};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

// Implement font logic depending on screen size
// Implemented corner radius logic here

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.font = [UIFont fontWithName:self.fontIBName  size:self.font.pointSize];
    if (_isRounded) {
        
        self.layer.cornerRadius = self.frame.size.height/2;
    }
    else{
        self.layer.cornerRadius = _cornerRadius;
    }
}


@end
