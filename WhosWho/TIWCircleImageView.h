//
//  TIWCircleImageView.h
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIWCircleImageView : UIImageView
@property (nonatomic,strong) NSString *imageURI;
- (void)setImageURI:(NSString *)imageURI;

@end
