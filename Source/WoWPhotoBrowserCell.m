//
//  WoWPhotoBrowserCell.m
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/20.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import "WoWPhotoBrowserCell.h"

@implementation WoWPhotoBrowserCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.bouncesZoom = YES;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    [self.contentView addSubview:_scrollView];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, self.bounds.size.width - 10, self.bounds.size.height)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:@"girl1.jpg"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _scrollView.frame = self.bounds;
    _imageView.frame = CGRectMake(5, 0, self.bounds.size.width - 10, self.bounds.size.height);
}

#pragma mark- UIScrollView
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
