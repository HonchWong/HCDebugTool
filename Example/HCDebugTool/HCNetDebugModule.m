//
//  HCNetDebugModule.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/9.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetDebugModule.h"
#include <stdlib.h>
#include <spawn.h>

extern char **environ;

void run_cmd(char *cmd)
{
    pid_t pid;
    char *argv[] = {"sh", "-c", cmd, NULL};
    int status;
    
    status = posix_spawn(&pid, "/bin/sh", NULL, NULL, argv, environ);
    if (status == 0) {
        if (waitpid(pid, &status, 0) == -1) {
            perror("waitpid");
        }
    }
}

@implementation HCNetDebugModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - HCDebugToolCommonOptionViewDelegate

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    // 执行shell命令,只需要将shell命令写成类似下面的字符串,即可一条一条执行
//    run_cmd("echo \"看到此消息说明shell命令执行成功！请按任意键退出...\"");
    run_cmd("ls");
//    run_cmd("exit");
}

#pragma mark - HCDebugToolModuleProtocol

- (NSString *)moduleTitle {
    return @"网络调试";
}

#pragma mark - SuperClass

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{HCDebugCommonModuleOptionKeys.title: @"Mock网络数据",
               HCDebugCommonModuleOptionKeys.viewTag: @(1),
               HCDebugCommonModuleOptionKeys.hasSwich: @(YES),
               HCDebugCommonModuleOptionKeys.isSwichOn: @(YES),
               }];
}

@end
