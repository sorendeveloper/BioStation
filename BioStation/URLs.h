//
//  URLs.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#ifndef BioStation_URLs_h
#define BioStation_URLs_h

#define BASE_URL @"http://alpha.sorentech.com/api/v1/" //SERVER URL GOES HERE

//static NSString * const kMMDAPIBaseURLString =@"http://mapmydoctor.com/doctorServices/";

#define URL_LOGIN [NSString stringWithFormat:@"%@login", BASE_URL]

#define URL_PATIENT_LIST [NSString stringWithFormat:@"%@patient-list", BASE_URL]

#define URL_PATIENT_INFO [NSString stringWithFormat:@"%@patient-info/", BASE_URL]

#endif
