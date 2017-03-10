//
//  ZAMoreCell.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAMoreCell.h"

@implementation ZAMoreCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath MoreArray:(NSArray *)MoreArray {
    static NSString *TSMore = @"tangshuo";
    ZAMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:TSMore];
    if(cell == nil) {
        cell = [[ZAMoreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TSMore];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, screen_width, 0.5)];
        lineView.backgroundColor = separaterColor;
        [cell addSubview:lineView];
    }
    cell.textLabel.text = [MoreArray[indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

@end
