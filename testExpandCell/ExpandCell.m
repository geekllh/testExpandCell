//
//  ExpandCell.m
//  testExpandCell
//
//  Created by flower on 16/11/17.
//  Copyright © 2016年 flower. All rights reserved.
//

#import "ExpandCell.h"

@implementation ExpandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}


- (void)initUI{

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 55)];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:17];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    self.expandLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 55, self.frame.size.width, 30)];
    self.expandLabel.font = [UIFont systemFontOfSize:13];
    self.expandLabel.backgroundColor = [UIColor lightGrayColor];
    self.expandLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.expandLabel];
        
}
@end
