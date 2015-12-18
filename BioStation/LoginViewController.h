//
//  LoginViewController.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController{
    
    __weak IBOutlet UITextField *txtFieldUsername;
    __weak IBOutlet UITextField *txtFieldPassword;
    __weak IBOutlet UIButton *btnDone;
    
}
- (IBAction)btnDoneClicked:(UIButton *)sender;

@end
