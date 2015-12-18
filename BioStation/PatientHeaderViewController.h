//
//  PatientHeaderViewController.h
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientHeaderViewController : UIViewController{
    
    __weak IBOutlet UIButton *btnAvatar;
    __weak IBOutlet UILabel *lblName;
    __weak IBOutlet UILabel *lblPatientAddres;
    
    __weak IBOutlet UILabel *lblMobileNumber;
    __weak IBOutlet UILabel *lblAgeGender;
    __weak IBOutlet UILabel *lblDOB;
    __weak IBOutlet UILabel *lblReferingDoc;
    __weak IBOutlet UILabel *lblNextAppointment;
    __weak IBOutlet UILabel *lblPrepayDeposit;
    __weak IBOutlet UILabel *lblPatientBal;
    __weak IBOutlet UILabel *lblInsuranceBal;
    __weak IBOutlet UIImageView *imgViewPhone;
}

- (void)setPatientInfo:(id)data;

@end
