//
//  ViewController.m
//  JHCollectionViewLayout
//
//  Created by Jivan on 2017/12/25.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "ViewController.h"
#import "WaterfallViewController.h"
#import "HorizontalPageViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

static NSString *cellReuserId = @"cellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.titles = @[@"瀑布流",@"横向布局"];
    
    WaterfallViewController * waterfall = [[WaterfallViewController alloc]init];
    waterfall.title = @"瀑布流Demo";
    [self.dataSource addObject:waterfall];
    
    HorizontalPageViewController * horizontalPage = [[HorizontalPageViewController alloc]init];
    horizontalPage.title = @"横向布局Demo";
    [self.dataSource addObject:horizontalPage];
    
    
    [self.tableView setHidden:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuserId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier: cellReuserId];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell ;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * vc = self.dataSource[indexPath.row];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
-(UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame: [UIScreen mainScreen].bounds];
        _tableView.delegate = self ;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView ;
}

-(NSArray *)titles
{
    if (!_titles) {
        
        _titles = [NSArray array];
    }
    return _titles ;
}

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
    }
    return _dataSource ;
}



@end




