//
//  Utility.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

+ (void)networkError;
+ (float)getCurrentOS;
+ (BOOL)isDeviceTypeiPad;
+ (BOOL)isNetworkAvailble;
+ (BOOL)isNetworkAvailbleWithErrorMsg;

+(void)showErrorAlert:(NSString*)errorMessage;
+ (void)showAlert:(NSString *)title andMessage:(NSString *)message;
+ (BOOL)validEmail:(NSString*)email;

#define DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) / 180.0 * M_PI)

#define isConnected [Utility isNetworkAvailble]
#define isConnectedWithErrorMsg [Utility isNetworkAvailbleWithErrorMsg]


@end
