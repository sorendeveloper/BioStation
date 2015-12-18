//
//  PatientHeaderViewController.m
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientHeaderViewController.h"
#import "PatientInfo.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "BSDateFormatter.h"

@interface PatientHeaderViewController ()

@end

@implementation PatientHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPatientInfo:(id)data{
    
    NSLog(@"patient header info");
    PatientInfo *patientInfo = (PatientInfo *)data;
    [btnAvatar sd_setImageWithURL:[NSURL URLWithString:patientInfo.imgUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"default_image"]];
    
    [lblName setText:[NSString stringWithFormat:@"%@ (ID: %d)",patientInfo.name, patientInfo.patientId]];
    [lblPatientAddres setText:patientInfo.address];
    [lblMobileNumber setText:patientInfo.mobilephone];
    
    [imgViewPhone setHidden:!lblMobileNumber.text.length];

    
    [lblAgeGender setText:[NSString stringWithFormat:@"%d,   %@",patientInfo.age, patientInfo.sex]];
    [lblDOB setText:[[BSDateFormatter sharedFormatter] parseDate:[[BSDateFormatter sharedFormatter] dateFromString:patientInfo.dob inFormat:@"MM/dd/yyyy"] inFormat:@"dd LLL yyyy"]];
    [lblReferingDoc setText:patientInfo.ref_doc];
    [lblNextAppointment setText:patientInfo.next_appt];
    
    [lblPrepayDeposit setText:[NSString stringWithFormat:@"$%d",patientInfo.patientBalance.prepay]];
    [lblPatientBal setText:[NSString stringWithFormat:@"$%d",patientInfo.patientBalance.pat_bal]];
    [lblInsuranceBal setText:[NSString stringWithFormat:@"$%d",patientInfo.patientBalance.ins_bal]];
}



@end
