//
//  NextCollectionViewController.m
//  shopGoccoApp
//
//  Created by apple on 2018/07/06.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "NextCollectionViewController.h"

@interface NextCollectionViewController ()

@end

@implementation NextCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    int selfWidth = self.view.frame.size.width;
    int selfHeight = self.view.frame.size.height;
    UIButton *returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,selfHeight*9/10, selfWidth*3/10, selfHeight/10)];
    [returnBtn setTitle:@"戻る" forState:UIControlStateNormal];
    [returnBtn setBackgroundColor:[UIColor redColor]];
    [returnBtn addTarget:self action:@selector(touchReturnBtn:)
         forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:returnBtn];
    // Do any additional setup after loading the view.
}
- (void)touchReturnBtn:(UIButton*)sender{
//    ViewController *vc = [[ViewController alloc] init];
//    vc.prepareAction =self.prepareActionArry;
//    [self presentViewController:vc animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return [self.imageArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImage* Cellimg = [self.imageArray objectAtIndex:indexPath.row];
    UIImageView *CellimgView = [[UIImageView alloc] initWithImage:Cellimg];
    CellimgView.contentMode = UIViewContentModeScaleAspectFit;
    [cell setBackgroundView:CellimgView];
    
    return cell;
}

/**
 *  UICollectionViewDelegateFlowLayoutのデリゲートメソッド。セルのサイズを返す
 *
 *  @param collectionView 対象のUICollectionView
 *  @param collectionViewLayout 対象のUICollectionViewLayout
 *  @param indexPath 対象のNSIndexPath
 *  @return セルのサイズ
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // １セルあたりのサイズを計算
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    NSUInteger space = 10;
    NSUInteger bar = 64;
    CGSize listCellSize = CGSizeMake((screenSize.size.width - space * 3) / 2,
                                     (screenSize.size.height - bar - space * 3) / 2);
    return listCellSize;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
