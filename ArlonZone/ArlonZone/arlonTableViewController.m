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
@property NSInteger *fontSize;
@end

@implementation arlonTableViewController

-(void)loadInitialData{
    //先添加plist文件中的预存数据
    // 获取到Caches文件夹路径
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;

    // 拼接文件名
    NSString *initFilePath = [cachePath stringByAppendingPathComponent:@"tableVCinitData.plist"];
    NSLog(@"读取数据路径:%@",initFilePath);

    NSArray* initTableData = [NSMutableArray arrayWithContentsOfFile:initFilePath];
    for (int i = 0;i < [initTableData count]; i++)
    {
        arlonTableItem *tmpItem = [[arlonTableItem alloc] init];
        tmpItem.itemName = initTableData[i];
        [self.toDoItems addObject:tmpItem];
    }
    
    //读取解归档的数据
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFilePath = paths.firstObject  ;
    NSString *filePath = [documentFilePath stringByAppendingPathComponent:@"tableVCAddedData"];
    
    arlonTableItem *tmpItem  = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath] ;
    if(tmpItem)
    {
        NSLog(@"解归档得到数据%@", tmpItem.itemName);
        [self.toDoItems addObject:tmpItem];
    }

    
    
//    arlonTableItem *item1 = [[arlonTableItem alloc] init];
//    item1.itemName = @"buy milk";
//    [self.toDoItems addObject:item1];
//    arlonTableItem *item2 = [[arlonTableItem alloc] init];
//    item2.itemName = @"kill bill";
//    [self.toDoItems addObject:item2];
//    arlonTableItem *item3 = [[arlonTableItem alloc] init];
//    item3.itemName = @"run run run";
//    [self.toDoItems addObject:item3];
    
    
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
        [self addArlonItemArchive:addItem];
        [self.toDoItems addObject:addItem];
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:addIVC animated:YES];
    NSLog(@"%@",NSHomeDirectory());
}

-(void)addArlonItemArchive:(arlonTableItem *) addItem
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFilePath = paths.firstObject  ;
    NSString *filePath = [documentFilePath stringByAppendingPathComponent:@"tableVCAddedData"];
    BOOL result = [NSKeyedArchiver archiveRootObject:addItem toFile:filePath];
    if(result){
        NSLog(@"通过归档添加了%@", addItem.itemName);
    }else{
        NSLog(@"归档不成功!!!");
    }
    return;
    // 归档，调用归档方法
    NSString *filePath1 = [NSHomeDirectory() stringByAppendingString:@"person.plist"];
    BOOL success = [NSKeyedArchiver archiveRootObject:addItem  toFile:filePath1];
    NSLog(@"%d",success);
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
    
    NSString *strFontSize = [[NSUserDefaults standardUserDefaults] objectForKey:@"FontSize"];
    CGFloat iFontSize = 13;
    if (strFontSize.length > 0)
    {
        NSLog(@"从NSUserDefaults读取字体大小%@", strFontSize);
        iFontSize = [strFontSize floatValue];
    }
    
    
    //设置tableview中cell的字体
    UIFont *newFont = [UIFont fontWithName:@"Arial" size:iFontSize];
    //创建完字体格式之后就告诉cell
    cell.textLabel.font = newFont;
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
