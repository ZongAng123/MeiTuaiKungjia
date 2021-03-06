//
//  ZARecommentCell.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZARecommentCell.h"

@implementation ZARecommentCell
+(instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *CellID = @"tangsgasgsgugsfjkljkhjo";
    ZARecommentCell *cell = [tableview dequeueReusableCellWithIdentifier:CellID];
    if(cell == nil) {
        cell = [[ZARecommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 99.5, screen_width, 0.5)];
        lineview.backgroundColor = navigationBarColor;
        [cell addSubview:lineview];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self initViews];
    }
    return self;
}

-(void)initViews {
    self.shopImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    self.shopImage.layer.masksToBounds = YES;
    self.shopImage.layer.cornerRadius = 3.0;
    self.shopImage.image = [UIImage imageNamed:@"bg_customReview_image_default"];
    [self.contentView addSubview:self.shopImage];
    //
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    [imageView setImage:[UIImage imageNamed:@"ic_deal_noBooking"]];
    [self.contentView addSubview:imageView];
    //
    self.shopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, screen_width-100-80, 30)];
    self.shopNameLabel.text = @"纵昂的美食店";
    [self.contentView addSubview:self.shopNameLabel];
    
    //
    self.shopInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, screen_width-100-10, 45)];
    self.shopInfoLabel.text = @"纵家美食店百年之后就是百年老年，大爷来吧~~来吃吧~~~";
    self.shopInfoLabel.textColor = [UIColor orangeColor];
    self.shopInfoLabel.font = [UIFont systemFontOfSize:13.0];
    self.shopInfoLabel.numberOfLines = 2;
    self.shopInfoLabel.lineBreakMode = UILineBreakModeWordWrap|UILineBreakModeTailTruncation;
    [self.contentView addSubview:self.shopInfoLabel];
    
    //
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 70, 20)];
    self.priceLabel.textColor = navigationBarColor;
    self.priceLabel.text = @"$999.0";
    [self.contentView addSubview:self.priceLabel];
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
