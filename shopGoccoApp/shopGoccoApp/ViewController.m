//
//  ViewController.m
//  shopGoccoApp
//
//  Created by apple on 2018/07/04.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)selectIceCategory:(UIButton *)sender {
    for (UIButton *button in self.iceCategory) {
        [button setBackgroundColor:[UIColor grayColor]];
        
        if (button.tag == sender.tag) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
        }
        
    }
}


- (IBAction)selectSiropCategory:(UIButton *)sender {
    for (UIButton *button in self.siropCategory) {
        [button setBackgroundColor:[UIColor grayColor]];
        
        if (button.tag == sender.tag) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
        }
        
    }
}

- (IBAction)selectToppingCategory:(UIButton *)sender {
    for (UIButton *button in self.toppingCategory) {
        [button setBackgroundColor:[UIColor grayColor]];
        
        if (button.tag == sender.tag) {
            [button setBackgroundColor:[UIColor clearColor]];
            button.selected = NO;
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
