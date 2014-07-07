//
//  TIWCircleImageView.m
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import "TIWCircleImageView.h"
#import "TIWImageDownloader.h"

@implementation TIWCircleImageView

- (void)setImageURI:(NSString *)imageURI {
    _imageURI = imageURI;
    
    if(nil == imageURI) {
        self.image = [UIImage imageNamed:@"person.jpeg"];
        return;
    }
    
    __weak TIWCircleImageView *weakSelf = self;
    
    [[TIWImageDownloader shared] fetchImageFromURL:imageURI completion:^(UIImage *image, NSString *imageIRL, NSError *error) {
        if(image && [imageURI isEqualToString: weakSelf.imageURI]) {
            weakSelf.image = image;
        }
    }];

}

- (void)awakeFromNib {
    // mask the image to a circle
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path;
    [self.layer setMask: layer];
    
    CGPathRelease(path);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
