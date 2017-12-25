//
//  HorizontalPageViewController.m
//  JHCollectionViewLayout
//
//  Created by Jivan on 2017/12/25.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "HorizontalPageViewController.h"
#import "JHHorizontalPageFlowlayout.h"
#import "JHCollectionViewCell.h"

#define MAIN_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

@interface HorizontalPageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView*  collectionView ;

@end

@implementation HorizontalPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.view.backgroundColor = [UIColor whiteColor];
    
     [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([JHCollectionViewCell class])];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20 ;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JHCollectionViewCell class]) forIndexPath:indexPath];
     cell.contentView.backgroundColor = [UIColor colorWithRed:(arc4random()%251)/255.0 green:(arc4random()%251)/255.0 blue:(arc4random()%251)/255.0 alpha:1];
    return cell;
}

#pragma mark - Lazy
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        /** -----1.使用苹果提供的的UICollectionViewFlowLayout布局----- */
        // UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        /** -----2.使用自定义的的HorizontalPageFlowlayout布局----- */
        JHHorizontalPageFlowlayout *layout = [[JHHorizontalPageFlowlayout alloc] initWithRowCount:1 itemCountPerRow:5];
        [layout setColumnSpacing:0 rowSpacing:0 edgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
      
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64,MAIN_SCREEN_WIDTH,MAIN_SCREEN_WIDTH/5.00) collectionViewLayout:layout];
        _collectionView.center = self.view.center ;
        _collectionView.bounces = YES;
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = NO ;
        _collectionView.backgroundColor = [UIColor whiteColor];

        [self.view addSubview:_collectionView];
    }
    
    return _collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



