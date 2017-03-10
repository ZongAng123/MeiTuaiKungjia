//
//  ZAHotCityCell.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAHotCityCell.h"

@implementation ZAHotCityCell
+(instancetype)cellWithTableView:(UITableView *)tableview HotCitArray:(NSArray *)hotCityArray{
    static NSString *TS = @"tswyqi";
    ZAHotCityCell *cell = [tableview dequeueReusableCellWithIdentifier:TS];
    if(cell == nil) {
        cell = [[ZAHotCityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TS
                                       HotCitArray:hotCityArray];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier HotCitArray:(NSArray *)hotCityArray {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        //三列
        int totalloc = 3;
        
        CGFloat buttonw = 70;
        CGFloat buttonh = 30;
        //算出间距
        CGFloat margin=(self.frame.size.width - totalloc * buttonw) / (totalloc + 1);
        //int count=11;
        for (int i = 0; i < hotCityArray.count; i++) {
            int row = i / totalloc;//行号
            //0/3=0,1/3=0,2/3=1; (i 从0到2都是第一行) i＝ 3的时候第二行
            int loc = i % totalloc;//列号
            //横坐标
            CGFloat buttonx = margin + (margin + buttonw) * loc;
            //纵坐标
            CGFloat buttony = margin + (margin + buttonh) * row;
            //创建uiview控件
            UIButton *areaButton=[[UIButton alloc]initWithFrame:CGRectMake(buttonx, buttony, buttonw, buttonh)];
            [areaButton setTitle:hotCityArray[i] forState:UIControlStateNormal];
            [areaButton setBackgroundColor: navigationBarColor];
            [areaButton addTarget:self action:@selector(areaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:areaButton];
            
        }
    }
    return  self;
}

-(void)areaButtonClick:(UIButton *)button {
    NSLog(@"点击了");
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
