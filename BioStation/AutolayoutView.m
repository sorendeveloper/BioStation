//
//  AutolayoutView.m
//  BioStation
//
//  Created by Akash on 13/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "AutolayoutView.h"

@implementation AutolayoutView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setBackgroundImageName:(NSString *)backgroundImageName{
    
    _bImageName = backgroundImageName;
    if ([UIImage imageNamed:_bImageName]) {
        
        [self backGroundImage:[UIImage imageNamed:_bImageName]];
    }
}

- (NSString *)backgroundImageName{
    
    return _bImageName;
}

-(void)backGroundImage:(UIImage *)image{
    
    if (hasBackgroundImage && [[self.subviews objectAtIndex:0] isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imageView = (UIImageView *)self.subviews[0];
        
        [imageView setImage:image];
        
        return;
    }
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:[self frame]];
    [backgroundImage setImage:image?image:[UIImage imageNamed:@"default"]];
    [backgroundImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self insertSubview:backgroundImage atIndex:0];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(backgroundImage);
    
    NSArray *bgImageHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[backgroundImage]-0-|" options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:bgImageHorizontalConstraints];
    
    NSArray *bgImageVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundImage]-0-|" options:0 metrics:nil views:viewsDictionary];
    
    [self addConstraints:bgImageVerticalConstraints];
    
    hasBackgroundImage = YES;
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius{
    
    return _cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return _borderWidth;
}

- (void)setWidthColor:(UIColor *)widthColor{
    _widthColor = widthColor;
    self.layer.borderColor = [_widthColor CGColor];
}

- (UIColor *)widthColor{
    return _widthColor;
}

@end
