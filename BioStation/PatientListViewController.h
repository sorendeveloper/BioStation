//
//  PatientListViewController.h
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseViewController.h"
#import "AutolayoutLabel.h"
#import "Clinic.h"

@interface PatientListViewController : BaseViewController{
    
    __weak IBOutlet AutolayoutLabel *lblTitle;
    __weak IBOutlet UIButton *btnAllPatients;
    __weak IBOutlet UIButton *btnToday;
    __weak IBOutlet UITextField *txtFieldSearch;
    __weak IBOutlet UITableView *tblViewPatients;
    NSMutableArray *arrayAllPatients, *searchedPatients, *filteredPatients;
    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UILabel *lblTime;
}


@property (nonatomic, weak)Clinic *clinic;

- (IBAction)btnAllPatientsClicked:(UIButton *)sender;
- (IBAction)btnTodayClicked:(UIButton *)sender;
- (IBAction)unwindPatientListVCSegue:(UIStoryboardSegue *)sender;


@end
