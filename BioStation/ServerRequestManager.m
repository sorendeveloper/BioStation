//
//  ServerRequestManager.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ServerRequestManager.h"

@implementation ServerRequestManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceQueue;
    static ServerRequestManager *__sharedClient = nil;
    dispatch_once(&onceQueue, ^{
        __sharedClient = [[self alloc] init];
    });
    return __sharedClient;
}

- (void)connectToServerForRequest:(NSMutableURLRequest *)request withBlock:(BaseBlock)block{
    
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"text/x-json" forHTTPHeaderField:@"json"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //    manager.securityPolicy.allowInvalidCertificates = YES;
    
    AFHTTPRequestOperation *op = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"SUCCESS RESPONSE IS== %@", [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        block(operation, [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil], [[[responseDictionary objectForKey:@"result"] objectForKey:@"rstatus"] intValue]?YES:NO, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"FAILURE RESPONSE IS== %@", error.description);
        block(operation, nil, NO, error);
        
    }];
    
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    [[NSOperationQueue mainQueue] addOperation:op];
    
}


@end
