//
//  LinkImageModel.m
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/18.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import "LinkImageModel.h"

static NSString *RotationArrow = @"旋转箭头";
static NSString *LineRegularArrow = @"直线箭头细";
static NSString *LineMediumArrow = @"直线箭头粗";
static NSString *TortuousArrow = @"折线箭头";
static NSString *TapGesture = @"点击手势";
static NSString *Rad = @"弯箭头";
static NSString *LeftRad = @"左弯箭头";

@implementation LinkImageModel

+ (instancetype)initWithStyle:(LinkImageStyle)style
                  CustomImage:(NSString *)imageName
                     Position:(LinkImagePosition)position
                      OffsetX:(float)x
                      OffsetY:(float)y{
    LinkImageModel *model = [LinkImageModel new];
    model.style = style;
    if (style == LinkImageStyleCustom) {
        model.customImageName = imageName;
    }else{
        switch (style) {
            case LinkImageStyleRad:
            {
                model.customImageName = Rad;
            }
                break;
            case LinkImageStyleLeftRad:
            {
                model.customImageName = LeftRad;
            }
                break;
            case LinkImageStyleDefult:
            {
                model.customImageName = RotationArrow;
            }
                break;
            case LinkImageStyleTapGesture:
            {
                model.customImageName = TapGesture;
            }
                break;
            case LinkImageStyleRotationArrow:
            {
                model.customImageName = RotationArrow;
            }
                break;
            case LinkImageStyleTortuousArrow:
            {
                model.customImageName = TortuousArrow;
            }
                break;
            case LinkImageStyleLineMediumArrow:
            {
                model.customImageName = LineMediumArrow;
            }
                break;
            case LinkImageStyleLineRegularArrow:
            {
                model.customImageName = LineRegularArrow;
            }
                break;
            default:
                break;
        }
    }
    
    model.position = position;
    model.offsetX = x;
    model.offsetY = y;
    return model;
}

+ (instancetype)initWithCustomImage:(NSString *)imageName
                           Position:(LinkImagePosition)position
                            OffsetX:(float)x
                            OffsetY:(float)y{
    return [self initWithStyle:LinkImageStyleCustom CustomImage:imageName Position:position OffsetX:x OffsetY:y];
}

+ (instancetype)initWithDefultLinkImage{
    return [self initWithStyle:LinkImageStyleDefult CustomImage:nil Position:LinkImagePositionUnder OffsetX:0 OffsetY:0];
}

@end
