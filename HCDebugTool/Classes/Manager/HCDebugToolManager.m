//
//  HCDebugToolManager.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolManager.h"
#import "HCDebugToolEntranceView.h"
#import "HCDebugToolEntranceViewController.h"
#import "HCDebugToolModuleProtocol.h"
#import "HCDebugToolManager+EntraceView.h"

#define AutoShowEntranceViewDisable     @"AutoShowEntranceViewDisable"

@interface HCDebugToolManager ()

@property (nonatomic, strong) NSMutableDictionary *modulesDict;
@property (nonatomic, strong) NSMutableArray <NSObject <HCDebugToolModuleProtocol>*> *modules;

//@property (nonatomic, strong) HCDebugToolEntranceView *entranceView;

@property (nonatomic, strong) HCDebugToolEntranceViewController *entranceVC;

@property (nonatomic, strong) UINavigationController *naviVC;

@end

@implementation HCDebugToolManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static HCDebugToolManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[HCDebugToolManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        [self configProperty];
        [self checkAutoShowEntranceView];
    }
    return self;
}

- (void)configProperty {
    self.entranceVC = [[HCDebugToolEntranceViewController alloc] init];
}

@end

const struct HCDebugToolManagerKeys
HCDebugToolManagerKeys = {
    .autoShowEntranceViewDisable = @"autoShowEntranceViewDisable",
};
