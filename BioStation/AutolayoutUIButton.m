//
//  AutolayoutUIButton.m
//  MapMyDoctor
//
//  Created by Akash on 21/09/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import "AutolayoutUIButton.h"
//IB_DESIGNABLE

@implementation AutolayoutUIButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)setFontIBName:(NSString*)name
{
    _fontIBName = name;
}

-(NSString *)fontIBName
{
    return _fontIBName;
}

-(void)setRadius:(CGFloat)inputRadius
{
    if (!_isRounded) {
        
        self.layer.cornerRadius = inputRadius;
    }
}

-(CGFloat)radius
{
    return self.layer.cornerRadius;
}

// setting for all round button property
- (void)setIsRounded:(BOOL)isRounded{
    
    _isRounded = isRounded;
    self.layer.cornerRadius = self.frame.size.height/2;
}

- (BOOL)isRounded{
    
    return _isRounded;
}

- (void)setBorderColor:(UIColor *)borderColor{
    
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
    
    return [UIColor colorWithCGColor:self.layer.borderColor];
}



// settingCorner width

- (void)setWidth:(CGFloat)width{
    
    self.layer.borderWidth = width;
}

- (CGFloat)width{
    
    return self.layer.borderWidth;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    // Implement font logic depending on screen size
    
    [self.titleLabel setFont: [UIFont fontWithName:self.fontIBName  size:self.titleLabel.font.pointSize]];
    
    if (_isRounded) {
        self.layer.cornerRadius = self.frame.size.height/2;
        self.layer.masksToBounds = YES;
        self.layer.shadowColor = self.titleLabel.shadowColor.CGColor;
        self.layer.shadowOffset = self.titleLabel.shadowOffset;
        self.layer.shadowRadius = 2;
        self.layer.shadowOpacity = 1;
    }
}


@end
