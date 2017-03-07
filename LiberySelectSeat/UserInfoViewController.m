//
//  UserInfoViewController.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/3/5.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "UserInfoViewController.h"
#import "SSViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ScanQR.h"
#define kScreenWidth [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height
@interface UserInfoViewController()

@property (strong, nonatomic) IBOutlet UILabel *userinfolabel;
@property (strong, nonatomic) IBOutlet UILabel *NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *seatIDLabel;
@property (strong, nonatomic) IBOutlet UILabel *TimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *seatStateLabel;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)userInfo:(UIButton *)sender {
    [self presentViewController:[[SSViewController alloc] init] animated:true completion:^{
        //跳转完成后需要执行的事件；
    }];
}
- (IBAction)SignSeat:(UIButton *)sender {
    [self presentViewController:[[ScanQR alloc] init] animated:true completion:^{
        //跳转完成后需要执行的事件；
    }];
}


@end
