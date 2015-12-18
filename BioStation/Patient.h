//
//  Patient.h
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseModel.h"

@interface Patient : BaseModel

@property (nonatomic, retain)NSMutableArray *allPatients;
@end

@interface PatientDetail : BaseModel

@property (nonatomic, retain)NSString *address;
@property (nonatomic, retain)NSString *birthdate;
@property (nonatomic, retain)NSString *date;
@property (nonatomic, retain)NSString *firstname;
@property (nonatomic, retain)NSString *lastname;
@property (nonatomic, readwrite)int patient_id;
@property (nonatomic, retain)NSString *sex;

@property (nonatomic, retain)NSString *fullName;

@end
