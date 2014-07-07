//
//  Employee.m
//  WhosWho
//
//  Created by Ismail on 07/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//
#import "Employee.h"


@implementation Employee

@dynamic name;
@dynamic title;
@dynamic biography;
@dynamic imageURL;
@dynamic imageDownloaded;

+(Employee*) initWithContext:(NSManagedObjectContext*)context
{
    return (Employee*)[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
}

+(Employee*) findorBuildbyImageURL:(NSString*)imageURL withcontext:(NSManagedObjectContext*)context
{

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    fetchRequest.fetchLimit = 1;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"imageURL = %@",imageURL];
    
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    
    if (results.count > 0) {
        return [results objectAtIndex:0];
    }
    Employee *newEmp = [Employee initWithContext:context];
    newEmp.imageURL = imageURL;
    return newEmp;
}

@end
