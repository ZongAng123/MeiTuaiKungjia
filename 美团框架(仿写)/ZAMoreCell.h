//
//  ZAMoreCell.h
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZAMoreCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath MoreArray:(NSArray *)MoreArray;
@end
