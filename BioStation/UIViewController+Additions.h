//
//  UIViewController+Additions.h
//  BioStation
//
//  Created by Akash on 11/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (Additions)<MBProgressHUDDelegate>

#pragma mark - BackgroundImage
@property (nonatomic, readwrite) BOOL hasBackground;
- (void)setBackgroundImage;
- (void)setBackgroundImage:(UIImage *)image;

#pragma mark - Spinner
@property (nonatomic, strong) MBProgressHUD *progressHUD;
- (void)showSpinner;
- (void)hideSpinner;
- (void)showSpinnerWithTitle:(NSString *)title;



@end
