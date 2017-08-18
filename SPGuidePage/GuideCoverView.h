//
//  GuideCoverView.h
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoaderItemModel.h"
#import "HighLightRegionModel.h"

@interface GuideCoverView : UIView
@property (nonatomic, copy)NSMutableArray *ItemArr;
- (instancetype)initWithItems:(NSArray *)items;
- (void)showInView:(UIView *)view;
@end
