//
//  SSViewController.m
//  LiberySelectSeat
//
//  Created by Tommy on 2017/3/3.
//  Copyright © 2017年 Tommy. All rights reserved.
//

#import "SSViewController.h"
#import "UserInfoViewController.h"

#define kScreenWidth [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface SSViewController ()
@property (strong, nonatomic) IBOutlet UILabel *Titlelabel;
@property (strong, nonatomic) IBOutlet UIImageView *DeskUI;
    
@end

@implementation SSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取网络数据
    

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
- (IBAction)Selectinfo:(UIButton *)sender {
    
}
- (IBAction)UserBtn:(UIButton *)sender {
    [self presentViewController:[[UserInfoViewController alloc] init] animated:true completion:^{
        //跳转完成后需要执行的事件；
    }];
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
