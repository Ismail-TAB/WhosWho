//
//  TIWEmployeeTableViewCell.h
//  WhosWho
//
//  Created by Ismail on 06/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TIWCircleImageView.h"

@interface TIWEmployeeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
//@property (strong, nonatomic) IBOutlet UILabel *lblBiography;
@property (strong, nonatomic) IBOutlet TIWCircleImageView *ivImage;


@end
