//
//  ClinicsTableViewCell.h
//  BioStation
//
//  Created by Akash on 11/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clinic.h"

@interface ClinicsTableViewCell : UITableViewCell{
    
    __weak IBOutlet UIButton *btnCheck;
    __weak IBOutlet UILabel *lblClinicName;
}

- (void)setClinicData:(Clinic *)clinic asSelected:(BOOL)selected;
@end
