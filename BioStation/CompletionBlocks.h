//
//  CompletionBlocks.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#ifndef BioStation_CompletionBlocks_h
#define BioStation_CompletionBlocks_h

typedef void (^ResponseBlock)(id responseObject, BOOL status, NSError *error);
typedef void (^FailureBlock)(id responseObject);
typedef void (^ErrorBlock)(id responseObject, NSError *error);

typedef void (^BaseBlock)(id operation, id response, BOOL status, NSError *error);

#endif
