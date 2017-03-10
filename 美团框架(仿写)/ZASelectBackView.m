//
//  ZASelectBackView.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZASelectBackView.h"
#import "ZAaddScorllView.h"
@implementation ZASelectBackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initViews];
    }
    return self;
}

-(void)initViews {
    UIView *Maskview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    Maskview.tag = 99;
    Maskview.backgroundColor = [UIColor blackColor];
    Maskview.alpha = 0.5;
    [self addSubview:Maskview];
    
    self.addScrollView = [[ZAaddScorllView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height/2)];
    [self addSubview:self.addScrollView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskViewClick)];
    tap.numberOfTapsRequired = 1;
    [Maskview addGestureRecognizer:tap];
    
}

-(void)maskViewClick {
    if([self.Tapdelegate respondsToSelector:@selector(removeMaskView)]) {
        [self.Tapdelegate removeMaskView];
    }
}

@end
