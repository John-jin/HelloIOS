//
//  NewTableViewController.m
//  Demo
//
//  Created by jxn on 2017/1/6.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "NewTableViewController.h"
#import "TVCellTableViewCell.h"
#import "Tools.h"

@interface NewTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,assign) NSInteger postion;
@property(nonatomic,assign) BOOL isFirstSlideBottom;
@end

@implementation NewTableViewController
-(void)navigateRightClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击右按钮" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES
                     completion:nil];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _postion = indexPath.row;
    NSString *tip = [NSString stringWithFormat:@"点击了%ld",(long)_postion];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:tip preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES
                     completion:nil];
}
- (void)viewDidLoad {
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"自定义cell" style:UIBarButtonItemStylePlain target:self action:@selector(navigateRightClick)];
    self.navigationItem.rightBarButtonItem = btn;
    [super viewDidLoad];
    _array = [NSMutableArray array];
    for (int i=0; i<100; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [_array addObject:str];
    }
    [self setupRefresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
    cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"reuseitem";
    TVCellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = [[TVCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setData:_array[indexPath.row]];
    
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_isFirstSlideBottom) {
        CGFloat height = scrollView.frame.size.height;
        CGFloat contentOffsetY = scrollView.contentOffset.y;
        CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY;
        if (bottomOffset <= height){
            NSLog(@"滑动到最底部");
        }
        _isFirstSlideBottom = NO;
    }
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    _isFirstSlideBottom = YES;
}
- (void)setupRefresh {
    NSLog(@"setupRefresh -- 下拉刷新");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshClick:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    [refreshControl beginRefreshing];
    [self refreshClick:refreshControl];
    }
-(void)sleep:(UIRefreshControl *)refreshControl{
    sleep(3);
    [refreshControl endRefreshing];
}
// 下拉刷新触发，在此获取数据
- (void)refreshClick:(UIRefreshControl *)refreshControl {
    NSLog(@"refreshClick: -- 刷新触发");
    // 此处添加刷新tableView数据的代码
    [[[NSThread alloc] initWithTarget:self selector:@selector(sleep:) object:refreshControl] start];
    [self.tableView reloadData];// 刷新tableView即可
    
    
}
@end
