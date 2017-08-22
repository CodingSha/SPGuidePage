//
//  BezierPathModel.h
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
//镂空形状
typedef NS_ENUM(NSInteger,BezierPathType) {
    Circle = 1,//圆
    Oval,//椭圆
    RoundedRect,//矩形（可带圆角）
    DottedLineRoundedRect//虚线边框，中间不镂空
};

@interface HighLightRegionModel : NSObject

@property (nonatomic,assign)BezierPathType pathType;

@property (nonatomic,assign)CGRect rect;
@property (nonatomic,assign)NSInteger cornerRadius;

+ (instancetype)initWith:(BezierPathType)type
                    Rect:(CGRect)rect
                  Radius:(NSInteger)radii;

@end
