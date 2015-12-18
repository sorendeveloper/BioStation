//
//  ServerRequestManager+Login.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import "ServerRequestManager.h"

@interface ServerRequestManager (Login)

- (void)loginUser:(NSDictionary *)dict withBlock:(ResponseBlock)block;

@end
