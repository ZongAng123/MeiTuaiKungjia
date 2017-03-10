//
//  ZAGetPlistArray.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZAGetPlistArray.h"

@implementation ZAGetPlistArray

+(NSArray *)ArrayWithString:(NSString *)string{
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
}
@end
