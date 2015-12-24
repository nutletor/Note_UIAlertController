//
//  ViewController.m
//  AlertController_Demo
//
//  Created by HuangFei on 15/10/8.
//  Copyright © 2015年 BZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSheetBtnAction:(id)sender {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
//    alertVC.view.tintColor = [UIColor orangeColor];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * aAction = [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Default");
    }];
    UIAlertAction * bAction = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"Destructive");
    }];

    [alertVC addAction:cancelAction];
    [alertVC addAction:aAction];
    [alertVC addAction:bAction];

    [self presentViewController:alertVC animated:YES completion:nil];
}

- (IBAction)alertViewBtnAction:(id)sender {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
//    alertVC.view.tintColor = [UIColor orangeColor];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * aAction = [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Default");
    }];
    UIAlertAction * bAction = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"Destructive");
    }];
    UIAlertAction * cAction = [UIAlertAction actionWithTitle:@"打印文本内容" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"%@", [alertVC.textFields firstObject].text);
    }];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:aAction];
    [alertVC addAction:bAction];
    [alertVC addAction:cAction];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.delegate = self;
        textField.placeholder = @"请输入帐号";
    }];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"DidBeginEditing");
}

@end
