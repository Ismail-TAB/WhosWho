//
//  TIWImageDownloader.m
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import "TIWImageDownloader.h"

static TIWImageDownloader *shared = nil;

@implementation TIWImageDownloader
{
    NSOperationQueue *_queue;
}


+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [TIWImageDownloader new];
    });
    return shared;
}

- (instancetype)init {
    if((self = [super init])) {
        _queue = [NSOperationQueue new];
    }
    return self;
}

- (void)fetchImageFromURL:(NSString *)imageUrl completion:(void(^)(UIImage *image, NSString *uri, NSError *error)) block;

{
    NSParameterAssert(imageUrl);
    NSParameterAssert(block);
    
    NSURL *url = [NSURL URLWithString: imageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    NSString *hash = [NSString stringWithFormat: @"%016x", [imageUrl hash]];
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent: hash];
    
    // check whether we have a cached version of the image we can return straight away
    
    UIImage *image = nil;
    NSData *data = [NSData dataWithContentsOfFile: path options: NSDataReadingMappedIfSafe error: NULL];
    if(data && (image = [UIImage imageWithData: data])) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image,imageUrl,nil);
        });
        return; // we could disable this to perform the check for updated images
    }
    
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: _queue
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         
         UIImage *image = nil;
         
         
         if(data) {
             // save it to the cache directory
             NSError *err = nil;
             if(![data writeToFile: path options: NSDataWritingAtomic error: &err]) {
                 NSLog(@"couldn't write image to cache at '%@': %@", path, err);
             }
             
             image = [UIImage imageWithData: data];
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             block(image,imageUrl,connectionError);
         });
     }];
}

@end
