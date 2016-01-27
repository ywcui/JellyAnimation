//
//  ViewController.m
//  JellyAnimation
//
//  Created by City--Online on 16/1/27.
//  Copyright © 2016年 City--Online. All rights reserved.
//

#import "ViewController.h"
#import "JellyPopView.h"


@interface ViewController ()
@property (nonatomic,strong) JellyPopView *jellyView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(10, 100, 100, 80);
    [btn setTitle:@"弹出" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame=CGRectMake(210, 100, 100, 80);
    [btn1 setTitle:@"落下" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

}
-(void)btn1Click:(id)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        _jellyView.frame=CGRectMake(0, self.view.frame.size.height,  self.view.frame.size.width, 200);
    } completion:^(BOOL finished) {
        [_jellyView removeFromSuperview];
        _jellyView=nil;
    }];
}
-(void)btnClick:(id)sender
{
    if (_jellyView!=nil) {
        [_jellyView removeFromSuperview];
        _jellyView=nil;
    }
    _jellyView = [[JellyPopView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200)];
    _jellyView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_jellyView];
    [UIView animateWithDuration:0.2 animations:^{
        _jellyView.frame=CGRectMake(0, self.view.frame.size.height-200,  self.view.frame.size.width, 200);
    } completion:^(BOOL finished) {
        [_jellyView handlePanAction];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
