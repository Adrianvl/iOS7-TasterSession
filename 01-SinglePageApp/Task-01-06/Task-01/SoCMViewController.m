//
//  SoCMViewController.m
//  Task-01
//
//  Created by Nicholas Outram on 24/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import "SoCMViewController.h"

@interface SoCMViewController ()

@end

@implementation SoCMViewController {
    NSArray* arrayOfWisdom;
    NSUInteger index;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (arrayOfWisdom == nil) {
        arrayOfWisdom = @[ @"May the force be with you",
                            @"If things don't change, they will stay as they are",
                            @"A day without sunshine is like night",
                            @"Why does the sun not come out at night when it would be more useful?",
                            @"if you have noticed this notice you will have noticed that this notice is not worth noticing",
                            @"Always remember you're unique, just like everyone else",
                            @"It's comforting to reminisce with people you don't know"
                            ];
        index = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doTap:(id)sender {
    NSLog(@"You tapped the button");
//    self.messageLabel.text = @"You tapped the button";
    NSString* nextMessage = arrayOfWisdom[index];           //Extract the next string
    index++;                                                //Increment the index
    index%=arrayOfWisdom.count;                             //Wrap back to zero
    [self.messageLabel setText:nextMessage];
}
@end
