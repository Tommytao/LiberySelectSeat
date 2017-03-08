//
//  UserInfoViewController.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/3/5.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "UserInfoViewController.h"
#import "SSViewController.h"
#import "ScanQR.h"
#import "AppDelegate.h"
#import "/Users/Tommy/Projects/LiberySelectSeat/Pods/AFNetworking/AFNetworking/AFHTTPSessionManager.h"
#import "/Users/Tommy/Projects/LiberySelectSeat/Pods/AFNetworking/AFNetworking/AFURLSessionManager.h"
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
    [self loadWebRequest];
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

-(void)loadWebRequest{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSString *urlhead  =@"http://192.168.1.101:9090/userinfo?name=";
    NSString *urltext = [NSString stringWithFormat:@"%@%@",urlhead,myDelegate.username];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:urltext];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            //NSLog(@"%@ %@",response,responseObject);
            NSString *state = [(NSDictionary *)responseObject objectForKey:@"state"];
            NSString *seatid = [(NSDictionary *)responseObject objectForKey:@"seatid"];
            NSString *adtime = [(NSDictionary *)responseObject objectForKey:@"adtime"];
            NSString *name = [(NSDictionary *)responseObject objectForKey:@"name"];
            _NameLabel.text = name;
            
            if([seatid isEqual:@"0"]){
                _seatIDLabel.text = @"尚未预定";
            }else{
                _seatIDLabel.text = seatid;
            }
            if([adtime isEqual:@"1"]){
                _TimeLabel.text=@"7:00-12:00";
            }else if([adtime isEqual:@"2"]){
                _TimeLabel.text=@"12:00-17:00";
            }else if([adtime isEqual:@"3"]){
                _TimeLabel.text=@"17:00-22:00";
            }else{
                _TimeLabel.text=@"尚未预定";
            }
            
            if([state isEqual:@"1"]){
                _seatStateLabel.text=@"已预定";
            }else if([state isEqual:@"2"]){
                _seatStateLabel.text=@"已就坐";
            }else{
                _seatStateLabel.text=@"尚未预定";
            }

        }
    }];
    [dataTask resume];
    
}

@end
