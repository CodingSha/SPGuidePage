//
//  BezierPathModel.h
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger,BezierPathType) {
    Circle = 1,
    Oval,
    RoundedRect,
    DottedLineRoundedRect
};

@interface HighLightRegionModel : NSObject

@property (nonatomic,assign)BezierPathType pathType;

@property (nonatomic,assign)CGRect rect;
@property (nonatomic,assign)NSInteger cornerRadius;

+ (instancetype)initWith:(BezierPathType)type
                    Rect:(CGRect)rect
                  Radius:(NSInteger)radii;

@end
