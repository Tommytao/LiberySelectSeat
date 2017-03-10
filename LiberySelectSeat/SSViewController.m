//
//  SSViewController.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/3/3.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "SSViewController.h"
#import "UserInfoViewController.h"
#import "AppDelegate.h"
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#define kScreenWidth [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface SSViewController ()
@property (strong, nonatomic) IBOutlet UILabel *Titlelabel;
@property (strong, nonatomic) IBOutlet UIImageView *DeskUI;
@property (strong, nonatomic) IBOutlet UIButton *SBtn1;
@property (strong, nonatomic) IBOutlet UIButton *SBtn2;
@property (strong, nonatomic) IBOutlet UIButton *SBtn3;
@property (strong, nonatomic) IBOutlet UIButton *SBtn4;
@property (strong, nonatomic) IBOutlet UIButton *SBtn5;
@property (strong, nonatomic) IBOutlet UIButton *SBtn6;
@property (strong, nonatomic) IBOutlet UIButton *SBtn7;
@property (strong, nonatomic) IBOutlet UIButton *SBtn8;
@property (strong, nonatomic) IBOutlet UIButton *SBtn9;
@property (strong, nonatomic) IBOutlet UIButton *SBtn10;
@property (strong, nonatomic) IBOutlet UIButton *SBtn11;
@property (strong, nonatomic) IBOutlet UIButton *SBtn12;
@property (strong, nonatomic) IBOutlet UIButton *SBtn13;
@property (strong, nonatomic) IBOutlet UIButton *SBtn14;
@property (strong, nonatomic) IBOutlet UIButton *SBtn15;
@property (strong, nonatomic) IBOutlet UIButton *SBtn16;
@property (strong, nonatomic) IBOutlet UIButton *SBtn17;
@property (strong, nonatomic) IBOutlet UIButton *SBtn18;
@property (strong, nonatomic) IBOutlet UIButton *SBtn19;
@property (strong, nonatomic) IBOutlet UIButton *SBtn20;
@property (strong, nonatomic) IBOutlet UIButton *SBtn21;
@property (strong, nonatomic) IBOutlet UIButton *SBtn22;
@property (strong, nonatomic) IBOutlet UIButton *SBtn23;
@property (strong, nonatomic) IBOutlet UIButton *SBtn24;
@property (strong, nonatomic) IBOutlet UIButton *SBtn25;
@property (strong, nonatomic) IBOutlet UIButton *SBtn26;
@property (strong, nonatomic) IBOutlet UIButton *SBtn27;
@property (strong, nonatomic) IBOutlet UIButton *SBtn28;
@property (strong, nonatomic) IBOutlet UIButton *SBtn29;
@property (strong, nonatomic) IBOutlet UIButton *SBtn30;
@property (strong, nonatomic) IBOutlet UIButton *SBtn31;
@property (strong, nonatomic) IBOutlet UIButton *SBtn32;
@property (strong, nonatomic) IBOutlet UIButton *SBtn33;
@property (strong, nonatomic) IBOutlet UIButton *SBtn34;
@property (strong, nonatomic) IBOutlet UIButton *SBtn35;
@property (strong, nonatomic) IBOutlet UIButton *SBtn36;
@end

@implementation SSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取网络数据
    [self backtofree];
    [self loadWebRequest:@"1":@"Time1"];

    // Do any additional setup after loading the view from its nib.
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

-(void)loadWebRequest:(NSString*)Time:(NSString*)Timestring
{
    NSString *urlhead  =@"http://192.168.1.101:9090/seatinfo";
    NSString *urlend =@"?time=";
    NSString *urltext = [NSString stringWithFormat:@"%@%@%@%@",urlhead,Timestring,urlend,Time];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:urltext];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            int length = [responseObject count];
            for(int i = 0; i<length-1 ; i++){
                NSString* seatid = [(NSDictionary *)responseObject[i] objectForKey:@"id"];
                if([seatid  isEqual: @"1"]){
                    [self.SBtn1 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"2"]){
                    [self.SBtn2 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"3"]){
                    [self.SBtn3 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"4"]){
                    [self.SBtn4 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"5"]){
                    [self.SBtn5 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"6"]){
                    [self.SBtn6 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"7"]){
                    [self.SBtn7 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"8"]){
                    [self.SBtn8 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"9"]){
                    [self.SBtn9 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"10"]){
                    [self.SBtn10 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"11"]){
                    [self.SBtn11 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"12"]){
                    [self.SBtn12 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"13"]){
                    [self.SBtn13 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"14"]){
                    [self.SBtn14 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"15"]){
                    [self.SBtn15 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"16"]){
                    [self.SBtn16 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"17"]){
                    [self.SBtn17 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"18"]){
                    [self.SBtn18 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"19"]){
                    [self.SBtn19 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"20"]){
                    [self.SBtn20 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"21"]){
                    [self.SBtn21 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"22"]){
                    [self.SBtn22 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"23"]){
                    [self.SBtn23 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"24"]){
                    [self.SBtn24 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"25"]){
                    [self.SBtn25 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"26"]){
                    [self.SBtn26 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"27"]){
                    [self.SBtn27 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"28"]){
                    [self.SBtn28 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"29"]){
                    [self.SBtn29 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"30"]){
                    [self.SBtn30 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"31"]){
                    [self.SBtn31 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"32"]){
                    [self.SBtn32 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"33"]){
                    [self.SBtn33 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"34"]){
                    [self.SBtn34 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"35"]){
                    [self.SBtn35 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }else if([seatid  isEqual: @"36"]){
                    [self.SBtn36 setBackgroundImage:[UIImage imageNamed:@"seat1.png"] forState:UIControlStateNormal];
                }
            }
            //NSString * countstring = [[NSString alloc] initWithFormat:@"%d",count];
            //NSArray *userid = [(NSDictionary *)responseObject objectForKey:@"id"];
            //NSLog(@"%@",countstring);
        }
    }];
    [dataTask resume];
    
    
}
-(void)backtofree{
    [self.SBtn1 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn2 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn3 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn4 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn5 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn6 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn7 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn8 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn9 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn10 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn11 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn12 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn13 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn14 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn15 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn16 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn17 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn18 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn19 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn20 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn21 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn22 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn23 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn24 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn25 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn26 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn27 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn28 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn29 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn30 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn31 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn32 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn33 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn34 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn35 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    [self.SBtn36 setBackgroundImage:[UIImage imageNamed:@"chair15.png"] forState:UIControlStateNormal];
    
}

-(void)btnaction:(NSString*)btnid{
        
}


- (IBAction)UserBtn:(UIButton *)sender {
    [self presentViewController:[[UserInfoViewController alloc] init] animated:true completion:^{
        //跳转完成后需要执行的事件；
    }];
}

- (IBAction)Timebtn1:(UIButton *)sender {
    [self backtofree];
    [self loadWebRequest:@"1":@"Time1"];
}


- (IBAction)Timabtn2:(UIButton *)sender {
    [self backtofree];
    [self loadWebRequest:@"1":@"Time2"];
}

- (IBAction)Timebtn3:(UIButton *)sender {
    [self backtofree];
    [self loadWebRequest:@"1":@"Time3"];
}




- (IBAction)SBtn1:(UIButton *)sender {
}
- (IBAction)SBtn2:(UIButton *)sender {
}
- (IBAction)SBtn3:(UIButton *)sender {
}
- (IBAction)SBtn4:(UIButton *)sender {
}

- (IBAction)SBtn5:(UIButton *)sender {
}

- (IBAction)SBtn6:(UIButton *)sender {
}
- (IBAction)SBtn7:(UIButton *)sender {
}
- (IBAction)SBtn8:(UIButton *)sender {
}

- (IBAction)SBtn9:(UIButton *)sender {
}

- (IBAction)SBtn10:(UIButton *)sender {
}
- (IBAction)SBtn11:(UIButton *)sender {
}
- (IBAction)SBtn12:(UIButton *)sender {
}

- (IBAction)SBtn13:(UIButton *)sender {
}

- (IBAction)SBtn14:(UIButton *)sender {
}
- (IBAction)SBtn15:(UIButton *)sender {
}
- (IBAction)SBtn16:(UIButton *)sender {
}

- (IBAction)SBtn17:(UIButton *)sender {
}

- (IBAction)SBtn18:(UIButton *)sender {
}
- (IBAction)SBtn19:(UIButton *)sender {
}
- (IBAction)SBtn20:(UIButton *)sender {
}

- (IBAction)SBtn21:(UIButton *)sender {
}

- (IBAction)SBtn22:(UIButton *)sender {
}
- (IBAction)SBtn23:(UIButton *)sender {
}
- (IBAction)SBtn24:(UIButton *)sender {
}

- (IBAction)SBtn25:(UIButton *)sender {
}

- (IBAction)SBtn26:(UIButton *)sender {
}
- (IBAction)SBtn27:(UIButton *)sender {
}


- (IBAction)SBtn28:(UIButton *)sender {
}
- (IBAction)SBtn29:(UIButton *)sender {
}
- (IBAction)SBtn30:(UIButton *)sender {
}

- (IBAction)SBtn31:(UIButton *)sender {
}

- (IBAction)SBtn32:(UIButton *)sender {
}
- (IBAction)SBtn33:(UIButton *)sender {
}

- (IBAction)SBtn34:(UIButton *)sender {
}
- (IBAction)SBtn35:(UIButton *)sender {
}

- (IBAction)SBtn36:(UIButton *)sender {
}




@end
