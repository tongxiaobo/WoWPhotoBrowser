//
//  WoWPhotoBrowserViewController.h
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WoWPhotoBrowserViewController : UIViewController

@property (strong, nonatomic)NSArray *photoArray;

+ (void)showWithPhotos:(NSArray *)photos
          currentIndex:(NSInteger)index
              showView:(UIView *)view
              complete:(void(^)(NSInteger showIndex))cBlock;

@end
