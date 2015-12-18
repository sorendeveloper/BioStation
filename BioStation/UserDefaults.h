//
//  UserDefaults.h
//  MapMyDoctor
//
//  Created by Akash on 09/11/15.
//  Copyright (c) 2015 Trinity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoggedUser.h"

@interface UserDefaults : NSObject


+(id)valueForKey:(NSString *)key;

+(void)saveObject:(id)object forKey:(NSString *)key;

+ (void)removeValueForKey:(NSString *)key;

+ (void)clearUserDefaults;

+ (void)archiveUserInfo:(LoggedUser *)userInfo forKey:(NSString *)key;

+ (LoggedUser*)unArchiveUserInfo:(NSString *)key;

@end
