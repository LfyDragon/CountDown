//
//  HomeViewController.m
//  timerTest
//
//  Created by ios2chen on 2017/8/22.
//  Copyright © 2017年 Lfy. All rights reserved.
//

#import "HomeViewController.h"
#import "CountDownController.h"
@interface HomeViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden = YES;
    //self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    
}
- (IBAction)BtnAction:(id)sender {
    
    if ([self.myTextField.text integerValue] >0) {
        CountDownController *vc = [[CountDownController alloc]initWithTime:[self.myTextField.text integerValue]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
   
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.myTextField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.myTextField resignFirstResponder];
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
