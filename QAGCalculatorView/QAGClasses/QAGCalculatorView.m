//
//  QAGCalculatorView.m
//  QAGCalculatorView
//
//  Created by bltech on 16/11/11.
//  Copyright © 2016年 bltech. All rights reserved.
//

#import "QAGCalculatorView.h"

static const CGFloat kHeadHeight = 40;

@interface QAGCalculatorView ()

@property (nonatomic, strong) UIView *faceView;
@property (nonatomic, strong) UILabel *headLabel;

@property (nonatomic, strong) UIView *calculateView;
@property (nonatomic, strong) UILabel *calculateLabel;

@property (nonatomic, strong) NSMutableArray<UIButton *> *calculateButtons;

@end

@implementation QAGCalculatorView

#pragma mark - 系统回调

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)layoutSubviews {
    self.faceView.frame = CGRectMake(0, kHeadHeight, self.bounds.size.width, self.bounds.size.height);
    self.headLabel.frame = CGRectMake(0, 0, self.bounds.size.width, kHeadHeight);
    
    self.calculateView.frame = CGRectMake(20, 20, self.faceView.bounds.size.width - 40, 40);
    self.calculateLabel.frame = CGRectMake(10, 10, self.calculateView.bounds.size.width - 20, 20);
    
    [self layoutCalculateButtons];
}

#pragma mark - 装载UI

- (void)setupSubViews {
    self.faceView = ({
        UIView *view = [[UIView alloc] init];
        [self addSubview:view];
        view;
    });
    
    self.headLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Calculator";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:27];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label;
    });
    
    self.calculateView = ({
        UIView *view = [[UIView alloc] init];
        [self.faceView addSubview:view];
        view;
    });
    
    self.calculateLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"3  ";
        label.font = [UIFont systemFontOfSize:24];
        label.textAlignment = NSTextAlignmentRight;
        [self.calculateView addSubview:label];
        label;
    });
    
    self.calculateButtons = ({
        NSArray *calculateText = @[@"C", @"=", @"/", @"*", @"7", @"8", @"9", @"-", @"4", @"5", @"6", @"+", @"1", @"2", @"3", @"=", @"0", @"."];
        NSMutableArray *array = [NSMutableArray array];
        for (NSUInteger i = 0; i < 18; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:calculateText[i] forState:UIControlStateNormal];
            [array addObject:btn];
        }
        array;
    });
    
    for (UIButton *btn in self.calculateButtons) {
        [self.faceView addSubview:btn];
    }
}

#pragma mark - 布局Buttons

- (void)layoutCalculateButtons {
    NSInteger rows = 3;
    NSInteger cols = 4;
    CGFloat colSpace = 8;
    CGFloat rowSpace = 10;
    CGFloat btnW = (self.calculateView.frame.size.width - (cols - 1) * colSpace) / cols;
    CGFloat btnH = btnW - 5;
    
    CGFloat firstX = self.calculateView.frame.origin.x;
    CGFloat firstY = self.calculateView.frame.origin.y + self.calculateView.frame.size.height + rowSpace;
    
    CGFloat lastX = 0;
    CGFloat lastY = 0;
    for (NSUInteger i = 0; i < rows * cols + 3; i++) {
        ((UIButton *)self.calculateButtons[i]).frame = CGRectMake(firstX + (btnW + colSpace) * (i % cols), firstY + (btnH + rowSpace) * (i / cols), btnW, btnH);
        if (i == rows * cols + 2) {
            lastX = firstX + (btnW + colSpace) * (i % cols);
            lastY = firstY + (btnH + rowSpace) * (i / cols);
        }
    }
    ((UIButton *)self.calculateButtons[15]).frame = CGRectMake(lastX + btnW + colSpace, lastY, btnW, btnH * 2 + rowSpace);
    ((UIButton *)self.calculateButtons[16]).frame = CGRectMake(lastX - btnW * 2 - 2 * colSpace, lastY + btnH + rowSpace, btnW * 2 + colSpace, btnH);
    ((UIButton *)self.calculateButtons[17]).frame = CGRectMake(lastX, lastY + btnH + rowSpace, btnW, btnH);
}

#pragma mark - Set方法

- (void)setBodyColor:(UIColor *)bodyColor {
    _bodyColor = bodyColor;
    self.backgroundColor = bodyColor;
}

- (void)setBodyRadius:(CGFloat)bodyRadius {
    _bodyRadius = bodyRadius;
    self.layer.cornerRadius = bodyRadius;
    self.layer.masksToBounds = bodyRadius > 0 ? YES : NO;
}

- (void)setFaceColor:(UIColor *)faceColor {
    _faceColor = faceColor;
    self.faceView.backgroundColor = faceColor;
}

- (void)setFaceRadius:(CGFloat)faceRadius {
    _faceRadius = faceRadius;
    self.faceView.layer.cornerRadius  = faceRadius;
    self.faceView.layer.masksToBounds = faceRadius > 0 ? YES : NO;
}

- (void)setCalculateZoneColor:(UIColor *)calculateZoneColor {
    _calculateZoneColor = calculateZoneColor;
    self.calculateView.backgroundColor = calculateZoneColor;
    
    self.calculateLabel.backgroundColor = calculateZoneColor;
    for (UIButton *btn in self.calculateButtons) {
        btn.backgroundColor = calculateZoneColor;
    }
}

- (void)setCalculateZoneTextColor:(UIColor *)calculateZoneTextColor {
    _calculateZoneTextColor = calculateZoneTextColor;
    self.calculateLabel.textColor = calculateZoneTextColor;
    for (UIButton *btn in self.calculateButtons) {
        [btn setTitleColor:calculateZoneTextColor forState:UIControlStateNormal];
    }
}

- (void)setCalculateZoneBorderWidth:(CGFloat)calculateZoneBorderWidth {
    _calculateZoneBorderWidth = calculateZoneBorderWidth;
    self.calculateView.layer.borderWidth = calculateZoneBorderWidth;
    
    for (UIButton *btn in self.calculateButtons) {
        btn.layer.borderWidth = calculateZoneBorderWidth;
    }
}

@end
