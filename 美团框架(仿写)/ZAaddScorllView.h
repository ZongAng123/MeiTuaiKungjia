//
//  ZAaddScorllView.h
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZAaddScorllViewButtonDelegate <NSObject>
@optional
-(void)areaButtonClick:(UIButton *)button;
@end

@protocol ZAchangeButtonDelegate <NSObject>
@optional
-(void)changeButtonClick:(UIButton *)button;
@end
@interface ZAaddScorllView : UIView
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *scrollView2;

@property (nonatomic, strong)id <ZAaddScorllViewButtonDelegate>delegate;
@property (nonatomic, strong)id <ZAchangeButtonDelegate>changeDelegate;
@end
