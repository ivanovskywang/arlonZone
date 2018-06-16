//
//  NSObject+arlonTableViewController.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "arlonTableViewController.h"

@interface arlonTableViewController ()
@property NSMutableArray *toDoItems;
@end

@implementation arlonTableViewController
-(void)loadInitialData{
    arlonTableItem *item1 = [[arlonTableItem alloc] init];
    item1.itemName = @"buy milk";
    [self.toDoItems addObject:item1];
    arlonTableItem *item2 = [[arlonTableItem alloc] init];
    item2.itemName = @"kill bill";
    [self.toDoItems addObject:item2];
    arlonTableItem *item3 = [[arlonTableItem alloc] init];
    item3.itemName = @"run run run";
    [self.toDoItems addObject:item3];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    self.title=@"TableView";
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(moveToAddItemVC)];
    self.navigationItem.rightBarButtonItem = barButtonItem1;
    
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navigation controller button selector
-(void)moveToAddItemVC{
    addItemViewController *addIVC = [[addItemViewController alloc]init];
    addIVC.saveBlock=^(arlonTableItem *addItem){
        [self.toDoItems addObject:addItem];
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:addIVC animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return the number of rows
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ListPrototypeCell";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(!cell) {        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    arlonTableItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if(toDoItem.checked){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}


#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    arlonTableItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.checked = !tappedItem.checked;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
}
@end
