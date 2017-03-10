//
//  ZAGuessCell.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAGuessCell.h"

@implementation ZAGuessCell
+(instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *CellID = @"tangshaagadasgsgasgsgugsfjkljkhjo";
    ZAGuessCell *cell = [tableview dequeueReusableCellWithIdentifier:CellID];
    if(cell == nil) {
        cell = [[ZAGuessCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.textLabel.text = @"猜你喜欢";
        UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 29.5, screen_width, 0.5)];
        lineview.backgroundColor = navigationBarColor;
        [cell addSubview:lineview];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
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
