//
//  FirstViewController.m
//  POPDemo
//
//  Created by tb on 16/12/15.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "FirstViewController.h"
#import <pop/POP.h>
#import "SpecificCell.h"


@interface FirstViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tabview;

@property (nonatomic,strong) NSArray *dataArr;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"首页";
    
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.tabview.backgroundColor = [UIColor lightGrayColor];
    self.tabview.dataSource = self;
    self.tabview.delegate   = self;
    [self.view addSubview:self.tabview];
    
}

#pragma mark - tableview config

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    SpecificCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[SpecificCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vcName = [NSString stringWithFormat:@"%@ViewController",self.dataArr[indexPath.row]];
    UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 
- (UITableView *)tabview {
    if (!_tabview) {
        _tabview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tabview;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"Button_Anim",@"Wrong_Pwd_Anim",@"Custom_ViewController_Transition"];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
