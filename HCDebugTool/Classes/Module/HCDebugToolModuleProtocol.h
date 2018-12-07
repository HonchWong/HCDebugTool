//
//  HCDebugToolModuleProtocol.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HCDebugToolModuleProtocol <NSObject>

- (NSInteger)numberOfRows;
- (CGFloat)heightForRow:(NSInteger)row;
- (UITableViewCell *)cellForRow:(NSInteger)row
                      tableView:(UITableView *)tableView;

- (NSString *)moduleTitle;

@end
