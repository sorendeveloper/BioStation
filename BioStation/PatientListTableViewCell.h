//
//  PatientListTableViewCell.h
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"

@interface PatientListTableViewCell : UITableViewCell{
    
    __weak IBOutlet UILabel *lblSerialNo;
    __weak IBOutlet UILabel *lblPatientId;
    __weak IBOutlet UILabel *lblFirstName;
    __weak IBOutlet UILabel *lblLastName;
    __weak IBOutlet UILabel *lblAddress;
    __weak IBOutlet UILabel *lblGender;
    __weak IBOutlet UILabel *lblDate;
}

- (void)setData:(PatientDetail *)patientDetail forIndexPath:(NSIndexPath *)indexPath;
@end
