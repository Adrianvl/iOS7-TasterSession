//
//  SoCMModalViewController.h
//  03-Edit
//
//  Created by Nicholas Outram on 23/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SoCMModalViewControllerDelegate <NSObject>
-(void)doSaveEditingString:(NSString*)updatedString;
@end

@interface SoCMModalViewController : UIViewController

@property(readwrite, nonatomic, weak) id<SoCMModalViewControllerDelegate> delegate;
@property(readwrite, nonatomic, strong) NSString* sayingBeingEdited;

@end
