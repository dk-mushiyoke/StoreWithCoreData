//
//  DeviceDetailViewController.h
//  StoreWithCoreData
//
//  Created by EduardoUrso on 2/19/15.
//  Copyright (c) 2015 EduardoUrso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
