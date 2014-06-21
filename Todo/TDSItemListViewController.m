//
//  TDSItemListViewController.m
//  Todo
//
//  Created by matz on 2014/06/21.
//  Copyright (c) 2014年 matz. All rights reserved.
//

#import "TDSItemListViewController.h"
#import "TDSCreateItemViewController.h"

@interface TDSItemListViewController () <TDSCreateItemViewControllerDelegate>

// 配列のプロパティ
@property NSMutableArray *items;

@end

@implementation TDSItemListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // セクションはひとつ
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // リストのアイテム数を返す
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // deleteボタン押下時、配列からアイテムを削除
        [_items removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([[segue identifier] isEqualToString:@"CreateItemSegue"]){
        // 遷移先のTDSCreateItemViewControllerのインスタンスを取得する
        TDSCreateItemViewController *controller =
        (TDSCreateItemViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        
        // delegate プロパティにself(MasterViewController自身)を設定する
        controller.delegate = self;
    }
}


- (void) createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item
{
    // 配列がない場合は生成する
    if(!_items){
        _items = [[NSMutableArray alloc] init];
    }
    
    // アイテムを先頭に追加する
    [_items insertObject:item atIndex:0];
    
    // UITableViewにUITableViewCellを追加する
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // TDSCreateItemViewControllerを閉じる
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void) createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end
