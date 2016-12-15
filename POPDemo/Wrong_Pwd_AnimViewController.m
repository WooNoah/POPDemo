//
//  Wrong_Pwd_AnimViewController.m
//  POPDemo
//
//  Created by tb on 16/12/15.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "Wrong_Pwd_AnimViewController.h"
#import <pop/POP.h>

@interface Wrong_Pwd_AnimViewController ()

@property (strong, nonatomic) IBOutlet UITextField *testTextfield;

@property (strong, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation Wrong_Pwd_AnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"Wrong Password";
}


- (IBAction)buttonClick:(id)sender {
    POPSpringAnimation *shake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleX];
    
    shake.springBounciness = 14;
    shake.velocity = @(30);
    
    [self.testTextfield.layer pop_addAnimation:shake forKey:@"shakeAnimationX"];
    
    POPSpringAnimation *shakeY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleY];
    shakeY.velocity = @(10);
    [self.testTextfield.layer pop_addAnimation:shakeY forKey:@"shakeAnimationY"];
    
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
