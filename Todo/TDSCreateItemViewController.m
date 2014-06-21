//
//  TDSCreateItemViewController.m
//  Todo
//
//  Created by matz on 2014/06/21.
//  Copyright (c) 2014年 matz. All rights reserved.
//

#import "TDSCreateItemViewController.h"


@implementation TDSCreateItemViewController


- (IBAction)saveButtonTapped:(id)sender {
    

    // createItemViewControllerDidFinish:を呼び出す
    if([self.delegate respondsToSelector:@selector(createItemViewControllerDidFinish:item:)]){
        
        // 入力文字列を取得する
        NSString *item = self.textField.text;

        [self.delegate createItemViewControllerDidFinish:self item:item];
    }
}

- (IBAction)cencelButtonTapped:(id)sender {
    
    // createItemViewControllerDidCancel: メソッドを呼び出す
    if([self.delegate respondsToSelector:@selector(createItemViewControllerDidCancel:)]){
        
        [self.delegate createItemViewControllerDidCancel:self];
    }
}
@end
