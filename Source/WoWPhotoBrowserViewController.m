//
//  WoWPhotoBrowserViewController.m
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import "WoWPhotoBrowserViewController.h"
#import "AppDelegate.h"
#import "WoWPhotoBrowserCell.h"

#define PhotoBrowserCellID @"PhotoBrowserCellID"

static WoWPhotoBrowserViewController *photoBrowserViewController;

@interface WoWPhotoBrowserViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

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
    
    [self.view addSubview:self.collectionView];
    
    
//    self.view.userInteractionEnabled = YES;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[WoWPhotoBrowserCell class] forCellWithReuseIdentifier:PhotoBrowserCellID];
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor blackColor];
    }
    return _collectionView;
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

#pragma mark- UICollectioinView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WoWPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoBrowserCellID forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
