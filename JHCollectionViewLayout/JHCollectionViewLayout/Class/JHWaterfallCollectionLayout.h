//
//  JHWaterfallCollectionLayout.h
//  WaterfallCollection
//
//  Created by Jivan on 2017/3/17.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHWaterfallCollectionLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

@required
//决定cell的高度,必须实现方法
- (CGFloat)waterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width;

@optional
//决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout;

//决定cell 的列的距离
- (CGFloat)columMarginInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout;

//决定cell 的行的距离
- (CGFloat)rowMarginInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout;

//决定cell 的边缘距
- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(JHWaterfallCollectionLayout *)waterFlowLayout;

@end

@interface JHWaterfallCollectionLayout : UICollectionViewLayout
/**代理*/
@property (nonatomic,assign) id <WaterFlowLayoutDelegate>delegate;

- (NSInteger)columCount;
- (CGFloat)columMargin;
- (CGFloat)rowMargin;
- (UIEdgeInsets)defaultEdgeInsets;

@end

