//
//  LoggedUser.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "BaseModel.h"

@interface LoggedUser : BaseModel

@property (nonatomic, retain)NSString *access_type;
@property (nonatomic, retain)NSString *auth_token;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSString *user_name;
@property (nonatomic, retain)NSString *user_type;

@property (nonatomic, retain)NSMutableArray *allAssociatedClinics; // clinics associated to a doctor.

@end
