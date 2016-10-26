//
//  NumButton.h
//  ReleaseDemo
//
//  Created by trq on 16/10/9.
//  Copyright © 2016年 fanyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XJNumButton;
/*
 
 使用这个视图的时候，必须使用frame来确定位置
 
 */

@protocol XJNumButtonDelegate <NSObject>

- (void)buttonResponseMethod:(XJNumButton *)button;

@end


@interface XJNumButton : UIView

@property (nonatomic, assign) id<XJNumButtonDelegate>delegate;

//按钮编号
@property (nonatomic, assign) NSInteger number;
//按钮字符
@property (nonatomic, copy) NSString *string;
//按钮选中状态
@property (nonatomic, assign) BOOL isSelect;

+ (instancetype)buttonWithNumber:(NSInteger)number withString:(NSString *)string;

@end
