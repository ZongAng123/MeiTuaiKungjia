//
//  ZAShopImageCell.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAShopImageCell.h"
#import "ZAMenuBtnView.h"

@interface ZAShopImageCell ()<UIScrollViewDelegate>

@end
@implementation ZAShopImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"tangshuohkiy";
    ZAShopImageCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[ZAShopImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 100)];
        //scrollView.backgroundColor = [UIColor orangeColor];
        scrollView.contentSize = CGSizeMake(screen_width*2, 100);
        scrollView.showsHorizontalScrollIndicator = NO;
        //scrollView.pagingEnabled = YES;
        [self addSubview:scrollView];
        
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, scrollView.frame.size.height/2-40, screen_width*2, 80)];
        backView.backgroundColor =  [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:0.1];
        [scrollView addSubview:backView];
        
        for(int i = 0; i < 7; i++) {
            CGRect frame = CGRectMake(i*screen_width*2/7, 0, screen_width*2/7, 80);
            NSString *title = @"青岛即墨宝龙广场";
            NSString *imagestr = @"background_home_searchBar@2x";
            ZAMenuBtnView *btnView = [[ZAMenuBtnView alloc]initWithFrame2:frame title:title imagestr:imagestr];
            btnView.tag = 300 + i;
            [backView addSubview:btnView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Clicktap:)];
            [btnView addGestureRecognizer:tap];
        }
        
        
    }
    return self;
}


-(void)Clicktap:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
}


@end
