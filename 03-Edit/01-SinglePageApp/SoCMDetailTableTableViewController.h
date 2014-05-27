//
//  SoCMDetailTableTableViewController.h
//  02-DetailView
//
//  Created by Nicholas Outram on 22/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoCMModalViewController.h"

@protocol SoCMDetailTableTableViewControllerDelegate <NSObject>

-(void)save:(NSMutableArray*)updatedArray;

@end



//Class declaration
@interface SoCMDetailTableTableViewController : UITableViewController<SoCMModalViewControllerDelegate>
@property(readwrite, nonatomic, strong) NSMutableArray* arrayOfWisdomForEditing;
@property(readwrite, nonatomic, weak) id<SoCMDetailTableTableViewControllerDelegate>parentObject;
@end
