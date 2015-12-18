//
//  LoggedUser.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "LoggedUser.h"
#import "Clinic.h"

@implementation LoggedUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"access_type":@"access_type",
             @"name":@"name",
             @"user_name":@"user_name",
             @"user_type":@"user_type",
             @"auth_token":@"auth_token",
             @"allAssociatedClinics":@"clinics_associated",
             };
}

+ (NSValueTransformer *)allAssociatedClinicsJSONTransformer
{
    // tell Mantle to populate appActions property with an array of ChoosyAppAction objects
    return  [MTLJSONAdapter arrayTransformerWithModelClass:[Clinic class]];
}

@end
