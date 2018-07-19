//
//  NextViewController.m
//  shopGoccoApp
//
//  Created by apple on 2018/07/06.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "NextViewController.h"
#import "NextCollectionViewCell.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    
    [self.collectionView registerClass:[NextCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    UINib *nibFirst = [UINib nibWithNibName:@"NextCollectionViewCell" bundle:nil];
//    [self.collectionView registerNib:nibFirst forCellWithReuseIdentifier:@"NextCollectionViewCell"];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //section 数の設定、今回は１つにセット
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    // itemの数を設定する、配列の全要素数を入れる
    return _imageArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NextCollectionViewCell *cell;
    //dequeueReusableCellWithReuseIdentifier の働きは再利用できるセルがあればそれを使う
    // 再利用できるセルがなければ生成する
//    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

     cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    //storyboard上の画像につけたタグに合わせて UIImageView のインスタンスを生成
//    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    // 配列のindexをcellのindexと同じにする
//    NSString *imgName = _imageArray[(int)(indexPath.row)];
    // 配列の名前の画像を呼び出す
    UIImage *image = _imageArray[(int)(indexPath.row)];
    // UIImageをimageViewの画像として設定
//    imageView.image = image;

    cell.cellImage.image = image;
    
//    UILabel *label = (UILabel *)[cell viewWithTag:2];
//    label.text = _imageArray[(int)(indexPath.row)];
    
    return cell;
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

@end
