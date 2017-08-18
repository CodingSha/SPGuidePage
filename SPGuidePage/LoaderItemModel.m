//
//  LoaderItemModel.m
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import "LoaderItemModel.h"

@implementation LoaderItemModel

+ (instancetype)initWithLink:(LinkImageModel *)linkImage
                   Title:(TextModel *)title
                  Region:(HighLightRegionModel *)region{
    LoaderItemModel *model = [LoaderItemModel new];
    model.linkImage = linkImage;
    model.loaderTitle = title;
    model.region = region;
    return model;
}

+ (instancetype)initWithLoaderImage:(NSString *)imageName
                              frame:(CGRect)frame{
    LoaderItemModel *model = [LoaderItemModel new];
    model.loaderImage = imageName;
    model.loaderRect = frame;
    return model;
}
@end
