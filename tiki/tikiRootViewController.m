//
//  tikiRootViewController.m
//  tiki
//
//  Created by Alex Lauderdale on 1/14/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiRootViewController.h"
#import "tikiDetailViewController.h"
#import "tikiViewCell.h"

@interface tikiRootViewController ()



@end

@implementation tikiRootViewController
{
    NSArray *tableData;
    NSArray *tikiPowers;
}

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
    // Do any additional setup after loading the view from its nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tikis" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    tableData = [dict objectForKey:@"tikiNames"];
    tikiPowers = [dict objectForKey:@"tikiPowers"];
    self.title = @"Meet The Tikis";

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tikiTableIdentifier = @"tikiViewCell";
    
    tikiViewCell *cell = (tikiViewCell *)[tableView dequeueReusableCellWithIdentifier:tikiTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"tikiViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    tikiDetailViewController *targetController = [[tikiDetailViewController alloc] init];
    
    targetController.navigationItem.title = [tableData objectAtIndex:indexPath.row];
    
    targetController.tikiNameText = [tableData objectAtIndex: indexPath.row];
    
    targetController.tikiPowerText = [tikiPowers objectAtIndex: indexPath.row];
    
    [self.navigationController
     pushViewController:targetController
     animated:YES];
    
    [targetController release];
    

    


    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
