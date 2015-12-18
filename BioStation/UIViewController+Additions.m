//
//  UIViewController+Additions.m
//  BioStation
//
//  Created by Akash on 11/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <objc/runtime.h>
#import "UIViewController+Additions.h"

@implementation UIViewController (Additions)

#pragma mark - BackgroundImage
- (BOOL)hasBackground {
    return objc_getAssociatedObject(self, @selector(hasBackground));
}

- (void)setHasBackground:(BOOL)background {
    objc_setAssociatedObject(self, @selector(hasBackground), [NSNumber numberWithBool:background], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setBackgroundImage{
    [self setBackgroundImage:nil];
}

- (void)setBackgroundImage:(UIImage *)image{
    
    if (self.hasBackground && [[self.view.subviews objectAtIndex:0] isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imageView = (UIImageView *)self.view.subviews[0];
        
        [imageView setImage:image];
        
        return;
        
    }
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:[self.view frame]];
    [backgroundImage setImage:image?image:[UIImage imageNamed:@"default"]];
    [backgroundImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view insertSubview:backgroundImage atIndex:0];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(backgroundImage);
    
    NSArray *bgImageHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[backgroundImage]-0-|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:bgImageHorizontalConstraints];
    
    NSArray *bgImageVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundImage]-0-|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:bgImageVerticalConstraints];
    self.hasBackground = YES;
}

#pragma mark - Spinner
- (MBProgressHUD*)progressHUD {
    return objc_getAssociatedObject(self, @selector(progressHUD));
}

- (void)setProgressHUD:(MBProgressHUD*)hud {
    objc_setAssociatedObject(self, @selector(progressHUD), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showSpinner {
    
    [self showSpinnerWithTitle:nil];
}

- (void)showSpinnerWithTitle:(NSString *)title{
    
    [self hideSpinner];
    self.progressHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:self.progressHUD];
    
    if (title && title.length) {
        
        self.progressHUD.labelText = title;
        [self.progressHUD setLabelFont:[UIFont fontWithName:@"Avenir-Medium" size:14.0]];
    }
    self.progressHUD.dimBackground = YES;
    self.progressHUD.delegate = self;
    [self.progressHUD show:YES];
}


- (void)hideSpinner{
    if(self.progressHUD){
        [self.progressHUD hide:YES];
    }
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [self.progressHUD removeFromSuperview];
    self.progressHUD = nil;
}


@end
