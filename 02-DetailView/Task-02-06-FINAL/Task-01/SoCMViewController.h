//
//  SoCMViewController.h
//  Task-01
//
//  Created by Nicholas Outram on 24/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoCMSayingsTableViewController.h"

@interface SoCMViewController : UIViewController<SoCMSayingsTableViewControllerDelegateProtocol>
- (IBAction)doTap:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
