//
//  LeftPatientListTableViewCell.m
//  BioStation
//
//  Created by Akash on 16/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "LeftPatientListTableViewCell.h"
#import "ColorFile.h"
#import "UIColor+Additions.h"
#import "Patient.h"

@implementation LeftPatientListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

- (void)setPatientData:(id)patientData isSelected:(BOOL)selected{
    
    PatientDetail *patientDetail = (PatientDetail *)patientData;
    [lblPatientName setText:[NSString stringWithFormat:@"%@ %@", patientDetail.firstname, patientDetail.lastname]];
    [self.contentView setBackgroundColor:selected?[UIColor colorWithHexString:COLOR_BLUE_APP]:[UIColor clearColor]];
    self.backgroundColor = self.contentView.backgroundColor;
    [lblPatientName setTextColor:selected?[UIColor whiteColor]:[UIColor blackColor]];
}

@end
