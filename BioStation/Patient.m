//
//  Patient.m
//  BioStation
//
//  Created by Akash on 12/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "Patient.h"

@implementation Patient

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"allPatients":@"data",
             };
}

+ (NSValueTransformer *)allPatientsJSONTransformer
{
    // tell Mantle to populate appActions property with an array of ChoosyAppAction objects
    return  [MTLJSONAdapter arrayTransformerWithModelClass:[PatientDetail class]];
}
@end


@implementation PatientDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"address":@"address",
             @"birthdate":@"birthdate",
             @"date":@"date",
             @"firstname":@"firstname",
             @"lastname":@"lastname",
             @"patient_id":@"patient_id",
             @"sex":@"sex",
             };
}

@end
