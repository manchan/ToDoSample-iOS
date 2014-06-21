//
//  TDSCreateItemViewController.h
//  Todo
//
//  Created by matz on 2014/06/21.
//  Copyright (c) 2014年 matz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDSCreateItemViewControllerDelegate;

@interface TDSCreateItemViewController : UITableViewController
@property (weak, nonatomic) id<TDSCreateItemViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)cencelButtonTapped:(id)sender;

@end

@protocol TDSCreateItemViewControllerDelegate <NSObject>

- (void)createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item;

- (void)createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller;

@end


