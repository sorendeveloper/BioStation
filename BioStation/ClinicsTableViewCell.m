//
//  ClinicsTableViewCell.m
//  BioStation
//
//  Created by Akash on 11/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ClinicsTableViewCell.h"

@implementation ClinicsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setClinicData:(Clinic *)clinic asSelected:(BOOL)selected{
    
    [lblClinicName setText:clinic.clinic_name];
    [btnCheck setSelected:selected];
}

@end
