//
//  WoWPhotoBrowserCell.h
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/20.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WoWPhotoBrowserCell : UICollectionViewCell<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIImageView *_imageView;
}

@end
