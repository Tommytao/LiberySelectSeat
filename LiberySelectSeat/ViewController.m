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



-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@",response);
}
//接收网络数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (receiveData_ == nil){
        receiveData_ = [[NSMutableData alloc] init];
    }
    [receiveData_ appendData:data];
    
    id obj = [NSJSONSerialization JSONObjectWithData:receiveData_ options:0 error:nil];
    //NSLog(@"%@",obj);
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSString *userid = [(NSDictionary *)obj objectForKey:@"id"];
        if(userid !=nil){
            NSLog(@"登录成功");
        }
    }
}


-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
    
}

-(IBAction)backgroundTap:(id)sender
{
}

- (IBAction)LoginButton:(id)sender {
    
    NSString *username = _nameField.text;
    NSString *password = _passwordField.text;
    NSString *urlhead  =@"http://127.0.0.1:9090/search?name=";
    // 1 创建URL对象
    NSString *urlstring = [NSString stringWithFormat:@"%@&password=%@",username,password];
    NSString *urltext = [NSString stringWithFormat:@"%@%@",urlhead,urlstring];
    //NSLog(@"%@",urltext);
    NSURL *url = [NSURL URLWithString:urltext];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request  setHTTPMethod:@"GET"];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [connection start];
    
}

@end
