//
//  PatientListTableViewCell.m
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientListTableViewCell.h"
#import "BSDateFormatter.h"

@implementation PatientListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setData:(PatientDetail *)patientDetail forIndexPath:(NSIndexPath *)indexPath{
    
    self.separatorInset = UIEdgeInsetsZero;

    [lblSerialNo setText:[NSString stringWithFormat:@"%d",(int)indexPath.row+1]];
    [lblPatientId setText:[NSString stringWithFormat:@"%d",patientDetail.patient_id]];
    [lblFirstName setText:patientDetail.firstname];
    [lblLastName setText:patientDetail.lastname];
    [lblAddress setText:patientDetail.address];
    [lblGender setText:patientDetail.sex];
    [lblDate setText:[[BSDateFormatter sharedFormatter] parseDate:[[BSDateFormatter sharedFormatter] dateFromString:patientDetail.birthdate inFormat:@"MM/dd/yyyy"] inFormat:@"MMM dd, yyyy"]];

}

@end
