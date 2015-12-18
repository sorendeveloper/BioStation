//
//  PatientDetailViewController.m
//  BioStation
//
//  Created by Akash on 14/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientDetailViewController.h"
#import "ServerRequestManager+Patient.h"
#import "LeftPatientListTableViewCell.h"
#import "PatientDetailViewController+Additions.h"

@interface PatientDetailViewController ()

@end

@implementation PatientDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initializeView];
    // Do any additional setup after loading the view.
}

- (void)initializeView{
    
    [self setTableLayout:tblViewPatients];
    arraySearchedPatients = [[NSMutableArray alloc]init];
    [self compareArray];
    LoggedUser *loggedUser = GetUserInfo;
    [lblDate setText:[[BSDateFormatter sharedFormatter] parseDate:[NSDate date] inFormat:@"cccc MMMM dd,yyyy"]];
    [lblUsername setText:loggedUser.user_name];
    [txtfieldSearch addTarget:self
                       action:@selector(textFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
    [self fetchPatientInfo];
}

- (void)fetchPatientInfo{

    LoggedUser *loggedUser = GetUserInfo;
    
    if (isConnectedWithErrorMsg) {
        [self showSpinnerWithTitle:@"Getting patient data.."];
        
        [[ServerRequestManager sharedManager] getPatientWithId:self.selectedPatient.patient_id forInfo:@{@"_token":loggedUser.auth_token, @"clinic_id":self.clinic.clinic_id} withBlock:^(id responseObject, BOOL status, NSError *error) {
            [self hideSpinner];
            if (status) {
                
                NSLog(@"fetched=== %@", responseObject);
                [[self headerController] setPatientInfo:responseObject];
                [[self patientInfoController] setPatientInfo:responseObject];
                [viewPatientBodyDetail setHidden:NO];
                [viewPatientInfo setHidden:NO];
            }
            else{
                
            }
        }];
        
        
    }
}

- (void)compareArray{

//    NSLog(@"self.arrayallpatients=== %@", self.arrayAllPatients);
    arraySearchedPatients = self.arrayAllPatients;
    [tblViewPatients reloadData];
}

#pragma mark - TableView Delegate & Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return arraySearchedPatients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeftPatientListTableViewCell *cell = (LeftPatientListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LeftPatientListTableViewCell"];
    [cell setPatientData:arraySearchedPatients[indexPath.row] isSelected:(self.selectedPatient.patient_id==[arraySearchedPatients[indexPath.row] patient_id]?YES:NO)];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (self.selectedPatient.patient_id != [arraySearchedPatients[indexPath.row] patient_id]) {
        self.selectedPatient = arraySearchedPatients[indexPath.row];
        [self fetchPatientInfo];
        [tblViewPatients reloadData];
    }
}

#pragma mark - UITextField Notification
- (void)textFieldDidChange:(NSNotification *)notification{
    
    if (txtfieldSearch.text.length)    {
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.fullName CONTAINS[cd] %@", txtfieldSearch.text];
        arraySearchedPatients = [[self.arrayAllPatients filteredArrayUsingPredicate:pred] mutableCopy];
    }
    else{
        arraySearchedPatients = self.arrayAllPatients;
    }
    [tblViewPatients reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
