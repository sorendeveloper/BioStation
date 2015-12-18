//
//  ClinicsListViewController.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ClinicsListViewController.h"
#import "ClinicsTableViewCell.h"
#import "PatientListViewController.h"

#define PatientListViewControllerSegue @"PatientListVCSegue"

@interface ClinicsListViewController ()

@end

@implementation ClinicsListViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self initializeView];
}

- (void)initializeView{
    selectedRow = NSNotFound;
    [txtFieldSearch addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
    LoggedUser *user = GetUserInfo;
    [lblUserName setText:user.user_name];
    [lblDate setText:[[BSDateFormatter sharedFormatter] parseDate:[NSDate date] inFormat:@"cccc MMMM dd,yyyy"]];
    [self.navigationController setNavigationBarHidden:YES];
    arrayAllClinics = [[NSMutableArray alloc]init];
    searchedClinics = [[NSMutableArray alloc]init];
    
    if ([tblViewClinics respondsToSelector:@selector(setSeparatorInset:)]) {
        [tblViewClinics setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tblViewClinics respondsToSelector:@selector(setLayoutMargins:)]) {
        [tblViewClinics setLayoutMargins:UIEdgeInsetsZero];
    }
    tblViewClinics.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    arrayAllClinics = user.allAssociatedClinics;
    searchedClinics = arrayAllClinics;
    [tblViewClinics reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Delegate & Data Source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return searchedClinics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"ClinicsTableViewCell";
    
    ClinicsTableViewCell *cell = (ClinicsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell setClinicData:searchedClinics[indexPath.row] asSelected:indexPath.row==selectedRow?YES:NO];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if (selectedRow == NSNotFound || selectedRow != indexPath.row) {
        selectedRow = indexPath.row;
    }
    else {
        selectedRow = NSNotFound;
    }
    [tblViewClinics reloadData];
}

#pragma mark - Button MEthods

- (IBAction)btnProceedClicked:(UIButton *)sender{
    
    if (selectedRow == NSNotFound) {
        [Utility showAlert:@"" andMessage:@"Please select clinic."];
        return;
    }
    [self performSegueWithIdentifier:PatientListViewControllerSegue sender:self];
}

#pragma mark - UITextField Notification
- (void)textFieldDidChange:(NSNotification *)notification{

    if (txtFieldSearch.text.length)    {
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.clinic_name CONTAINS[cd] %@", txtFieldSearch.text];
        searchedClinics = [[arrayAllClinics filteredArrayUsingPredicate:pred] mutableCopy];
    }
    else{
        searchedClinics = arrayAllClinics;
    }
    [tblViewClinics reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:PatientListViewControllerSegue]) {
        PatientListViewController *patientList = (PatientListViewController *)segue.destinationViewController;
        patientList.clinic = searchedClinics[selectedRow];
    }
}

#pragma mark - unwing Segue
- (IBAction)unwindClinicsListVCSegue:(UIStoryboardSegue *)sender{
    
}
@end
