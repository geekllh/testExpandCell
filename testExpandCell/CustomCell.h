//
//  CustomCell.h
//  testExpandCell
//
//  Created by flower on 16/11/17.
//  Copyright © 2016年 flower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (strong, nonatomic)UILabel *label;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;

@end
