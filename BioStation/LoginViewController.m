//
//  LoginViewController.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "LoginViewController.h"
#import "ServerRequestManager+Login.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    // Do any additional setup after loading the view.
}

- (IBAction)btnDoneClicked:(UIButton *)sender {
    [self authenticateUser];
}

- (void)authenticateUser{
    
    if (isConnectedWithErrorMsg) {
        
        [self showSpinnerWithTitle:@"Loggin in.."];
        [[ServerRequestManager sharedManager] loginUser:@{@"un":txtFieldUsername.text,@"pwd":txtFieldPassword.text} withBlock:^(id responseObject, BOOL status, NSError *error) {
            
            [self hideSpinner];
            
            if (status && responseObject) {
                SaveUserInfo(responseObject);
                [self performSegueWithIdentifier:@"ClinicsListVCSegue" sender:self];
            }
            else{
                [Utility showErrorAlert:@"Something went wrong. Please try again."];
            }
        }];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification{
    
    [self.view endEditing:YES];
}

//UIKIT_EXTERN NSString *const UIKeyboardWillHideNotification;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
