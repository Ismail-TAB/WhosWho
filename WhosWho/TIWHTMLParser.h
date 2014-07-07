//
//  TIWHTMLParser.h
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIWHTMLParser : NSObject
+(void) ParseHTMLAndSaveInContext:(NSManagedObjectContext*)context;

@end
