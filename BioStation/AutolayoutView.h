//
//  AutolayoutView.h
//  BioStation
//
//  Created by Akash on 13/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutView : UIView{

    CGFloat _cornerRadius;
    NSString *_bImageName;
    BOOL hasBackgroundImage;
    CGFloat _borderWidth;
    UIColor *_widthColor;
}

@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign)IBInspectable NSString *backgroundImageName;
@property(nonatomic, assign) IBInspectable UIColor *widthColor;

@end
