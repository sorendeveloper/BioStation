//
//  BaseViewController.h
//  BioStation
//
//  Created by Akash on 10/12/15.
//  Copyright (c) 2015 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macros.h"
#import "UserDefaults.h"
#import "Utility.h"
#import "UIViewController+Additions.h"
#import "BSDateFormatter.h"
#import "UIColor+Additions.h"
#import "ColorFile.h"

@interface BaseViewController : UIViewController

- (void)setTableLayout:(UITableView *)tableView;
@end
