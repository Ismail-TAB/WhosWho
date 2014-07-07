//
//  TIWEmployeeTableViewCell.m
//  WhosWho
//
//  Created by Ismail on 06/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import "TIWEmployeeTableViewCell.h"

@implementation TIWEmployeeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
