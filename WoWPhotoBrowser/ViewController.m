//
//  ViewController.m
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import "ViewController.h"
#import "WoWPhotoBrowserViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(80, 800, 100, 30);
    [_button setTitle:@"button" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _button.backgroundColor = [UIColor redColor];
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:_button];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(UIButton *)sender
{
    NSArray *photos = @[];
    [WoWPhotoBrowserViewController showWithPhotos:photos
                                     currentIndex:2
                                         showView:_button
                                         complete:^(NSInteger showIndex) {
                                             
                                         }];
}

@end
