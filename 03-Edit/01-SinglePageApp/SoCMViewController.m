//
//  SoCMViewController.m
//  01-SinglePageApp
//
//  Created by Nicholas Outram on 22/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import "SoCMViewController.h"


@interface SoCMViewController ()
//This is known as an "anonymous category"
//It allows us to add private methods (and properties) to the SoCMViewController class
//without declaring them in the header file
@property(readwrite, nonatomic, strong) NSArray* arrayOfWisdom;
@end


//This is the class definition
@implementation SoCMViewController {
    //We can list private instance variables in here
    int iWiseIndex;
}

@synthesize arrayOfWisdom = _arrayOfWisdom;     //Specify the name of the (hidden) instance variable

//This methods is run when the view is actually loaded
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    iWiseIndex = 0;
}


//Override the read accessor - this is "lazy loading"
-(NSArray *)arrayOfWisdom
{
    //Is the instance variable (pointer) nil (the default)?
    if (_arrayOfWisdom == nil) {
        //This is the first time we accessed it - so set it using the "setter" to an object of type NSArray
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

//Called when you might expect!
- (void)didReceiveMemoryWarning
{
    //Note - super is the parent
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doTellMeAll:(id)sender {
    self.messageLabel.text = self.arrayOfWisdom[iWiseIndex];
    iWiseIndex++;
    iWiseIndex %= self.arrayOfWisdom.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushDetail"]) {
        SoCMDetailTableTableViewController* tvc = segue.destinationViewController;
        
        //Make this the delegate
        tvc.parentObject = self;
        
        //Copy data into the detail controller
        tvc.arrayOfWisdomForEditing = [self.arrayOfWisdom mutableCopy];
    }
}


//Call back from detailed view controller
-(void)save:(NSMutableArray *)updatedArray
{
    self.arrayOfWisdom = [updatedArray mutableCopy];
    iWiseIndex = 0;
}

//Action to unwind from any VC in the storyboard
//Change the name of this method to match the view controller you are using
- (IBAction)unwindToThisTopController:(UIStoryboardSegue*)sender
{
    //Does not even need any code
}

@end
