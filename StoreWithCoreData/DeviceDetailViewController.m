//
//  DeviceDetailViewController.m
//  StoreWithCoreData
//
//  Created by EduardoUrso on 2/19/15.
//  Copyright (c) 2015 EduardoUrso. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "DatabaseManager.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    if ([[self.nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]||[[self.versionTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]||[[self.companyTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Opss" message:@"you need to fill all the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    } else {
        
        // Create a new managed object
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:[[DatabaseManager sharedInstance] managedObjectContext]];
        [newDevice setValue:self.nameTextField.text forKey:@"name"];
        [newDevice setValue:self.versionTextField.text forKey:@"version"];
        [newDevice setValue:self.companyTextField.text forKey:@"company"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![[[DatabaseManager sharedInstance] managedObjectContext] save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}
@end
