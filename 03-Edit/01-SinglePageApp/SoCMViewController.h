//
//  SoCMViewController.h
//  01-SinglePageApp
//
//  Created by Nicholas Outram on 22/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoCMDetailTableTableViewController.h"

//This is the class declaration
@interface SoCMViewController : UIViewController<SoCMDetailTableTableViewControllerDelegate> {
    //Publically visible instance variable can do here

}

//Declare public methods and properties here
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
- (IBAction)doTellMeAll:(id)sender;

@end
