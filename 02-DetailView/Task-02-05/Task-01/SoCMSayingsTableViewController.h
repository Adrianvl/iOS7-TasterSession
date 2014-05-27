//
//  SoCMSayingsTableViewController.h
//  Task-02
//
//  Created by Nicholas Outram on 26/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SoCMSayingsTableViewControllerDelegateProtocol <NSObject>
@required
-(void)save:(NSArray*)arrayData;
@end

@interface SoCMSayingsTableViewController : UITableViewController
@property(readwrite, nonatomic, strong) NSMutableArray* array;
@property(readwrite, nonatomic, weak) id<SoCMSayingsTableViewControllerDelegateProtocol> delegate;
@end
