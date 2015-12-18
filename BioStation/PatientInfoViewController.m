//
//  PatientInfoViewController.m
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "PatientInfo.h"
#import "UIColor+Additions.h"
#import "ColorFile.h"

@interface PatientInfoViewController ()

@end

@implementation PatientInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPatientInfo:(id)data{
    
    NSLog(@"patient info");
    PatientInfo *patientInfo = (PatientInfo *)data;

//    *************** ATTRIBUTED STRING**************
    
    [lblAge setAttributedText:[self getAttributedStringForVal:[NSString stringWithFormat:@"%d",patientInfo.age] unit:@"" andTerm:@"\nAge"]];
    [lblWeight setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.weight] unit:@" kg" andTerm:@"\nWeight"]];
    [lblLeftArm setAttributedText:[self getAttributedStringForVal:patientInfo.vitals.left_arm.length?patientInfo.vitals.left_arm:@"0" unit:@"" andTerm:@"\nLft Arm"]];
    [lblRightArm setAttributedText:[self getAttributedStringForVal:patientInfo.vitals.right_arm.length?patientInfo.vitals.right_arm:@"0" unit:@"" andTerm:@"\nRt Arm"]];
    
    [lblPulse setAttributedText:[self getAttributedStringForVal:patientInfo.vitals.pulse.length?patientInfo.vitals.pulse:@"0" unit:@"" andTerm:@"\nPulse OX"]];
    [lblPain setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.pain] unit:@"" andTerm:@"\nRt Arm"]];
    
    [lblHeight setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.height] unit:@" cm" andTerm:@"\nHeight"]];
    [lblHeartRate setAttributedText:[self getAttributedStringForVal:patientInfo.vitals.hr.length?patientInfo.vitals.hr:@"0" unit:@" bpm" andTerm:@"\nHeart Rate"]];
    [lblTemp setAttributedText:[self getAttributedStringForVal:patientInfo.vitals.temp.length?patientInfo.vitals.temp:@"0" unit:@"°" andTerm:@"\nTemperature"]];
    
    [lblBMI setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.bmi] unit:@"" andTerm:@"\nBMI"]];
    
    [lblRR setAttributedText:[self getAttributedStringForVal:patientInfo.vitals.rr.length?patientInfo.vitals.rr:@"0" unit:@" bps" andTerm:@"\nRR"]];
    [lblWaistCircum setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.waist_circumference] unit:@" cm" andTerm:@"\nWC"]];
    
    [lblHipCircum setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.hip_circumference] unit:@" cm" andTerm:@"\nHC"]];
    
    [lblRatio setAttributedText:[self getAttributedStringForVal:[self valueString:patientInfo.vitals.waist_hip_ratio] unit:@" cm" andTerm:@"\nWaist Hip Ratio"]];
}


- (NSString *)valueString:(id)value{
    
    if (value) {
        
        NSString *string = [NSString stringWithFormat:@"%@", value];
        return string.length?string:@"0";
    }
    return @"0";
}


- (NSMutableAttributedString *)getAttributedStringForVal:(NSString *)value unit:(NSString *)unit andTerm:(NSString *)term{
    
    NSMutableAttributedString *value_att = [self getAttributedString:value withSize:16.0f];
    NSMutableAttributedString *value_unit = [self getAttributedString:unit withSize:12.0f];
    NSMutableAttributedString *value_term = [self getAttributedString:term withSize:13.0f];
    
    [value_att appendAttributedString:value_unit];
    [value_att appendAttributedString:value_term];
    
    return value_att;
}


- (NSMutableAttributedString *)getAttributedString:(NSString *)string withSize:(CGFloat)size{
    
    NSMutableAttributedString *value = [[NSMutableAttributedString alloc] initWithString : string
                                                                attributes : @{
                                                                               NSFontAttributeName : [UIFont fontWithName:@"Avenir-Book" size:size],
                                                                               NSForegroundColorAttributeName : [UIColor colorWithHexString:DARK_BLUE_APP],
                                                                               }];
    return value;
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
