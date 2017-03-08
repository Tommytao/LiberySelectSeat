//
//  ViewController.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/2/22.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#import "SSViewController.h"
#import "AppDelegate.h"

#define kScreenWidth [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

@end
@interface ViewController()<NSURLConnectionDelegate>{
    NSMutableData *receiveData_;
}
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self creatBtn];
    _nameField.placeholder = @"name";
    _passwordField.placeholder=@"password";
    _passwordField.secureTextEntry = YES;

    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebRequest:(id) sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSString *name = _nameField.text;
    myDelegate.username = name;
    NSString *password = _passwordField.text;
    NSString *urlhead  =@"http://192.168.1.101:9090/Login?name=";
    NSString *urlstring = [NSString stringWithFormat:@"%@&password=%@",myDelegate.username,password];
    NSString *urltext = [NSString stringWithFormat:@"%@%@",urlhead,urlstring];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:urltext];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@",response,responseObject);
            NSString *userid = [(NSDictionary *)responseObject objectForKey:@"id"];
            if(userid !=nil){
                NSLog(@"登录成功");
                UIAlertView *alertsuccess = [[UIAlertView alloc]initWithTitle:@"提示" message:@"登录成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                alertsuccess.tag=1;
                [alertsuccess show];
            }else{
                UIAlertView *alertwrong = [[UIAlertView alloc]initWithTitle:@"提示" message:@"账号或密码不正确！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertwrong show];

            }

        }
    }];
    [dataTask resume];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {
        [self presentViewController:[[SSViewController alloc] init] animated:true completion:^{
            //跳转完成后需要执行的事件；
        }];
        
    }
}

-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
    
    
}

-(IBAction)backgroundTap:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (IBAction)Login:(UIButton *)sender {
    [self loadWebRequest:sender];
   
}

@end
