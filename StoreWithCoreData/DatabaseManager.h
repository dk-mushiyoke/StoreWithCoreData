//
//  DatabaseManager.h
//  StoreWithCoreData
//
//  Created by EduardoUrso on 2/20/15.
//  Copyright (c) 2015 EduardoUrso. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface DatabaseManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (instancetype)sharedInstance;

@end
