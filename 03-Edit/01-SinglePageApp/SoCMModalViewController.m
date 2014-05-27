//
//  SoCMModalViewController.m
//  03-Edit
//
//  Created by Nicholas Outram on 23/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import "SoCMModalViewController.h"

@interface SoCMModalViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)dosave:(id)sender;
- (IBAction)doDismiss:(id)sender;
- (IBAction)doSwipeDown:(id)sender;
@end

@implementation SoCMModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.text = self.sayingBeingEdited;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dosave:(id)sender {
    [self.delegate doSaveEditingString:self.textView.text];
}

- (IBAction)doDismiss:(id)sender {
    [self.delegate doSaveEditingString:nil];
}

- (IBAction)doSwipeDown:(id)sender {
    [self.textView resignFirstResponder];
}
@end
