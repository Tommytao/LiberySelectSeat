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
//    
//    UIButton *Loginbtn = [[UIButton alloc] initWithFrame:CGRectMake(100, kScreenHeight/1.5, kScreenWidth-100*2, 30)];
//    Loginbtn.backgroundColor = [UIColor whiteColor];
//    [Loginbtn setTitle:@"login" forState:UIControlStateNormal];
//    [Loginbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [Loginbtn addTarget:self action:@selector(loadWebRequest:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:Loginbtn];
    

    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebRequest:(id) sender
{
    NSString *username = _nameField.text;
    NSString *password = _passwordField.text;
    NSString *urlhead  =@"http://127.0.0.1:9090/search?name=";
    NSString *urlstring = [NSString stringWithFormat:@"%@&password=%@",username,password];
    NSString *urltext = [NSString stringWithFormat:@"%@%@",urlhead,urlstring];
//    //NSLog(@"%@",urltext);
//    NSURL *url = [NSURL URLWithString:urltext];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request  setHTTPMethod:@"GET"];
//    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
//    [connection start];
    
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
        NSLog(@"此处跳转");
        [self presentViewController:[[SSViewController alloc] init] animated:true completion:^{
            //跳转完成后需要执行的事件；
        }];
        
    }
}
//
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"%@",response);
//}
////接收网络数据
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    if (receiveData_ == nil){
//        receiveData_ = [[NSMutableData alloc] init];
//    }
//    [receiveData_ appendData:data];
//    
//    id obj = [NSJSONSerialization JSONObjectWithData:receiveData_ options:0 error:nil];
//    //NSLog(@"%@",obj);
//    if([obj isKindOfClass:[NSDictionary class]])
//    {
//        NSString *userid = [(NSDictionary *)obj objectForKey:@"id"];
//        if(userid !=nil){
//            
//            NSLog(@"登录成功");
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  
//                                  initWithTitle:@"提示" message:@"登录成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [alert show];
//
//        }
//
//    }
//}


-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
    
}

-(IBAction)backgroundTap:(id)sender
{
    
}

- (IBAction)Login:(UIButton *)sender {
    [self loadWebRequest:sender];
   
}

@end
