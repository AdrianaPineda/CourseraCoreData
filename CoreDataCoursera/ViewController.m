//
//  ViewController.m
//  CoreDataCoursera
//
//  Created by Adriana Pineda on 12/25/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ChoreMO.h"

@interface ViewController ()

@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *choreTextField;
@property (weak, nonatomic) IBOutlet UILabel *logListLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    [self updateLogList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addChore:(id)sender {
    ChoreMO *choreMO = [self.appDelegate createChoreMO];
    choreMO.chore_name = self.choreTextField.text;
    
    [self.appDelegate saveContext];
    [self updateLogList];
    
}

- (IBAction)deleteAllChores:(id)sender {
    
    NSArray *chores = [self fetchChores];
    
    NSManagedObjectContext *moct = self.appDelegate.managedObjectContext;
    
    for (ChoreMO *chore in chores) {
        [moct deleteObject:chore];
    }
    
    [self.appDelegate saveContext];
    [self updateLogList];
}

- (void)updateLogList {
    
    NSArray *results = [self fetchChores];
    
    NSMutableString *buffer = [NSMutableString stringWithString:@""];
    
    for (ChoreMO *chore in results) {
        [buffer appendFormat:@"\n%@", chore.chore_name, nil];
    }
    
    [self.logListLabel setText:buffer];
}

- (NSArray *)fetchChores {
    
    NSManagedObjectContext *moct = self.appDelegate.managedObjectContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Chore"];
    
    NSError *error = nil;
    NSArray *results = [moct executeFetchRequest:fetchRequest error:&error];
    
    if (!results) {
        NSLog(@"Error fetching Chores: %@\n%@", [error localizedDescription], [error userInfo]);
        return NULL;
    }
    
    return results;
}
@end
