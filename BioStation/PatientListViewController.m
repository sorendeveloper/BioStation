//
//  PatientListViewController.m
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientListViewController.h"
#import "PatientListTableViewCell.h"
#import "ServerRequestManager+Patient.h"
#import "PatientDetailViewController.h"
#import "Patient.h"


#define PATIENT_DETAIL_SEGUE @"PatientDetailVCSegue"

@interface PatientListViewController ()

@end

@implementation PatientListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initializeView];
}

- (void)initializeView{
    
    [self configureTableAndObjects];
    LoggedUser *user = GetUserInfo;
    [lblUsername setText:user.user_name];
    [lblTime setText:[[BSDateFormatter sharedFormatter] parseDate:[NSDate date] inFormat:@"cccc MMMM dd,yyyy"]];
    
    if (user.auth_token && self.clinic.clinic_id && isConnectedWithErrorMsg) {
        [self showSpinnerWithTitle:@"Fetching patients.."];
        [[ServerRequestManager sharedManager] getAllPatients:@{@"_token":user.auth_token, @"clinic_id":self.clinic.clinic_id} withBlock:^(Patient *responseObject, BOOL status, NSError *error) {
            [self hideSpinner];
            
            if (status && responseObject) {
            
                arrayAllPatients = responseObject.allPatients;
                [self getFullName];
                searchedPatients = arrayAllPatients;
                filteredPatients = arrayAllPatients;
                [self btnTodayClicked:btnToday];
            }
        }];
    }
}

- (void)getFullName{
    
    for (PatientDetail *patientDetail in arrayAllPatients) {
        [patientDetail setFullName:[NSString stringWithFormat:@"%@ %@",patientDetail.firstname, patientDetail.lastname]];
    }
}

- (void)configureTableAndObjects{
    arrayAllPatients = [[NSMutableArray alloc]init];
    searchedPatients = [[NSMutableArray alloc]init];
    filteredPatients = [[NSMutableArray alloc]init];
    [self setTableLayout:tblViewPatients];
    [txtFieldSearch addTarget:self
                       action:@selector(textFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate & Data Source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return searchedPatients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PatientListTableViewCell *cell = (PatientListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PatientListTableViewCell"];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setData:searchedPatients[indexPath.row] forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:PATIENT_DETAIL_SEGUE sender:indexPath];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"PatientDetailVCSegue"]) {
        
        PatientDetailViewController *patientDetailVC = (PatientDetailViewController *)segue.destinationViewController;
        [patientDetailVC setArrayAllPatients:arrayAllPatients];
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        [patientDetailVC setSelectedPatient:arrayAllPatients[indexPath.row]];
        [patientDetailVC setClinic:self.clinic];
    }
}

- (IBAction)btnAllPatientsClicked:(UIButton *)sender {
    
    filteredPatients = arrayAllPatients;
    [self setButtons:sender];
    [self textFieldDidChange:nil];
}

- (IBAction)btnTodayClicked:(UIButton *)sender {

    filteredPatients = [self fetchTodaysPatient];
    [self setButtons:sender];
}

- (void)setButtons:(UIButton *)btn{
    
    [btnAllPatients setSelected:NO];
    [btnToday setSelected:NO];
    [btnAllPatients setBackgroundColor:[UIColor clearColor]];
    [btnToday setBackgroundColor:[UIColor clearColor]];
    [btn setBackgroundColor:[UIColor colorWithHexString:COLOR_BLUE_APP]];
    [btn setSelected:YES];
    [self textFieldDidChange:nil];
}

- (NSMutableArray *)fetchTodaysPatient{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    BSDateFormatter *formatter = [BSDateFormatter sharedFormatter];
    for (PatientDetail *detail in arrayAllPatients) {
        
        if ([detail.date isEqualToString:[formatter parseDate:[NSDate date] inFormat:@"yyyy-MM-dd"]]) {
            
            [array addObject:detail];
        }
    }
    return array;
}

#pragma mark - UITextField Notification
- (void)textFieldDidChange:(NSNotification *)notification{
    
    if (txtFieldSearch.text.length)    {
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.fullName CONTAINS[cd] %@", txtFieldSearch.text];
        searchedPatients = [[filteredPatients filteredArrayUsingPredicate:pred] mutableCopy];
    }
    else{
        searchedPatients = filteredPatients;
    }
    [tblViewPatients reloadData];
}

#pragma mark - Unwind Segue
- (IBAction)unwindPatientListVCSegue:(UIStoryboardSegue *)sender{
    
}

@end
