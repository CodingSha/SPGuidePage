//
//  LinkImageModel.h
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/18.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger ,LinkImageStyle) {
    LinkImageStyleDefult = 0,
    LinkImageStyleRotationArrow,
    LinkImageStyleLineRegularArrow,
    LinkImageStyleLineMediumArrow,
    LinkImageStyleTortuousArrow,
    LinkImageStyleTapGesture,
    LinkImageStyleRad,
    LinkImageStyleLeftRad,
    LinkImageStyleCustom
};

typedef NS_ENUM(NSInteger ,LinkImagePosition) {
    LinkImagePositionUnder = 0,//下
    LinkImagePositionOver = 180,//上
    LinkImagePositionLeft = 90,//左
    LinkImagePositionRight = -90,//右
    LinkImagePositionLeftOver = 135,//左上
    LinkImagePositionLeftUnder = 45,//左下
    LinkImagePositionRightOver = -135,//右上
    LinkImagePositionRightUnder = -45//右下
};

@interface LinkImageModel : NSObject
@property (nonatomic, assign) LinkImageStyle style;
@property (nonatomic, assign) float offsetX;
@property (nonatomic, assign) float offsetY;
@property (nonatomic, assign) LinkImagePosition position;
@property (nonatomic, copy) NSString *customImageName;
@property (nonatomic, assign) float gap;

+ (instancetype)initWithStyle:(LinkImageStyle)style CustomImage:(NSString *)imageName Position:(LinkImagePosition)position OffsetX:(float)x OffsetY:(float)y;
/**
 * 自定义图片样式
 */
+ (instancetype)initWithCustomImage:(NSString *)imageName Position:(LinkImagePosition)position OffsetX:(float)x OffsetY:(float)y;

/**
 * 默认样式，默认自动选择位置，默认在下面，但是会自动找最佳位置。
 */
+ (instancetype)initWithDefultLinkImage;

@end
