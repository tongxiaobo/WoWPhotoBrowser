//
//  WoWPhotoBrowserViewController.m
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import "WoWPhotoBrowserViewController.h"
#import "AppDelegate.h"

static WoWPhotoBrowserViewController *photoBrowserViewController;

@interface WoWPhotoBrowserViewController ()

@end

@implementation WoWPhotoBrowserViewController

- (void)dealloc
{
    NSLog(@"WoWPhotoBrowserViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [self.view addGestureRecognizer:tap];
//    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTap:(UITapGestureRecognizer *)tap
{
    [WoWPhotoBrowserViewController dismiss];
}

+ (void)showWithPhotos:(NSArray *)photos
          currentIndex:(NSInteger)index
              showView:(UIView *)view
              complete:(void(^)(NSInteger showIndex))cBlock
{
    if (photoBrowserViewController == nil) {
        photoBrowserViewController = [[WoWPhotoBrowserViewController alloc] init];
    }
    photoBrowserViewController.view.backgroundColor = [UIColor redColor];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UIViewController *rootViewController = appDelegate.window.rootViewController;
    CGRect rect = [view convertRect:view.bounds toView:rootViewController.view];
    photoBrowserViewController.view.frame = rect;
    [rootViewController.view addSubview:photoBrowserViewController.view];
    [UIView animateWithDuration:0.3 animations:^{
       
        photoBrowserViewController.view.frame = rootViewController.view.bounds;
        
    }];
}

+ (void)dismiss
{
    if (photoBrowserViewController != nil) {
        [photoBrowserViewController.view removeFromSuperview];
        photoBrowserViewController = nil;
    }
}

@end
