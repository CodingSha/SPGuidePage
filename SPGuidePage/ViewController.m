//
//  ViewController.m
//  SPGuidePage
//
//  Created by 沙少盼 on 2017/8/18.
//  Copyright © 2017年 沙少盼. All rights reserved.
//

#import "ViewController.h"
#import "GuideCoverView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    LoaderItemModel *itemImage = [LoaderItemModel initWithLink:nil Title:nil Region:nil];
    itemImage.loaderImage = @"点击手势";
    itemImage.loaderRect = CGRectMake(self.btn2.frame.origin.x + self.btn2.frame.size.width/2 - [UIImage imageNamed:@""].size.width/2, self.btn2.frame.origin.y + self.btn2.frame.size.height + 10, [UIImage imageNamed:@"点击手势"].size.width, [UIImage imageNamed:@"点击手势"].size.height);
    
    LinkImageModel *link = [LinkImageModel initWithStyle:LinkImageStyleDefult CustomImage:nil Position:LinkImagePositionRightOver OffsetX:0 OffsetY:0];
    HighLightRegionModel *circle = [HighLightRegionModel initWith:Circle Rect:self.btn1.frame Radius:0];
    TextModel *title = [TextModel initWithFont:[UIFont systemFontOfSize:18] text:@"我我我我我我我我我我我我我我" Alignment:TextAlignmentRight];
    LoaderItemModel *itemCircle = [LoaderItemModel initWithLink:link Title:title Region:circle];
    
    
    HighLightRegionModel *roundedRect = [HighLightRegionModel initWith:RoundedRect Rect:self.btn3.frame Radius:5];
    LinkImageModel *link1 = [LinkImageModel initWithStyle:LinkImageStyleLineRegularArrow CustomImage:nil Position:LinkImagePositionRightUnder OffsetX:0 OffsetY:0];
    LoaderItemModel *itemRounded = [LoaderItemModel initWithLink:link1 Title:title Region:roundedRect];
    
    HighLightRegionModel *oval = [HighLightRegionModel initWith:Oval Rect:self.btn5.frame Radius:0];
    LinkImageModel *link3 = [LinkImageModel initWithStyle:LinkImageStyleLineRegularArrow CustomImage:nil Position:LinkImagePositionRight OffsetX:0 OffsetY:0];
    LoaderItemModel *itemOval = [LoaderItemModel initWithLink:link3 Title:title Region:oval];
    
    
    HighLightRegionModel *LineroundedRect = [HighLightRegionModel initWith:DottedLineRoundedRect Rect:self.btn4.frame Radius:3];
    LinkImageModel *link2 = [LinkImageModel initWithStyle:LinkImageStyleTortuousArrow CustomImage:nil Position:LinkImagePositionLeftUnder OffsetX:0 OffsetY:0];
    TextModel *title1 = [TextModel initWithFont:[UIFont systemFontOfSize:18] text:@"你你你你你你你你你你你你你你你你" Alignment:TextAlignmentLeft];
    LoaderItemModel *itemLineroundedRect = [LoaderItemModel initWithLink:link2 Title:title1 Region:LineroundedRect];
    
    
    GuideCoverView *guideV = [[GuideCoverView alloc]initWithItems:@[itemOval,itemCircle,itemRounded,itemLineroundedRect,itemImage]];
    
    [guideV showInView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
