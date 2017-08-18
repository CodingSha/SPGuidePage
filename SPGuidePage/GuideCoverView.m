//
//  GuideCoverView.m
//  GuideViewDemo
//
//  Created by 沙少盼 on 2017/8/17.
//  Copyright © 2017年 ZKHZ. All rights reserved.
//

#import "GuideCoverView.h"


@implementation GuideCoverView
- (instancetype)initWithItems:(NSArray *)items{
    if (self = [super init]) {
        self.ItemArr = items.mutableCopy;
        self.frame = [UIScreen mainScreen].bounds;
        [self drawRegions];
    }
    return self;
}
- (void)drawRegions{
    if (self.ItemArr.count) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.frame];
        CAShapeLayer *layer = [CAShapeLayer layer];
        for (LoaderItemModel *model in self.ItemArr) {
            if (model.loaderImage.length) {
                UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:model.loaderImage]];
                image.frame = CGRectMake(model.loaderRect.origin.x, model.loaderRect.origin.y, image.image.size.width, image.image.size.height);
                [layer addSublayer:image.layer];
            }else{
                //增加指向箭头
                UIImageView *link = [[UIImageView alloc]initWithImage:[UIImage imageNamed:model.linkImage.customImageName]];
                [self calculateLinkPositionWith:model view:link image:link.image];
                [layer addSublayer:link.layer];
                
                //增加文字
                UILabel *lab = [[UILabel alloc]init];
                lab.font = model.loaderTitle.font;
                lab.textAlignment = 1;
                lab.textColor = [UIColor whiteColor];
                lab.text = model.loaderTitle.titleText;
                [self layoutTitleView:lab LoaderItem:model distanation:link];
                
                UIImageView *labImage = [[UIImageView alloc]initWithFrame:lab.frame];
                labImage.image = [self imageWithUIView:lab];
                [layer addSublayer:labImage.layer];
                
                //增加指向区域
                if (model.region.pathType == DottedLineRoundedRect) {
                    [layer addSublayer:[self drawDottedLineRoundedRectWith:model]];
                }else{
                    [path appendPath:[[self drawRegionWith:model] bezierPathByReversingPath]];
                }
            }
            
        }
        layer.path = path.CGPath;
        layer.fillColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
        [self.layer addSublayer:layer];
    }
}
//draw镂空的椭圆、圆、矩形（可带圆角）
- (UIBezierPath *)drawRegionWith:(LoaderItemModel *)model{
    UIBezierPath *bezierPath;
    switch (model.region.pathType) {
        case Circle:
        {
            CGFloat rad = MAX(model.region.rect.size.width, model.region.rect.size.height);
            bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(model.region.rect.origin.x,model.region.rect.origin.y, rad, rad)];
        }
            break;
        case Oval:
        {
            bezierPath = [UIBezierPath bezierPathWithOvalInRect:model.region.rect];
        }
            break;
        case RoundedRect:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:model.region.rect cornerRadius:model.region.cornerRadius];
        }
            break;
        default:
            break;
    }
    
    return bezierPath;
}

//draw虚线边框的矩形
- (CALayer *)drawDottedLineRoundedRectWith:(LoaderItemModel *)model{
    CAShapeLayer *border = [CAShapeLayer layer];
    //线段颜色
    border.strokeColor = [UIColor whiteColor].CGColor;
    //填充色需与背景色一致
    border.fillColor = [UIColor clearColor].CGColor;
    border.path = [UIBezierPath bezierPathWithRoundedRect:model.region.rect cornerRadius:model.region.cornerRadius].CGPath;
    //线宽
    border.lineWidth = 2.f;
    //小线段的corner处理
    border.lineCap = kCALineCapRound;
    //虚实线段的间隔
    border.lineDashPattern = @[@10, @10];
    return border;
}

- (void)calculateLinkPositionWith:(LoaderItemModel *)model view:(UIImageView *)view image:(UIImage *)image{
    CGFloat x = model.linkImage.position;
    CGAffineTransform transform = CGAffineTransformMakeRotation(x * M_PI/180.0);
    [view setTransform:transform];
    view.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    CGFloat realOffset = sqrtf((model.linkImage.gap + image.size.height) *(model.linkImage.gap + image.size.height))/2;
    CGFloat regionX = model.region.rect.origin.x;
    CGFloat regionY = model.region.rect.origin.y;
    CGFloat regionW = model.region.rect.size.width;
    CGFloat regionH = model.region.rect.size.height;
    
    switch (model.linkImage.position) {
        case LinkImagePositionUnder:
        {
            view.center = CGPointMake(regionX + regionW/2, regionY + regionH + 10 + image.size.height/2);
        }
            break;
        case LinkImagePositionLeft:
        {
            view.center = CGPointMake(regionX - 10 - image.size.height/2, regionY + regionH/2);
        }
            break;
        case LinkImagePositionOver:
        {
            view.center = CGPointMake(regionX + regionW/2, regionY - 10 - image.size.height/2);
        }
            break;
        case LinkImagePositionRight:
        {
            view.center = CGPointMake(regionX + regionW + 10 + image.size.height/2, regionY + regionH/2);
        }
            break;
        case LinkImagePositionLeftUnder:
        {
            view.center = CGPointMake(regionX - realOffset, regionY + regionH + realOffset);
        }
            break;
        case LinkImagePositionLeftOver:
        {
            view.center = CGPointMake(regionX - realOffset, regionY - realOffset);
        }
            break;
        case LinkImagePositionRightOver:
        {
            view.center = CGPointMake(regionX + regionW + realOffset, regionY - realOffset);
        }
            break;
        case LinkImagePositionRightUnder:
        {
            view.center = CGPointMake(regionX + regionW + realOffset, regionY + regionH + realOffset);
        }
            break;
        default:
            break;
    }
    view.center = CGPointMake(view.center.x + model.linkImage.offsetX, view.center.y + model.linkImage.offsetY);
}

- (void)layoutTitleView:(UILabel *)lab LoaderItem:(LoaderItemModel *)model distanation:(UIImageView *)imageView{
    
    CGRect rect = [model.loaderTitle.titleText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, model.loaderTitle.font.pointSize) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:model.loaderTitle.font} context:nil];
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGFloat imageX = imageView.frame.origin.x;
    CGFloat imageY = imageView.frame.origin.y;
    CGFloat imageW = imageView.frame.size.width;
    CGFloat imageH = imageView.frame.size.height;
    CGFloat gap = model.linkImage.gap;
    if (rect.size.width > [UIScreen mainScreen].bounds.size.width - 40) {
        rect = [model.loaderTitle.titleText boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:model.loaderTitle.font} context:nil];
    }
    
    if (model.linkImage.position == LinkImagePositionRightUnder || model.linkImage.position == LinkImagePositionUnder || model.linkImage.position == LinkImagePositionLeftUnder) {//下侧
        switch (model.loaderTitle.alignment) {
            case TextAlignmentLeft:
            {
                lab.frame = CGRectMake(imageX, imageY + imageH + gap, width, height);
            }
                break;
            case TextAlignmentRight:
            {
                
                lab.frame = CGRectMake(imageX - width + imageW > 20 ? imageX - width + imageW : 20, imageY + imageH + gap, width, height);
            }
                break;
            case TextAlignmentCenter:
            {
                lab.frame = CGRectMake(imageX - width/2 > 20 ? imageX - width/2 : 20, imageY + imageH + gap, width, height);
            }
                break;
            default:
                break;
        }
    }else if (model.linkImage.position == LinkImagePositionRightOver || model.linkImage.position == LinkImagePositionOver || model.linkImage.position == LinkImagePositionLeftOver){//上侧
        switch (model.loaderTitle.alignment) {
            case TextAlignmentLeft:
            {
                lab.frame = CGRectMake(imageX, imageY - height - gap, width, height);
            }
                break;
            case TextAlignmentRight:
            {
                
                lab.frame = CGRectMake(imageX - width + imageW > 20 ? imageX - width + imageW : 20, imageY - height - gap, width, height);
            }
                break;
            case TextAlignmentCenter:
            {
                lab.frame = CGRectMake(imageX - width/2 > 20 ? imageX - width/2 : 20, imageY - height - gap, width, height);
            }
                break;
            default:
                break;
        }
    }else if (model.linkImage.position == LinkImagePositionLeft){//左侧
        lab.frame = CGRectMake(imageX - gap - width, imageY + imageH/2 - height/2, width, height);
    }else if (model.linkImage.position == LinkImagePositionRight){//右侧
        lab.frame = CGRectMake(imageX + gap + imageW, imageY + imageH/2 - height/2, width, height);
    }
    
}
- (UIImage*) imageWithUIView:(UIView*) view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}
- (void)showInView:(UIView *)view{
    [view addSubview:self];
}
@end
