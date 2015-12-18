//
//  Macros.h
//  BioStation
//
//  Created by Akash on 11/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#ifndef BioStation_Macros_h
#define BioStation_Macros_h

#define STORY_BOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define Rendering_Frequency 60.0

#define USER_INFO_KEY @"userInfo"

#define SaveUserInfo(userInfo) [UserDefaults archiveUserInfo:userInfo forKey:USER_INFO_KEY]

#define GetUserInfo [UserDefaults unArchiveUserInfo:USER_INFO_KEY]

#endif
