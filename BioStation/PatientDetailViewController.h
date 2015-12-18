//
//  PatientDetailViewController.h
//  BioStation
//
//  Created by Akash on 14/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseViewController.h"
#import "Clinic.h"
#import "Patient.h"
#import "PatientHeaderViewController.h"
#import "PatientInfoViewController.h"


@interface PatientDetailViewController : BaseViewController{
    
    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UILabel *lblDate;
    NSMutableArray *arraySearchedPatients;
    __weak IBOutlet UITableView *tblViewPatients;
    __weak IBOutlet UITextField *txtfieldSearch;
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UIView *viewPatientInfo;
    __weak IBOutlet UIView *viewPatientBodyDetail;

}

@property (nonatomic, weak)Clinic *clinic;
@property (nonatomic, weak)PatientDetail *selectedPatient;
@property (nonatomic, retain)NSMutableArray *arrayAllPatients;

@end
