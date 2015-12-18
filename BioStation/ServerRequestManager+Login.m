//
//  ServerRequestManager+Login.m
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ServerRequestManager+Login.h"
#import "LoggedUser.h"

@implementation ServerRequestManager (Login)

- (void)loginUser:(NSDictionary *)dict withBlock:(ResponseBlock)block{
    
    NSLog(@"=== %@", URL_LOGIN);
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URL_LOGIN parameters:dict error:nil];
    
    [self connectToServerForRequest:request withBlock:^(id operation, id response, BOOL status, NSError *error) {
        
        block(status?[[UVJSONToModelMarshal builder] objectFromJSON:response[@"data"] className:NSStringFromClass([LoggedUser class])]:nil, status, error);
    }];
}

@end
