//
//  QAGCalculatorView.h
//  QAGCalculatorView
//
//  Created by bltech on 16/11/11.
//  Copyright © 2016年 bltech. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface QAGCalculatorView : UIView

@property (nonatomic, strong) IBInspectable UIColor *bodyColor;
@property (nonatomic, assign) IBInspectable CGFloat bodyRadius;

@property (nonatomic, strong) IBInspectable UIColor *faceColor;
@property (nonatomic, assign) IBInspectable CGFloat faceRadius;

@property (nonatomic, strong) IBInspectable UIColor *calculateZoneColor;
@property (nonatomic, strong) IBInspectable UIColor *calculateZoneTextColor;
@property (nonatomic, assign) IBInspectable CGFloat calculateZoneBorderWidth;

@end
