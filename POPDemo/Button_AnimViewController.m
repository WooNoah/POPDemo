//
//  Button_AnimViewController.m
//  POPDemo
//
//  Created by tb on 16/12/15.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "Button_AnimViewController.h"
#import <pop/POP.h>


@interface Button_AnimViewController () <UITextFieldDelegate>

@property (nonatomic,strong) IBOutlet UITextField *textfield;

//提交
@property (nonatomic,strong) IBOutlet UIButton *commitBtn;

//赞按钮
@property (nonatomic,strong) IBOutlet UIButton *likeBtn;

@end

@implementation Button_AnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"Button Animation";
    
    self.textfield.delegate = self;
    self.likeBtn.hidden = YES;
}

#pragma mark - textfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *comment;
    if(range.length == 0)
    {
        comment = [NSString stringWithFormat:@"%@%@", textField.text, string];
    }else{
        comment = [textField.text substringToIndex:textField.text.length - range.length];
    }
    
    if (comment.length == 0) {
        //Show like
        [self showLikeButton];
    }
    else
    {
        //Show Send
        [self showSendButton];
    }
    return YES;
}


-(void)showLikeButton {
    if (self.likeBtn.isHidden) {
        self.likeBtn.hidden = NO;
        self.commitBtn.hidden = YES;
        
        POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        
        spin.fromValue = @(- M_PI/8);
        spin.toValue = @(0);
        spin.springBounciness = 20;
        spin.velocity = @(10);
        [self.likeBtn.layer pop_addAnimation:spin forKey:@"showLikeButton"];
    }
    else {
        
    }
}

-(void)showSendButton {
    if (self.commitBtn.isHidden) {
        
        self.likeBtn.hidden = YES;
        self.commitBtn.hidden = NO;
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        
        sprintAnimation.fromValue = [NSValue valueWithCGPoint:CGPointZero];
        
//        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
        sprintAnimation.springBounciness = 20;
        [self.commitBtn pop_addAnimation:sprintAnimation forKey:@"showNormalButton"];
    }
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
