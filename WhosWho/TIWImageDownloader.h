//
//  TIWImageDownloader.h
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIWImageDownloader : NSObject

+ (instancetype)shared;

- (void)fetchImageFromURL:(NSString *)url completion:(void(^)(UIImage *image, NSString *uri, NSError *error)) block;


@end
