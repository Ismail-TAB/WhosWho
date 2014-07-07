//
//  TIWDetailsViewController.h
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TIWCircleImageView.h"
#import "Employee.h"

@interface TIWDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet TIWCircleImageView *ivImage;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UITextView *tvBiography;
@property (strong, nonatomic)  Employee *employee;


@end
