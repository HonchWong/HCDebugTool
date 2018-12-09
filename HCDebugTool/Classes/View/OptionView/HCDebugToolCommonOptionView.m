//
//  HCDebugToolCommonOptionView.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolCommonOptionView.h"
#import "HCDebugToolCommonOptionItemView.h"

#define CellReuseIdentifier @"CellReuseIdentifier"
#define CellCountEachline   4
#define CellMargin          10
#define ColViewLRMargin     16

@interface HCDebugToolCommonOptionView () <UICollectionViewDelegate, UICollectionViewDataSource, HCDebugToolCommonOptionItemViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) CGSize optionViewSize;
@property (nonatomic, strong) NSArray <HCDebugToolCommonOptionView *>* optionViews;
@property (nonatomic, strong) HCDebugToolCommonOptionViewModel *viewModel;

@end

@implementation HCDebugToolCommonOptionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configProperty];
        [self setupSubviews];
    }
    return self;
}

- (void)configProperty {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setupSubviews {
    [self addSubview:self.collectionView];
}

- (void)layoutSubviews {
    self.collectionView.frame = self.bounds;
}

- (void)setViewModel:(HCDebugToolCommonOptionViewModel *)viewModel {
    _viewModel = viewModel;
    self.optionViews = nil;
    [self.collectionView reloadData];
}

+ (CGFloat)viewHeightWithModel:(HCDebugToolCommonOptionViewModel *)viewModel {
    if (!viewModel.items.count) {
        return 0;
    }
    
    CGFloat lineCount = viewModel.items.count / CellCountEachline;
    if (viewModel.items.count % CellCountEachline != 0) {
        lineCount = lineCount + 1;
    }
    CGFloat cellWH = [self.class cellWidthHeight];
    
    return ColViewLRMargin * 2 + lineCount * cellWH + (lineCount - 1) * CellMargin;
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.optionViews.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifier
                                              forIndexPath:indexPath];
    UIView *view = [self.optionViews objectAtIndex:indexPath.row];
    [view removeFromSuperview];
    [cell.contentView addSubview:view];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(optionDidSelected:atIndex:)]) {
        [self.delegate optionDidSelected:[self.viewModel.items objectAtIndex:indexPath.row]
                                 atIndex:indexPath.row];
    }
}

#pragma mark - getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = CellMargin;
        flowLayout.minimumInteritemSpacing = CellMargin;
        CGFloat cellWH = [self.class cellWidthHeight];
        self.optionViewSize = CGSizeMake(cellWH, cellWH);
        flowLayout.itemSize = self.optionViewSize;
        flowLayout.sectionInset = UIEdgeInsetsMake(ColViewLRMargin, ColViewLRMargin, ColViewLRMargin, ColViewLRMargin);
        
        CGRect collectionViewFrame =
        CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), ColViewLRMargin * 2 + self.optionViewSize.height);
        _collectionView =
        [[UICollectionView alloc] initWithFrame:collectionViewFrame
                           collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:CellReuseIdentifier];
    }
    return _collectionView;
}

- (NSArray<HCDebugToolCommonOptionView *> *)optionViews {
    if (!_optionViews) {
        CGFloat height = [self.class cellWidthHeight];
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:self.viewModel.items.count];
        for (HCDebugToolCommonOptionItemViewModel *item in self.viewModel.items) {
            HCDebugToolCommonOptionItemView *view = [[HCDebugToolCommonOptionItemView alloc] initWithFrame:CGRectMake(0, 0, height, height)];
            view.delegate = self;
            [view setViewModel:item];
            [tempArray addObject:view];
        }
        _optionViews = tempArray;
    }
    return _optionViews;
}

+ (CGFloat)cellWidthHeight {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat cellWH =
    (screenSize.width - ColViewLRMargin * 2 - CellMargin * (CellCountEachline - 1))
    / CellCountEachline;
    cellWH = cellWH > 60 ? cellWH : 60;
    return cellWH;
}

#pragma mark - HCDebugToolCommonOptionItemViewDelegate

- (void)optionItem:(HCDebugToolCommonOptionItemViewModel *)viewModel
   didChangeSwitch:(BOOL)isOn {
    if ([self.delegate respondsToSelector:@selector(optionSwitchDidChage:status:)]) {
        [self.delegate optionSwitchDidChage:viewModel status:isOn];
    }
}


@end
