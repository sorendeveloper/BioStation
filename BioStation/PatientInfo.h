//
//  PatientInfo.h
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseModel.h"

@class PatientBalance;
@class Vitals;

@interface PatientInfo : BaseModel

@property (nonatomic, retain)NSString *address;
@property (nonatomic, readwrite)int age;
@property (nonatomic, readwrite)int auth_required;
@property (nonatomic, retain)NSString *city;
@property (nonatomic, retain)NSString *dob;
@property (nonatomic, retain)NSString *doi;

@property (nonatomic, readwrite)int has_img;

@property (nonatomic, retain)NSString *homephone;
@property (nonatomic, readwrite)int patientId;
@property (nonatomic, retain)NSString *imgUrl;

@property (nonatomic, retain)NSString *mobilephone;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSString *next_appt;
@property (nonatomic, retain)NSString *ref_doc;
@property (nonatomic, retain)NSString *sex;

@property (nonatomic, retain)NSString *ssn;
@property (nonatomic, retain)NSString *state;
@property (nonatomic, retain)NSString *workphone;
@property (nonatomic, retain)NSString *zip;

@property (nonatomic, retain)PatientBalance *patientBalance;
@property (nonatomic, retain)Vitals *vitals;



@end

@interface PatientBalance : BaseModel

@property (nonatomic, readwrite)int day120;
@property (nonatomic, readwrite)int  day31_60;
@property (nonatomic, readwrite)int  day61_90;
@property (nonatomic, readwrite)int  day91_120;

@property (nonatomic, readwrite)int  ins_bal;
@property (nonatomic, readwrite)int  month;
@property (nonatomic, readwrite)int  pat_bal;

@property (nonatomic, readwrite)int  prepay;
@property (nonatomic, readwrite)int  today;
@property (nonatomic, readwrite)int  total;


@end

@interface Vitals : BaseModel
@property (nonatomic, retain)NSString *added_date;
@property (nonatomic, retain)id bmi;
@property (nonatomic, retain)NSString *chest;


@property (nonatomic, retain)id hip_circumference;
@property (nonatomic, retain)NSString *hr;

@property (nonatomic, retain)NSString *left_arm;
@property (nonatomic, retain)NSString *left_thigh;
@property (nonatomic, retain)NSString *neck;


@property (nonatomic, retain)NSString *pulse;

@property (nonatomic, retain)NSString *right_arm;
@property (nonatomic, retain)NSString *right_thigh;
@property (nonatomic, readwrite)NSString *rr;

@property (nonatomic, retain)NSString *temp;


@property (nonatomic, retain)id height;
@property (nonatomic, retain)id pain;
@property (nonatomic, retain)id peak_flow;
@property (nonatomic, retain)id waist_circumference;
@property (nonatomic, retain)id waist_hip_ratio;
@property (nonatomic, retain)id weight;


@end
