//
//  TIWMainTableViewController.m
//  WhosWho
//
//  Created by Ismail on 06/07/2014.
//  Copyright (c) 2014 The App Business. All rights reserved.
//

#import "TIWMainTableViewController.h"
#import "TIWHTMLParser.h"
#import <CoreData/CoreData.h>
#import "TIWAppDelegate.h"
#import "Employee.h"
#import "TIWDetailsViewController.h"

@interface TIWMainTableViewController () <NSFetchedResultsControllerDelegate>
@property(strong,nonatomic) NSManagedObjectContext * context;
@property (strong,nonatomic)NSFetchedResultsController* fetchedResultsController;


@end

@implementation TIWMainTableViewController
@synthesize context;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)reloadContext
{
//    [self.loading startAnimating];
    [TIWHTMLParser ParseHTMLAndSaveInContext:context];
    NSError * error;
    [self.fetchedResultsController performFetch:&error];
    if (error) {
        NSLog(@"Can not fetch Locations ERORR::::%@",error);
        
    }
//    [self.loading stopAnimating];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    TIWAppDelegate *appD = [[UIApplication sharedApplication]delegate];
    context = [appD managedObjectContext];
    
    [self reloadContext];

    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];

}

- (TIWEmployeeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TIWEmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmployeeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}
-(void)configureCell:(TIWEmployeeTableViewCell*)cell atIndexPath:(NSIndexPath *)indexPath
{
    [cell.ivImage setImageURI:nil];
    Employee * emp = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.lblName.text =[emp name];
    cell.lblTitle.text = [emp title];
    [cell.ivImage setImageURI:  [emp imageURL]];
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"EmployeeDetails"]) {

    // Get the new view controller using [segue destinationViewController].
        TIWDetailsViewController * vc = [segue destinationViewController];
        NSIndexPath* indx = [self.tableView indexPathForSelectedRow];
        
        vc.employee = [self.fetchedResultsController objectAtIndexPath:indx];
    // Pass the selected object to the new view controller.
    }
}
#pragma mark - fetchedResultsController
- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    // Create and configure a fetch request with the Book entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    // Create the sort descriptors array.
    
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[nameDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Create and initialize the fetch results controller.
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
     UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
//        case NSFetchedResultsChangeDelete:
//            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//            break;
            
//        case NSFetchedResultsChangeUpdate:
//            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
//            break;
            
            //        case NSFetchedResultsChangeMove:
            //            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            //            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            //            break;
    }
}



- (IBAction)refresh:(id)sender {
    [self reloadContext];
    
}
@end
