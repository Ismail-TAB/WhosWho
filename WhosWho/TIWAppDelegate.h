//
//  TIWAppDelegate.h
//  WhosWho
//
//  Created by Ismail on 06/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
