//
//  Custom_ViewController_TransitionViewController.m
//  POPDemo
//
//  Created by tb on 16/12/15.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "Custom_ViewController_TransitionViewController.h"

@interface Custom_ViewController_TransitionViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) UIButton *presentBtn;

@end

@implementation Custom_ViewController_TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.presentBtn.frame = CGRectMake(100, 100, 100, 44);
    [self.presentBtn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.presentBtn];
}


- (void)presentAction {
    NSLog(@"presentAction");
    
}


#pragma mark - 
//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//
//}

//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
//    
//}


#pragma mark - 
- (UIButton *)presentBtn {
    if (!_presentBtn) {
        _presentBtn = [[UIButton alloc]init];
        [_presentBtn setTitle:@"present" forState:UIControlStateNormal];
    }
    return _presentBtn;
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
