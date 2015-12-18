//
//  PatientInfo.m
//  BioStation
//
//  Created by Akash on 17/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "PatientInfo.h"

@implementation PatientInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{@"address":@"address",
             @"age":@"age",
             @"auth_required":@"auth_required",
             @"city":@"city",
             @"dob":@"dob",
             @"doi":@"doi",
             @"has_img":@"has_img",
             @"homephone":@"homephone",
             @"patientId":@"id",
             @"imgUrl":@"img",
             @"mobilephone":@"mobilephone",
             @"name":@"name",
             @"next_appt":@"next_appt",
             @"ref_doc":@"ref_doc",
             @"sex":@"sex",
             @"ssn":@"ssn",
             @"state":@"state",
             @"workphone":@"workphone",
             @"zip":@"zip",
             @"patientBalance":@"pat_balance",
             @"vitals":@"vitals",
             };
}

+ (NSValueTransformer *)patientBalanceJSONTransformer
{
    // tell Mantle to populate appActions property with an array of ChoosyAppAction objects
    return  [MTLJSONAdapter dictionaryTransformerWithModelClass:[PatientBalance class]];
}

+ (NSValueTransformer *)vitalsJSONTransformer
{
    // tell Mantle to populate appActions property with an array of ChoosyAppAction objects
    return  [MTLJSONAdapter dictionaryTransformerWithModelClass:[Vitals class]];
}

@end

@implementation PatientBalance

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"day120":@"day-120",
             @"day31_60":@"day-31-60",
             @"day61_90":@"day-61-90",
             @"day91_120":@"day-91-120",
             
             @"ins_bal":@"ins-bal",
             @"month":@"@month",
             @"pat_bal":@"pat-bal",
             
             @"prepay":@"prepay",
             @"today":@"today",
             @"total":@"total",
             };
}

@end


@implementation Vitals

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{
             @"added_date":@"added_date",
             @"bmi":@"bmi",
             @"chest":@"chest",
             @"height":@"height",
             @"hip_circumference":@"hip_circumference",
             @"hr":@"hr",
             @"left_arm":@"left_arm",
             @"left_thigh":@"left_thigh",
             @"neck":@"neck",
             @"pain":@"pain",
             @"peak_flow":@"peak_flow",
             @"pulse":@"pulse",
             @"right_arm":@"right_arm",
             @"right_thigh":@"right_thigh",
             @"rr":@"rr",
             @"temp":@"temp",
             @"waist_circumference":@"waist_circumference",
             @"waist_hip_ratio":@"waist_hip_ratio",
             @"weight":@"weight",
             };
}

@end
