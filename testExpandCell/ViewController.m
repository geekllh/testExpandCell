//
//  ViewController.m
//  testExpandCell
//
//  Created by flower on 16/11/17.
//  Copyright © 2016年 flower. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"  //普通的cell
#import "ExpandCell.h"  //扩展的cell

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView *myTableView;
@property (nonatomic, assign)BOOL isExpand; //判断当前cell是否展开
@property (nonatomic, strong)NSIndexPath *selectedIndexPath; //记录所点击的cell的位置


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorColor =[UIColor darkGrayColor];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.myTableView];
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isExpand && [self.selectedIndexPath isEqual:indexPath]) {//如果展开并且是当前选中的cell
        //创建扩展的cell
        static NSString *expandCellID = @"expandCell";
        ExpandCell *cell = [tableView dequeueReusableCellWithIdentifier:expandCellID];
        if (cell == nil) {
            
            cell = [[ExpandCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:expandCellID];
        }
        
        cell.label.text = @"点击详情";
        cell.expandLabel.text = @"详情";
        return cell;
        
    }else{     //普通情况
        //创建普通cell
        static NSString *customCellID = @"customCell";
        
        CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:customCellID];
        if (cell == nil) {
            
            cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCellID];
        }
        cell.label.text = @"点击详情";
        
        return cell;
    }
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.selectedIndexPath.row && self.selectedIndexPath != nil ) {// 判断是否是所点击的cell
        if (self.isExpand == YES) { // 判断这个已点击的cell是否展开
            return 85;
        }else{
            return 55;
        }
    }else{
        return 55;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!self.selectedIndexPath) {
        
        self.isExpand = YES;
        self.selectedIndexPath = indexPath;
        [self.myTableView beginUpdates];
        [self.myTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.myTableView endUpdates];
    }else{
        
        if (self.isExpand) {
            if ([self.selectedIndexPath isEqual: indexPath]) {
                self.isExpand = NO;
                [self.myTableView beginUpdates];
                [self.myTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.myTableView endUpdates];
                self.selectedIndexPath = nil;
                
            }else{
                [self.myTableView beginUpdates];
                [self.myTableView reloadRowsAtIndexPaths:@[self.selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                self.isExpand = YES ;
                self.selectedIndexPath = indexPath;
                [self.myTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.myTableView endUpdates];
            }
        }
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
