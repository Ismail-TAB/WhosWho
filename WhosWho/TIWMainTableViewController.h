//
//  TIWMainTableViewController.h
//  WhosWho
//
//  Created by Ismail on 06/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TIWEmployeeTableViewCell.h"


@interface TIWMainTableViewController : UITableViewController
- (IBAction)refresh:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@end
