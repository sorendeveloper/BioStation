//
//  ClinicsListViewController.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseViewController.h"

@interface ClinicsListViewController : BaseViewController{
    
    NSMutableArray *arrayAllClinics;
    __weak IBOutlet UITableView *tblViewClinics;
    NSInteger selectedRow;
    __weak IBOutlet UITextField *txtFieldSearch;
    NSMutableArray *searchedClinics;
    __weak IBOutlet UILabel *lblUserName;
    __weak IBOutlet UILabel *lblDate;
}

- (IBAction)btnProceedClicked:(UIButton *)sender;
- (IBAction)unwindClinicsListVCSegue:(UIStoryboardSegue *)sender;
@end
