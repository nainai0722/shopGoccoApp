//
//  ViewController.m
//  shopGoccoApp
//
//  Created by apple on 2018/07/04.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "ViewController.h"
#import "NextCollectionViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    BOOL _selectedIce;
    BOOL _selectedSirop;
    BOOL _selectedTopping;
    int _isAllSelected;
    NSMutableArray *_imageArr;
    NSMutableArray *_orderArr;
    NSMutableDictionary *_orderDic;
}
@property (weak, nonatomic) IBOutlet UIButton *iceFuwafuwa;
@property (weak, nonatomic) IBOutlet UIButton *iceZakuzaku;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *iceCategory;
@property (weak, nonatomic) IBOutlet UIButton *siropBerry;
@property (weak, nonatomic) IBOutlet UIButton *siropCalpis;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *siropCategory;
@property (weak, nonatomic) IBOutlet UIButton *rennyu;
@property (weak, nonatomic) IBOutlet UIButton *iceCream;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *toppingCategory;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArr = [NSMutableArray new];
    _selectedIce = NO;
    _selectedSirop = NO;
    _selectedTopping = NO;
    _isAllSelected = 3;
    _orderDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                        @"", @"1",
                                        @"", @"2",
                                        @"", @"3",
                                        @"", @"4",
                                        @"", @"5",
                                        @"", @"6",
                                          nil];
    for (int i=1; i<=[_orderDic count]; i++) {
        _orderDic[[NSString stringWithFormat:@"%d",i]] = @"0";
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    if (_imageArr != nil){
        _imageArr = nil;
        _imageArr = [NSMutableArray new];
        self->_selectedIce = NO;
        self->_selectedSirop = NO;
        self->_selectedTopping = NO;
        self->_isAllSelected = 3;
        for (UIButton *button in self.iceCategory) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
        }
        for (UIButton *button in self.siropCategory) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
        }
        for (UIButton *button in self.toppingCategory) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
        }
    }
}

- (IBAction)selectIceCategory:(UIButton *)sender {
    for (UIButton *button in self.iceCategory) {
        [button setBackgroundColor:[UIColor grayColor]];
        
        if (button.tag == sender.tag) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
            
            NSString *numsStr = _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]] ;
            int nums = [numsStr intValue];
            _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]]  = [NSString stringWithFormat:@"%d",nums+1];
        }
    }
    if(!_selectedIce){
        _selectedIce = YES;
        _isAllSelected--;
        if (_isAllSelected == 0) {
            [self showNextBtn];
        }
    }
}


- (IBAction)selectSiropCategory:(UIButton *)sender {
    for (UIButton *button in self.siropCategory) {
        [button setBackgroundColor:[UIColor grayColor]];
        if (button.tag == sender.tag) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
//            _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]] = [NSString stringWithFormat:@"%ld",sender.tag];
            NSString *numsStr = _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]] ;
            int nums = [numsStr intValue];
            _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]]  = [NSString stringWithFormat:@"%d",nums+1];
        }
    }
    if(!_selectedSirop){
        _selectedSirop = YES;
        _isAllSelected--;
        if (_isAllSelected == 0) {
            [self showNextBtn];
        }
    }
}

- (IBAction)selectToppingCategory:(UIButton *)sender {

    for (UIButton *button in self.toppingCategory) {
        [button setBackgroundColor:[UIColor grayColor]];
        
        if (button.tag == sender.tag) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
//           _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]]  = [NSString stringWithFormat:@"%ld",sender.tag];
            NSString *numsStr = _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]] ;
            int nums = [numsStr intValue];
            _orderDic[[NSString stringWithFormat:@"%ld",sender.tag]]  = [NSString stringWithFormat:@"%d",nums+1];
        }
    }
    if(!_selectedTopping){
        _selectedTopping = YES;
        _isAllSelected--;
        if (_isAllSelected == 0) {
            [self showNextBtn];
        }
    }
}

- (void)showNextBtn{
    NSLog(@"NextBtn");
    [self saveOrderArr];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@"注文は完了ですか"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"まだ注文します"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                       NSLog(@"clicked Button title: %@", action.title);
                                                       [self saveImage];
                                                       self->_selectedIce = NO;
                                                       self->_selectedSirop = NO;
                                                       self->_selectedTopping = NO;
                                                       self->_isAllSelected = 3;
                                                       for (UIButton *button in self.iceCategory) {
                                                           [button setBackgroundColor:[UIColor clearColor]];
                                                            button.selected = NO;
                                                       }
                                                       for (UIButton *button in self.siropCategory) {
                                                           [button setBackgroundColor:[UIColor clearColor]];
                                                           button.selected = NO;
                                                       }
                                                       for (UIButton *button in self.toppingCategory) {
                                                           [button setBackgroundColor:[UIColor clearColor]];
                                                           button.selected = NO;
                                                       }
                                                   }];
    [alertController addAction:action];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"終わる"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                       NSLog(@"clicked Button title: %@", action.title);

                                                       [self saveImage];
                                                       [self goToNextView];

                                                   }];
    [alertController addAction:action2];

    [self presentViewController:alertController
                       animated:YES
                     completion:^{
                         NSLog(@"displayed");
                     }];
}

- (void)saveImage{
    // キャプチャ対象をWindowにします。
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    // キャプチャ画像を描画する対象を生成します。
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Windowの現在の表示内容を１つずつ描画して行きます。
    for (UIWindow *aWindow in [[UIApplication sharedApplication] windows]) {
        [aWindow.layer renderInContext:context];
    }
    
    // 描画した内容をUIImageとして受け取ります。
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 描画を終了します。
    UIGraphicsEndImageContext();
    [_imageArr addObject:capturedImage];
}

- (void)saveOrderArr{
//    int i =(int)[_orderArr count];
//    NSDictionary *dic = [_orderDic copy];
//    if (_orderArr == nil) {
//        _orderArr =  [@[dic] mutableCopy];
//    }else{
//        _orderArr[i] = dic;
//    }
    /*注文結果表を作成する？
     
     
     */
}

- (void)goToNextView{
    //画面遷移用に使う
//    NextViewController *vc = [[NextViewController alloc] init];
//    vc.imageArray = [_imageArr copy];
//    [self presentViewController:vc animated:YES completion:nil];
//    NextCollectionViewController *vc = [[NextCollectionViewController alloc] init];
    NextCollectionViewController *vc= [[NextCollectionViewController alloc] initWithNibName:@"NextCollectionViewController" bundle:nil];
    
    vc.imageArray = [_imageArr copy];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
