//
//  ServerRequestManager.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompletionBlocks.h"
#import <AFNetworking/AFNetworking.h>
#import "URLs.h"
#import "UVJSONToModelMarshal.h"


@interface ServerRequestManager : NSObject

+ (instancetype)sharedManager;

- (void)connectToServerForRequest:(NSMutableURLRequest *)request withBlock:(BaseBlock)block;

@end
