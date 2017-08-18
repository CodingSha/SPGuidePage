//
//  LoaderItemModel.h
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HighLightRegionModel.h"
#import "LinkImageModel.h"
#import "TextModel.h"

@interface LoaderItemModel : NSObject

@property (nonatomic, copy) NSString *loaderImage;
@property (nonatomic, assign) CGRect loaderRect;

@property (nonatomic, strong)LinkImageModel  *linkImage;
@property (nonatomic, strong) TextModel *loaderTitle;
@property (nonatomic, strong) HighLightRegionModel *region;

+ (instancetype)initWithLink:(LinkImageModel *)linkImage Title:(TextModel *)title Region:(HighLightRegionModel *)region;

+ (instancetype)initWithLoaderImage:(NSString *)imageName frame:(CGRect)frame;

@end
