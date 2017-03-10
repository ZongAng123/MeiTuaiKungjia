//
//  ZAHomeController.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAHomeController.h"
#import "ZAHomeMenuCell.h"
#import "ZARushBuyCell.h"
#import "ZADiscountCell.h"
#import "ZAShoppingCell.h"
#import "ZAShopImageCell.h"
#import "ZAHotCell.h"
#import "ZAHotImageCell.h"
#import "ZAGuessCell.h"
#import "ZARecommentCell.h"
#import "ZASelectBackView.h"
#import "ZAaddScorllView.h"
#import "AllCityNameController.h"

@interface ZAHomeController ()<UITableViewDataSource,UITableViewDelegate,ZAaddScorllViewButtonDelegate,ZAchangeButtonDelegate,ZASelectBackViewTapDelegate>
@property (nonatomic, strong)UIButton *leftbtn;
@property (nonatomic, strong) ZASelectBackView *selectBackView;
@property (nonatomic, strong) UITableView *Tableview;

@property (nonatomic, strong) NSMutableArray *menuArray;
@property (nonatomic, strong) NSMutableArray *recommendArray;
@property (nonatomic, strong) NSMutableArray *rushArray; //抢购
@property (nonatomic, strong) NSMutableArray *discountArray; //折扣
@end

@implementation ZAHomeController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = navigationBarColor;
    
    [self initData];
    [self initTableview];
    
    [self setupnav];
}

-(void)initData {
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"menuData" ofType:@"plist"];
    self.menuArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
}

-(void)initTableview {
    self.Tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height-49) style:UITableViewStyleGrouped];
    self.Tableview.dataSource = self;
    self.Tableview.delegate = self;
    //
    self.Tableview.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:self.Tableview];
    
}

-(void)setupnav {
    //
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(0, 0, 40, 35);
    [leftbtn setImage:[UIImage imageNamed:@"icon_homepage_downArrow"] forState:UIControlStateNormal];
    [leftbtn setImage:[UIImage imageNamed:@"icon_homepage_upArrow"] forState:UIControlStateSelected];
    //
    leftbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //
    [leftbtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    //
    leftbtn.imageEdgeInsets = UIEdgeInsetsMake(0, 28, 0, 0);
    [leftbtn setTitle:@"无锡" forState:UIControlStateNormal];
    leftbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [leftbtn addTarget:self action:@selector(btn_leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.leftbtn = leftbtn;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbtn];
    
    UIButton *EBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [EBtn setBackgroundImage:[UIImage imageNamed:@"icon_homepage_scan"] forState:UIControlStateNormal];
    EBtn.frame = CGRectMake(0, 0, EBtn.currentBackgroundImage.size.width, EBtn.currentBackgroundImage.size.height);
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:EBtn];
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:EBtn];
    UIButton *XBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [XBtn setBackgroundImage:[UIImage imageNamed:@"icon_homepage_message"] forState:UIControlStateNormal];
    XBtn.frame = CGRectMake(0, 0, EBtn.currentBackgroundImage.size.width, EBtn.currentBackgroundImage.size.height);
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:XBtn];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    searchBar.backgroundImage = [UIImage imageNamed:@"icon_homepage_search"];
    searchBar.placeholder = @"搜索美食吧";
    self.navigationItem.titleView = searchBar;
    
    //这尼玛的搞了好久才出来  都是套路。。。。。。。。。。。。。。。。
    self.selectBackView = [[ZASelectBackView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64)];
    self.selectBackView.Tapdelegate = self;
    self.selectBackView.addScrollView.delegate = self;
    self.selectBackView.addScrollView.changeDelegate = self;
    [self.view addSubview:self.selectBackView];
    self.selectBackView.hidden = YES;
    
}


#pragma mark - 左边的按钮
-(void)btn_leftBtnClick:(UIButton *)button{
    button.selected = !button.selected;
    self.selectBackView.hidden = !self.selectBackView.hidden;
}

#pragma mark -TselectBackViewTopDelegate
-(void)removeMaskView {
    self.selectBackView.hidden = !self.selectBackView.hidden;
    self.leftbtn.selected = !self.leftbtn.selected;
    
}

#pragma mark -TSAddScrollViewDelegate
-(void)areaButtonClick:(UIButton *)button {
    NSLog(@"%@",button.currentTitle);
    [self.leftbtn setTitle:button.currentTitle forState:UIControlStateNormal];
    self.selectBackView.hidden = !self.selectBackView.hidden;
    self.leftbtn.selected = !self.leftbtn.selected;
}
#pragma mark -TSchangeBtnClickDelegate
-(void)changeButtonClick:(UIButton *)button {
    self.selectBackView.hidden = !self.selectBackView.hidden;
    
    AllCityNameController *allcity = [[AllCityNameController alloc]init];
    [self.navigationController pushViewController:allcity animated:YES];
}

#pragma mark - UITablviewDatasource;
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == 3) {
        return 2;
    } else if ( section == 4) {
        return 2;
    } else if (section == 5) {
        return 5;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        return 180;
    } else if (indexPath.section == 1) {
        return 150;
    } else if (indexPath.section == 2) {
        return 130;
    } else if(indexPath.section == 3) {
        if(indexPath.row == 0) {
            return 30;
        } else {
            return 100;
        }
    } else if(indexPath.section == 4) {
        if(indexPath.row == 0) {
            return 30;
        } else {
            return 150;
        }
    }else if(indexPath.section == 5) {
        if(indexPath.row == 0) {
            return 30;
        } else {
            return 100;
        }
    }
    else {
        return 70;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    }else {
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 10)];
    headerView.backgroundColor = RGB(239, 239, 244);
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 0)];
    footerView.backgroundColor = RGB(239, 239, 244);
    return footerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        ZAHomeMenuCell *cell = [ZAHomeMenuCell cellWithTableView:tableView menuArray:self.menuArray];
        return cell;
        
    } else if(indexPath.section == 1) {
        ZARushBuyCell *cell = [ZARushBuyCell cellWithTableView:tableView];
        return cell;
        
    } else if (indexPath.section == 2) {
        ZADiscountCell *cell = [ZADiscountCell cellWithTableView:tableView];
        return cell;
        
    } else if (indexPath.section == 3) {
        if(indexPath.row == 0){
            ZAShoppingCell *cell = [ZAShoppingCell cellWithTableView:tableView];
            return cell;
        } else{
            ZAShopImageCell *cell = [ZAShopImageCell cellWithTableView:tableView];
            return cell;
        }
    } else if (indexPath.section == 4) {
        if(indexPath.row == 0){
            ZAHotCell *cell = [ZAHotCell cellWithTableView:tableView];
            return cell;
        } else {
            ZAHotImageCell *cell = [ZAHotImageCell cellWithTableView:tableView];
            return cell;
        }
    } else if (indexPath.section == 5) {
        if(indexPath.row == 0) {
            ZAGuessCell *cell = [ZAGuessCell cellWithTableView:tableView];
            return cell;
        }else {
            ZARecommentCell *cell = [ZARecommentCell cellWithTableView:tableView];
            return cell;
        }
    }else {
        static NSString *tsID = @"qwerqwrqwe";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tsID];
        if(cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tsID];
        }
        NSString *str = @"大傻逼~";
        cell.textLabel.text = str;
        return cell;
    }
    
}

@end
