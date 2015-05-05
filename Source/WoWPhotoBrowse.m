//
//  WoWPhotoBrowser.m
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import "WoWPhotoBrowser.h"
#import "AppDelegate.h"
#import "WoWPhotoBrowserCell.h"

#define PhotoBrowserCellID @"PhotoBrowserCellID"
#define Width  self.view.bounds.size.width
#define Height self.view.bounds.size.height

static WoWPhotoBrowser *photoBrowserViewController;

@interface WoWPhotoBrowser ()<UICollectionViewDataSource, UICollectionViewDelegate, WoWPhotoBrowserCellDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UILabel *progressLabel;
@property (assign, nonatomic) NSInteger totalPage;

@end

@implementation WoWPhotoBrowser

+ (void)showWithPhotos:(NSArray *)photos
          currentIndex:(NSInteger)index
              showView:(UIView *)view
              complete:(void(^)(NSInteger showIndex))cBlock
{
    if (photoBrowserViewController == nil) {
        photoBrowserViewController = [[WoWPhotoBrowser alloc] init];
    }
    photoBrowserViewController.photoArray = photos;
    photoBrowserViewController.currentPage = index;
    photoBrowserViewController.cBlock = cBlock;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UIViewController *rootViewController = appDelegate.window.rootViewController;
    
    [rootViewController presentViewController:photoBrowserViewController animated:NO completion:^{
        
    }];
}

+ (void)dismiss
{
    if (photoBrowserViewController != nil) {
        [photoBrowserViewController dismissViewControllerAnimated:NO completion:^{
            photoBrowserViewController = nil;
        }];
    }
}

- (void)dealloc
{
    NSLog(@"WoWPhotoBrowserViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.progressLabel];
    
    self.totalPage = self.photoArray.count;
    self.currentPage = _currentPage;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_currentPage - 1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UICollectioinView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WoWPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoBrowserCellID forIndexPath:indexPath];
    cell.imageUrl = self.photoArray[indexPath.row];
    cell.delegate = self;
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

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    WoWPhotoBrowserCell *browserCell = (WoWPhotoBrowserCell *)cell;
    //图片消失时还原为原来的比例
    [browserCell recovery];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //设置当前显示图片序号
    NSInteger page = scrollView.contentOffset.x / (Width - 4) + 1;
    if (page <= 0) {
        page = 1;
    }
    self.currentPage = page;
}

#pragma WoWPhotoBrowserCellDelegate
- (void)singleTap
{
    _cBlock(_currentPage);
    [WoWPhotoBrowser dismiss];
}

#pragma mark - getters and setters
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
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

- (UILabel *)progressLabel
{
    if (_progressLabel == nil) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 26)];
        _progressLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
        _progressLabel.layer.cornerRadius = 13.0;
        _progressLabel.layer.masksToBounds = YES;
        _progressLabel.center = CGPointMake(Width / 2.0, 40.0);
        _progressLabel.textColor = [UIColor whiteColor];
        _progressLabel.font = [UIFont systemFontOfSize:18.0];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _progressLabel;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    _progressLabel.text = [NSString stringWithFormat:@"%d/%d", _currentPage, _totalPage];
}

@end
