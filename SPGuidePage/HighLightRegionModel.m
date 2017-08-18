//
//  BezierPathModel.m
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import "HighLightRegionModel.h"

@implementation HighLightRegionModel

+ (instancetype)initWith:(BezierPathType)type
                    Rect:(CGRect)rect
                  Radius:(NSInteger)radii{
    HighLightRegionModel *model = [HighLightRegionModel new];
    model.pathType = type;
    model.rect = rect;
    model.cornerRadius = radii;
    return model;
}

@end
