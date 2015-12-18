//
//  LeftPatientListTableViewCell.h
//  BioStation
//
//  Created by Akash on 16/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftPatientListTableViewCell : UITableViewCell{
    
    __weak IBOutlet UILabel *lblPatientName;
}

- (void)setPatientData:(id)patientData isSelected:(BOOL)selected;

@end
