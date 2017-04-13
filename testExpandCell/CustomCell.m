//
//  CustomCell.m
//  testExpandCell
//
//  Created by flower on 16/11/17.
//  Copyright © 2016年 flower. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 55)];
    self.label.font = [UIFont systemFontOfSize:17];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];


}

@end
