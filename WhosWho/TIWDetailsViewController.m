//
//  TIWDetailsViewController.m
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import "TIWDetailsViewController.h"

@interface TIWDetailsViewController ()

@end

@implementation TIWDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lblName.text = self.employee.name;
    self.lblTitle.text = self.employee.title;
    self.tvBiography.text = self.employee.biography;
    self.ivImage.imageURI = self.employee.imageURL;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
