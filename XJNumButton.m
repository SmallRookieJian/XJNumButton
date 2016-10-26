//
//  NumButton.m
//  ReleaseDemo
//
//  Created by trq on 16/10/9.
//  Copyright © 2016年 fanyu. All rights reserved.
//

#import "XJNumButton.h"

#import <Masonry.h>

@interface XJNumButton ()

@property (nonatomic, strong) UILabel *labelNumber;

@property (nonatomic, strong) UILabel *labelString;

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation XJNumButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)buttonWithNumber:(NSInteger)number withString:(NSString *)string {
    
    return [[self alloc] initWithNumber:number withString:string];
}
/*
 图片宽高 109 * 32
 
 黄色部分是 34
 
 剩余部分 75
 
 */

- (instancetype)initWithNumber:(NSInteger)number withString:(NSString *)string {
    
    if (self = [super init]) {
        
        self.isSelect = NO;
        self.number = number;
        self.string = string;
        
        
        self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_numbuttondefault"]];
        [self addSubview:self.imgView];
        
        self.labelNumber = [[UILabel alloc] init];
        self.labelNumber.backgroundColor = [UIColor clearColor];
        self.labelNumber.textAlignment = NSTextAlignmentCenter;
        self.labelNumber.textColor = [UIColor whiteColor];
        self.labelNumber.adjustsFontSizeToFitWidth = YES;
        self.labelNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.labelNumber];
        
        
        self.labelString = [[UILabel alloc] init];
        self.labelString.backgroundColor = [UIColor clearColor];
//        self.labelString.textAlignment = NSTextAlignmentCenter;
        self.labelString.lineBreakMode = NSLineBreakByTruncatingMiddle;
        self.labelString.font = [UIFont systemFontOfSize:14];
        self.labelString.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.labelString];
        
        self.labelNumber.text = [NSString stringWithFormat:@"%02ld",(long)number];
        self.labelString.text = string;
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
    [self.labelNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.frame.size.width*34.0/109);
        make.bottom.mas_equalTo(0);
        
    }];
    
    [self.labelString mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(self.labelNumber.mas_right);
        make.right.mas_equalTo(0);
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.isSelect) {
        //选中变  未选中
        self.imgView.image = [UIImage imageNamed:@"ico_numbuttondefault"];
        
    }
    else {
        //未选中  变 选中
        
        self.imgView.image = [UIImage imageNamed:@"ico_numbuttonSelect"];
        
    }
    
    self.isSelect = !self.isSelect;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(buttonResponseMethod:)]) {
        
        [self.delegate buttonResponseMethod:self];
        
    }
    
    
}



@end
