//
//  Clinic.m
//  BioStation
//
//  Created by Akash on 11/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "Clinic.h"

@implementation Clinic

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"clinic_id":@"clinic_id",
             @"clinic_name":@"clinic_name",
             };
}
@end
