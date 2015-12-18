//
//  ServerRequestManager+Patient.h
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ServerRequestManager.h"

@interface ServerRequestManager (Patient)

- (void)getAllPatients:(NSDictionary *)dict withBlock:(ResponseBlock)block;

- (void)getPatientWithId:(int)patientId forInfo:(NSDictionary *)dict withBlock:(ResponseBlock)block;

@end
