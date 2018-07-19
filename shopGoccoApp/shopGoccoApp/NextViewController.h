//
//  NextViewController.h
//  shopGoccoApp
//
//  Created by apple on 2018/07/06.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) NSArray *imageArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
