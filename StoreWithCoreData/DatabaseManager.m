//
//  DatabaseManager.m
//  StoreWithCoreData
//
//  Created by EduardoUrso on 2/20/15.
//  Copyright (c) 2015 EduardoUrso. All rights reserved.
//

#import "DatabaseManager.h"

@interface DatabaseManager ()

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation DatabaseManager

// The static shared instance
static DatabaseManager *sharedInstance = nil;

#pragma mark - Singleton Methods

+ (instancetype)sharedInstance
{
    if (!sharedInstance)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}


#pragma mark - Customized Getter
- (NSManagedObjectContext *)managedObjectContext
{
    // Check if the context doesn't already exist
    if (!_managedObjectContext)
    {
        
        // generic variable to hold any error occurred during context creation
        NSError *error = nil;
        
        // It is created from the application's model with the following name and extension
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"StoreWithCoreData" withExtension:@"momd"];
        self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        // Performing automatic lightweight migration by passing the following dictionary as the options parameter
        // The NSSQLitePragmasOption set the journal_mode to DELETE because the defaul mode on iOS 7 is WAL
        // And with this one we can't check the .sqlite file on the application's directory
        NSDictionary *persistentOptions = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES, NSSQLitePragmasOption: @{@"journal_mode": @"DELETE"}};
        
        // Create the coodinator with the previous parameters
        NSURL *storeURL = [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
        storeURL = [storeURL URLByAppendingPathComponent:@"StoreWithCoreData.sqlite"];
        
        NSLog(@"CoreData Location: %@", storeURL);
        
        // try to initialize persistent store coordinator with options defined below
        self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:persistentOptions error:&error];
        if (!error)
        {
            // initialize context
            _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        }
        else
        {
            NSLog(@"[ERROR] Problems to initialize persistent store coordinator: %@, %@", error, [error localizedDescription]);
        }
    }
    
    return _managedObjectContext;
}

@end
