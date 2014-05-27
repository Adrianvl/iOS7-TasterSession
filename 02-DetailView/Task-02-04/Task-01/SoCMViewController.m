//
//  SoCMViewController.m
//  Task-01
//
//  Created by Nicholas Outram on 24/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import "SoCMViewController.h"
#import "SoCMSayingsTableViewController.h"

@interface SoCMViewController ()
@property(readwrite, nonatomic, strong) NSNumber* index;
@property(readwrite, nonatomic, strong) NSArray* arrayOfWisdom;
@end

@implementation SoCMViewController {
}

//Accessors
@synthesize arrayOfWisdom = _arrayOfWisdom;

//Getter
-(NSArray*)arrayOfWisdom
{
    if (_arrayOfWisdom == nil) {
        self.arrayOfWisdom = @[ @"May the force be with you",
                           @"If things don't change, they will stay as they are",
                           @"A day without sunshine is like night",
                           @"Why does the sun not come out at night when it would be more useful?",
                           @"if you have noticed this notice you will have noticed that this notice is not worth noticing",
                           @"Always remember you're unique, just like everyone else",
                           @"It's comforting to reminisce with people you don't know"
                           ];
    }
    return _arrayOfWisdom;
}
-(NSNumber*)index
{
    if (_index == nil) {
        _index = @0;
    }
    return _index;
}

-(void)incrementIndex
{
    NSUInteger idx = self.index.unsignedIntegerValue;
    idx = (idx + 1) % self.arrayOfWisdom.count;
    self.index = [NSNumber numberWithUnsignedInteger:idx];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doTap:(id)sender {
    NSString* nextMessage = self.arrayOfWisdom[self.index.unsignedIntValue];           //Extract the next string
    [self incrementIndex];
    [self.messageLabel setText:nextMessage];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushTableView"]) {
        SoCMSayingsTableViewController* dest = segue.destinationViewController;
        dest.array = [self.arrayOfWisdom mutableCopy];
    }
}

@end
