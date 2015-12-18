//
//  PatientInfoViewController.h
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientInfoViewController : UIViewController{
    
    __weak IBOutlet UILabel *lblAge;
    __weak IBOutlet UILabel *lblWeight;
    __weak IBOutlet UILabel *lblLeftArm;
    __weak IBOutlet UILabel *lblRightArm;
    __weak IBOutlet UILabel *lblPulse;
    __weak IBOutlet UILabel *lblPain;
    __weak IBOutlet UILabel *lblHeight;
    __weak IBOutlet UILabel *lblHeartRate;
    __weak IBOutlet UILabel *lblTemp;
    __weak IBOutlet UILabel *lblBMI;
    __weak IBOutlet UILabel *lblRR;
    __weak IBOutlet UILabel *lblWaistCircum;
    __weak IBOutlet UILabel *lblHipCircum;
    __weak IBOutlet UILabel *lblRatio;
    
    
}

- (void)setPatientInfo:(id)data;
@end
