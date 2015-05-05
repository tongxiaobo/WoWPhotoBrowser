//
//  WoWPhotoBrowser.h
//  WoWPhotoBrowser
//
//  Created by 童小波 on 15/4/17.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WoWPhotoBrowser : UIViewController

@property (strong, nonatomic)NSArray *photoArray;
@property (assign, nonatomic)NSInteger currentPage;
@property (strong, nonatomic)void(^cBlock)(NSInteger showIndex);

+ (void)showWithPhotos:(NSArray *)photos
          currentIndex:(NSInteger)index
              showView:(UIView *)view
              complete:(void(^)(NSInteger showIndex))cBlock;

@end
