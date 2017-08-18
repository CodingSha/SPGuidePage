//
//  TextModel.m
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/18.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import "TextModel.h"

@implementation TextModel
+ (instancetype)initWithFont:(UIFont *)font text:(NSString *)text Alignment:(TextAlignment)ali{
    TextModel *model = [TextModel new];
    model.font = font ? font : [UIFont systemFontOfSize:16];
    model.titleText = text;
    model.alignment = ali;
    return model;
}
@end
