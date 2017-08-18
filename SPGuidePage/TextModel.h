//
//  TextModel.h
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/18.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,TextAlignment) {
    TextAlignmentLeft = 1,
    TextAlignmentRight,
    TextAlignmentCenter
};

@interface TextModel : NSObject
@property (nonatomic,strong)UIFont *font;
@property (nonatomic,copy)NSString *titleText;
@property (nonatomic,assign)TextAlignment alignment;
+ (instancetype)initWithFont:(UIFont *)font text:(NSString *)text Alignment:(TextAlignment)ali;
@end
