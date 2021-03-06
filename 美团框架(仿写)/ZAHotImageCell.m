//
//  ZAHotImageCell.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAHotImageCell.h"

@implementation ZAHotImageCell

+(instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"Hottangshuo";
    ZAHotImageCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[ZAHotImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        for(int i = 0; i < 6; i++) {
            //
            UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(i*screen_width/2, 0, screen_width/2, 65)];
            if(i<2) {
                backView.frame = CGRectMake(i*screen_width/2, 0, screen_width/2, 70);
                //
                UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 8, backView.frame.size.width/2+10, 30)];
                titleLabel.text = @"贱人就是矫情";
                titleLabel.tag = 260+i;
                titleLabel.textColor = navigationBarColor;
                titleLabel.font = [UIFont systemFontOfSize:15];
                [backView addSubview:titleLabel];
                //
                UILabel *subLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, backView.frame.size.width/2+10, 30)];
                subLable.text = @"今晚陪皇上出宫";
                subLable.tag = 220+i;
                subLable.font = [UIFont systemFontOfSize:12];
                [backView addSubview:subLable];
                //
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(backView.frame.size.width/2+15, backView.frame.size.height/2-25, 50, 50)];
                imageView.tag = 240 + i;
                [imageView setImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
                imageView.layer.masksToBounds = YES;
                imageView.layer.cornerRadius = 30;
                [backView addSubview:imageView];
            }else {
                backView.frame = CGRectMake((i-2)*screen_width/4, 70, screen_width/4, 80);
                //
                UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, backView.frame.size.width, 25)];
                titleLabel.text = @"订飞机票";
                titleLabel.textAlignment = NSTextAlignmentCenter;
                titleLabel.tag = 260+i;
                titleLabel.textColor = navigationBarColor;
                titleLabel.font = [UIFont systemFontOfSize:15];
                [backView addSubview:titleLabel];
                //
                UILabel *subLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, backView.frame.size.width, 20)];
                subLable.text = @"一折票马上抢";
                subLable.textAlignment = NSTextAlignmentCenter;
                subLable.tag = 220+i;
                subLable.font = [UIFont systemFontOfSize:12];
                [backView addSubview:subLable];
                //
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(backView.frame.size.width/2-20, 40, 40, 40)];
                imageView.tag = 240 + i;
                [imageView setImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
                imageView.layer.masksToBounds = YES;
                imageView.layer.cornerRadius = 30;
                [backView addSubview:imageView];
                
                
            }
            backView.tag = 200 + i;
            backView.layer.borderWidth = 0.3;
            backView.layer.borderColor = [navigationBarColor CGColor];
            
            //
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBackView:)];
            [backView addGestureRecognizer:tap];
            
            [self addSubview:backView];
            
        }
    }
    return self;
}

-(void)Clicktap:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
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
