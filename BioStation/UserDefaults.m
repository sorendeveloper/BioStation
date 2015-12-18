//
//  UserDefaults.m
//  MapMyDoctor
//
//  Created by Akash on 09/11/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults


+ (void)saveObject:(id)object forKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}


+ (id)valueForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}


+ (void)removeValueForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}


+ (void)clearUserDefaults{
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}


+(void) setUserDefaultValue:(NSString*)value forKey:(NSString*)key
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setObject:value forKey:key];
    [defs synchronize];
}


-(NSString *) getUserDefaultValue:(NSString *)key
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSString *returnVal = (NSString *) [defs objectForKey:key];
    if (returnVal){
        return returnVal;
    }
    return nil;
}


+ (void)archiveUserInfo:(LoggedUser *)userInfo forKey:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
    [defaults setObject:data forKey:key];
    [defaults synchronize];
}


+ (LoggedUser*)unArchiveUserInfo:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data1 = [defaults objectForKey:@"userInfo"];
    id data = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    [defaults synchronize];
    
    return (LoggedUser *)data;
    
}


@end
