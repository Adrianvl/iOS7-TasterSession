//
//  SoCMDetailTableTableViewController.m
//  02-DetailView
//
//  Created by Nicholas Outram on 22/05/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

#import "SoCMDetailTableTableViewController.h"
#import "SoCMSayingCell.h"

@interface SoCMDetailTableTableViewController ()
- (IBAction)doSave:(id)sender;
@end

@implementation SoCMDetailTableTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.arrayOfWisdomForEditing.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SoCMSayingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SayingCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.saying.text = self.arrayOfWisdomForEditing[indexPath.row];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.arrayOfWisdomForEditing removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.arrayOfWisdomForEditing exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You picked %@", self.arrayOfWisdomForEditing[indexPath.row]);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
static NSInteger selectedRow = 0;
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    selectedRow = self.tableView.indexPathForSelectedRow.row;
    NSLog(@"Row selected is %d", self.tableView.indexPathForSelectedRow.row);

    //Get destination view controller from storyboard
    SoCMModalViewController* mvc = segue.destinationViewController;
    
    //Update public properties
    mvc.sayingBeingEdited = self.arrayOfWisdomForEditing[selectedRow];
    mvc.delegate = self;
}


- (IBAction)doSave:(id)sender {
    [self.parentObject save:self.arrayOfWisdomForEditing];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doSaveEditingString:(NSString *)updatedString {
    if (updatedString) {
        //Update data model (save mode)
        self.arrayOfWisdomForEditing[selectedRow] = updatedString;
        [self.tableView reloadData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
