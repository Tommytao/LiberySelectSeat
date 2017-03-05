//
//  UserInfoViewController.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/3/5.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "UserInfoViewController.h"
#import "SSViewController.h"

@interface UserInfoViewController ()
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
