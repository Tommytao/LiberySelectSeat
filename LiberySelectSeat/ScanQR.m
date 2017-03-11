//
//  ScanQR.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/3/7.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "ScanQR.h"
#import <AVFoundation/AVFoundation.h>
#import "UserInfoViewController.h"
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#import "AppDelegate.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define customShowSize CGSizeMake(200, 200);
@interface ScanQR ()<AVCaptureMetadataOutputObjectsDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
/** 输入数据源 */
@property (nonatomic, strong) AVCaptureDeviceInput *input;
/** 输出数据源 */
@property (nonatomic, strong) AVCaptureMetadataOutput *output;
/** 输入输出的中间桥梁 负责把捕获的音视频数据输出到输出设备中 */
@property (nonatomic, strong) AVCaptureSession *session;
/** 相机拍摄预览图层 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *layerView;
/** 预览图层尺寸 */
@property (nonatomic, assign) CGSize layerViewSize;
/** 有效扫码范围 */
@property (nonatomic, assign) CGSize showSize;
/** 作者自定义的View视图 */
@property (nonatomic, strong) ScanQR *shadowView;
@end

@implementation ScanQR

- (void)viewDidLoad {
    [super viewDidLoad];
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
        NSLog(@"允许状态");
        self.view.backgroundColor = [UIColor whiteColor];
        
        //调用
        [self creatScanQR];
        //添加拍摄图层
        [self.view.layer addSublayer:self.layerView];
        //开始二维码
        [self.session startRunning];

    }
    else if (authStatus == AVAuthorizationStatusDenied)
    {
        NSLog(@"不允许状态，可以弹出一个alertview提示用户在隐私设置中开启权限");
    }
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        NSLog(@"111");
        }];
        NSLog(@"系统还未知是否访问，第一次开启相机时");
    }
   
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backBtn:(UIButton *)sender {
    [self presentViewController:[[UserInfoViewController alloc] init] animated:true completion:^{
        //跳转完成后需要执行的事件；
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)creatScanQR{
    
    /** 创建输入数据源 */
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];  //获取摄像设备
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];  //创建输出流
    
    /** 创建输出数据源 */
    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];  //设置代理 在主线程里刷新
    
    /** Session设置 */
    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];   //高质量采集
    [self.session addInput:self.input];
    [self.session addOutput:self.output];
    //设置扫码支持的编码格式
    self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,
                                        AVMetadataObjectTypeEAN13Code,
                                        AVMetadataObjectTypeEAN8Code,
                                        AVMetadataObjectTypeCode128Code];
    /** 扫码视图 */
    //扫描框的位置和大小
    self.layerView = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.layerView.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.layerView.frame = CGRectMake(0, 40, 414, 696);
    // 将扫描框大小定义为属行, 下面会有调用
    self.layerViewSize = CGSizeMake(_layerView.frame.size.width, _layerView.frame.size.height);
    
}

#pragma mark - 实现代理方法, 完成二维码扫描
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    if (metadataObjects.count > 0) {
        
        // 停止动画, 看完全篇记得打开注释, 不然扫描条会一直有动画效果
        //[self.shadowView stopTimer];
        
        //停止扫描
        [self.session stopRunning];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        
        NSString *StringAll = metadataObject.stringValue;
        
        NSArray*array = [StringAll componentsSeparatedByString:@","];
        
        NSString * FirstValue = [array firstObject];
        NSString * SecondValue = [array lastObject];
        int FirstInt = [FirstValue intValue];
        int SecondInt = [SecondValue intValue];
        int TimeInt = (FirstInt/6-3)*3600;
        int SeatID = (SecondInt/5)-TimeInt/3600;
        NSString *SeatIDString = [NSString stringWithFormat:@"%d",SeatID];
        //网络请求
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
                NSLog(@"%@ %@",response,responseObject);
                NSString *state = [(NSDictionary *)responseObject objectForKey:@"state"];
                NSString *seatid = [(NSDictionary *)responseObject objectForKey:@"seatid"];
                int stateint = [state intValue];
                int seatidint = [seatid intValue];
                if(stateint == 1 && seatidint == SeatID){
                    NSString *urlsign  =@"http://192.168.1.101:9090/SignSeat?name=";
                    NSString *urlstring = [NSString stringWithFormat:@"%@&seatid=%@",myDelegate.username,SeatIDString];
                    NSString *urltext = [NSString stringWithFormat:@"%@%@",urlsign,urlstring];
                    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
                    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
                    
                    NSURL *URL = [NSURL URLWithString:urltext];
                    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
                    
                    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                        if (error) {
                            NSLog(@"Error: %@", error);
                        } else {
                            UIAlertView *alertsucceed = [[UIAlertView alloc]initWithTitle:@"提示" message:@"签到成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                            alertsucceed.tag=1;
                            [alertsucceed show];
                        }
                    }];
                    [dataTask resume];
                    

                }else if(stateint == 2){
                    UIAlertView *alerted = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已经签到过了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    alerted.tag=1;
                    [alerted show];
                    
                }else{
                    UIAlertView *alertwrong = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请先预约座位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    alertwrong.tag=1;
                    [alertwrong show];
                }
                
            }
        }];
        [dataTask resume];
        //输出扫描字符串
        NSLog(@"%@",SeatIDString);
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {
        NSLog(@"此处跳转");
        [self presentViewController:[[UserInfoViewController alloc] init] animated:true completion:^{
            //跳转完成后需要执行的事件；
        }];
        
    }
}


@end
