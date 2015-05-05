//
//  ViewController.m
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import "ViewController.h"
#import "WoWPhotoBrowser.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 100, 100)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:@"girl1.jpg"];
    [scrollView addSubview:_imageView];
    
    _imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap:)];
    [_imageView addGestureRecognizer:tap];
    
//    _button = [UIButton buttonWithType:UIButtonTypeCustom];
//    _button.frame = CGRectMake(80, 400, 100, 100);
//    [_button setBackgroundImage:[UIImage imageNamed:@"girl1.jpg"] forState:UIControlStateNormal];
////    [_button setTitle:@"button" forState:UIControlStateNormal];
//    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _button.backgroundColor = [UIColor redColor];
//    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [scrollView addSubview:_button];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(UIButton *)sender
{
    NSArray *photos = @[];
    [WoWPhotoBrowser showWithPhotos:photos
                                     currentIndex:2
                                         showView:_button
                                         complete:^(NSInteger showIndex) {
                                             
                                             NSLog(@"showIndex: %d", showIndex);
                                             
                                         }];
}

- (void)imageViewDidTap:(UITapGestureRecognizer *)tap
{
    NSArray *photos = @[@"http://u.thsi.cn/fileupload/data/Input/2012/12/26/8892f3388d628003aac8b30bb4ad64df.jpg",
                        @"http://img4.duitang.com/uploads/item/201301/28/20130128121933_a3Fnh.thumb.600_0.jpeg",
                        @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                        @"http://ww4.sinaimg.cn/bmiddle/69b97550gw1err8qthc48j20pe15owp2.jpg",
                        @"http://ww3.sinaimg.cn/bmiddle/69b97550gw1erq53g2nvxj20pr15o116.jpg",
                        @"http://ww2.sinaimg.cn/bmiddle/69b97550gw1erq53hvttjj20p715oaiw.jpg",
                        @"http://ww3.sinaimg.cn/bmiddle/69b97550gw1erq53cjigcj20oe15oqb3.jpg",
                        @"http://ww1.sinaimg.cn/bmiddle/69b97550gw1erq53e7zr0j20pz15odo3.jpg",
                        @"http://ww3.sinaimg.cn/bmiddle/69b97550gw1erq3k2s9abj20pg15odqv.jpg",
                        @"http://ww1.sinaimg.cn/bmiddle/69b97550gw1erq3dp9uplj20pw15o7e5.jpg",
                        @"http://pic.rmzt.com/2013/06/27-xp/qxmn-1.jpg"];
    [WoWPhotoBrowser showWithPhotos:photos
                                     currentIndex:8
                                         showView:_imageView
                                         complete:^(NSInteger showIndex) {
                                             
                                             NSLog(@"showIndex:%d", showIndex);
                                             
                                         }];
}

@end
