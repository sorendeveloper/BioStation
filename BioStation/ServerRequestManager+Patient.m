//
//  ServerRequestManager+Patient.m
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ServerRequestManager+Patient.h"
#import "Patient.h"
#import "PatientInfo.h"

@implementation ServerRequestManager (Patient)

- (void)getAllPatients:(NSDictionary *)dict withBlock:(ResponseBlock)block{
    
//    NSLog(@"URL_PATIENT_LIST ==== %@", URL_PATIENT_LIST);
    
//    if ([URL_PATIENT_LIST isEqualToString:@"http://alpha.sorentech.com/api/v1/patient-list"]) {
//
//        NSLog(@"YES");
//    }
//    else{
//        NSLog(@"NO");
//    }
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URL_PATIENT_LIST parameters:dict error:nil];
    
    [self connectToServerForRequest:request withBlock:^(id operation, id response, BOOL status, NSError *error) {
        
        NSLog(@"response is== %@", response);
        block(status?[[UVJSONToModelMarshal builder] objectFromJSON:response className:NSStringFromClass([Patient class])]:nil, status, error);
    }];
}
//
- (void)getPatientWithId:(int)patientId forInfo:(NSDictionary *)dict withBlock:(ResponseBlock)block{

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@%d",URL_PATIENT_INFO,patientId] parameters:dict error:nil];
    
    [self connectToServerForRequest:request withBlock:^(id operation, id response, BOOL status, NSError *error) {
        
        NSLog(@"response is== %@", response);
        block(status?[[UVJSONToModelMarshal builder] objectFromJSON:response[@"data"] className:NSStringFromClass([PatientInfo class])]:nil, status, error);
    }];
}


@end
