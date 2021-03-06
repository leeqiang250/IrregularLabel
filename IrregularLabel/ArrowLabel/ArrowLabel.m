//
//  ArrowLabel.m
//  IrregularLabel
//
//  Created by 蔡强 on 2018/4/10.
//  Copyright © 2018年 kuaijiankang. All rights reserved.
//

#import "ArrowLabel.h"

@interface ArrowLabel ()

/** 遮罩 */
@property (nonatomic, strong) CAShapeLayer *maskLayer;
/** 路径 */
@property (nonatomic, strong) UIBezierPath *borderPath;

@end

@implementation ArrowLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化遮罩
        self.maskLayer = [CAShapeLayer layer];
        // 设置遮罩
        [self.layer setMask:self.maskLayer];
        // 初始化路径
        self.borderPath = [UIBezierPath bezierPath];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 遮罩层frame
    self.maskLayer.frame = self.bounds;
    
    
    // 设置path起点
    [self.borderPath moveToPoint:CGPointMake(0, 10)];
    
    // 箭头
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2-5, 10)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2, 0)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2+5, 10)];
    
    // 到右上角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, 10)];
    // 到右下角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    // 到左下角
    [self.borderPath addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    // 回到起点
    [self.borderPath addLineToPoint:CGPointMake(0, 10)];
    
    // 将这个path赋值给maskLayer的path
    self.maskLayer.path = self.borderPath.CGPath;
}

@end
