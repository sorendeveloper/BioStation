//
//  Utility.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "Utility.h"
#import <SystemConfiguration/SystemConfiguration.h>


@implementation Utility

+ (BOOL)isNetworkAvailble{
    
    const char *host_name = "google.com";
    BOOL _isDataSourceAvailable = NO;
    Boolean success;
    
    //Creates a reachability reference to the specified
    //network host or node name.
    SCNetworkReachabilityRef reachability =
    SCNetworkReachabilityCreateWithName(NULL,host_name);
    
    //Determines if the specified network target is reachable
    //using the current network configuration.
    SCNetworkReachabilityFlags flags;
    
    success = SCNetworkReachabilityGetFlags(reachability, &flags);
    _isDataSourceAvailable = success &&
    (flags & kSCNetworkFlagsReachable) &&
    !(flags & kSCNetworkFlagsConnectionRequired);
    
    CFRelease(reachability);
    return _isDataSourceAvailable;
    
    // Below code is not recognizing the 3G connection
    
    /*
     CFNetDiagnosticRef dReference;
     dReference = CFNetDiagnosticCreateWithURL (NULL, (__bridge CFURLRef)[NSURL URLWithString:@"www.apple.com"]);
     
     CFNetDiagnosticStatus status;
     status = CFNetDiagnosticCopyNetworkStatusPassively (dReference, NULL);
     
     CFRelease (dReference);
     
     if ( status == kCFNetDiagnosticConnectionUp )
     {
     return YES;
     }
     return NO;
     
     */
}


+ (BOOL)isNetworkAvailbleWithErrorMsg{
    
    if ([Utility isNetworkAvailble]) {
        
        return YES;
    }
    
    [Utility networkError];
    return NO;
}


+ (void)networkError{
    
    [self showErrorAlert:NSLocalizedString(@"Network Error", @"Network Error")];
}


+(void)showErrorAlert:(NSString*)errorMessage {
    
    [self showAlert:NSLocalizedString(@"Error", @"Error") andMessage:errorMessage];
}


+ (void)showAlert:(NSString *)title andMessage:(NSString *)message{
    
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"Dismiss", @"Dismiss") otherButtonTitles:nil] show];
}


+ (BOOL)isDeviceTypeiPad{
    
    NSString *deviceType = [UIDevice currentDevice].model;
    NSRange range = [deviceType rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch];
    if (range.length) {
        
        return NO;
    }
    return YES;
}

+ (float)getCurrentOS{
    
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


#pragma mark - Email Validations

+ (BOOL)validEmail:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
    
}

@end
