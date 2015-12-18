//
//  PatientDetailViewController+Additions.m
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientDetailViewController+Additions.h"

@implementation PatientDetailViewController (Additions)

- (id)headerController{
    
    for (UIViewController *controller in self.childViewControllers) {
        
        if ([controller isKindOfClass:[PatientHeaderViewController class]]) {
            
            return controller;
        }
    }
    return nil;
}

- (id)patientInfoController{
    
    for (UIViewController *controller in self.childViewControllers) {
        
        if ([controller isKindOfClass:[PatientInfoViewController class]]) {
            
            return controller;
        }
    }
    return nil;
}

@end
