//
//  ExpandCell.h
//  testExpandCell
//
//  Created by flower on 16/11/17.
//  Copyright © 2016年 flower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandCell : UITableViewCell

@property (strong, nonatomic)UILabel *label;
@property (strong, nonatomic)UILabel *expandLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;

@end
