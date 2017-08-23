//
//  CountDownController.m
//  timerTest
//
//  Created by ios2chen on 2017/8/22.
//  Copyright © 2017年 Lfy. All rights reserved.
//

#import "CountDownController.h"
#import "CountDownView.h"
@interface CountDownController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (assign, nonatomic) NSInteger time;
@property (strong, nonatomic) NSTimer *myTimer;

@end

@implementation CountDownController

-(id)initWithTime:(NSInteger)time{
    self = [super init];
    if (self) {
        
        self.time = time;
        
        
    }
    return self;
}

- (IBAction)backAction:(id)sender {
    
    [self.myTimer invalidate];
    self.myTimer = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
//43 43 43    146 146 146  61 191 135

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    //self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:43/255.0f green:43/255.0f blue:43/255.0f alpha:1];
    
    self.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)self.time];
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(action) userInfo:nil repeats:YES];
    
    CountDownView *trackView = [[CountDownView alloc]initWithFrame:CGRectMake(50, 200, 300, 300)];
    trackView.backgroundColor = [UIColor clearColor];
    trackView.flag = @"track";
    [self.view addSubview:trackView];
    
    CountDownView *processView = [[CountDownView alloc]initWithFrame:CGRectMake(50, 200, 300, 300)];
    processView.backgroundColor = [UIColor clearColor];
    processView.flag = @"process";
    processView.time = self.time;
    [self.view addSubview:processView];
    
}
-(void)action{
    
    self.time--;
    if (self.time >=0) {
        
        self.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)self.time];
        
    } else{
        [self.myTimer invalidate];
        self.myTimer = nil;
        self.timeLabel.text = @"0";
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
