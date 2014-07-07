//
//  Employee.h
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Employee : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * biography;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * imageDownloaded;

+(Employee*) initWithContext:(NSManagedObjectContext*)context;
+(Employee*) findorBuildbyImageURL:(NSString*)imageURL withcontext:(NSManagedObjectContext*)context;


@end
