//
//  ChatViewController.m
//  SimpleImChat
//
//  Created by yy on 16/1/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatMessageModel.h"
#import "ChatViewCell.h"

@interface ChatViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray<ChatMessageModel *> *messages;
@property (weak, nonatomic) IBOutlet UITableView *msgTableView;
- (IBAction)reloadButtonPressed:(id)sender;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.msgTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSLog(@"viewDidLoad");
//    self.msgTableView.estimatedRowHeight = 100.0f;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}

- (NSArray<ChatMessageModel *> *)messages {
    if (!_messages) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            ChatMessageModel *model = [ChatMessageModel messageWithDict:dict];
            [tmpArray addObject:model];
        }
        _messages = tmpArray;
    }
    return _messages;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
//    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s:%ld", __func__, indexPath.row);
    ChatViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ChatViewCellIdentifier"];
//    NSLog(@"%s::%@", __func__, cell);
//    NSLog(@"cellForRowAtIndexPath, model:%f", cell.messageModel.cellHeight);
    cell.messageModel = self.messages[indexPath.row];
    return cell;
    
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s:%ld",__func__, indexPath.row);
    return 200.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s:%ld", __func__, indexPath.row);
    ChatMessageModel *model = self.messages[indexPath.row];
//    ChatViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ChatViewCellIdentifier" forIndexPath:indexPath];
//    NSLog(@"%s:%@", __func__, cell);
//    NSLog(@"heightForRowAtIndexPath, model:%f", cell.messageModel.cellHeight);
    return model.cellHeight;
}

- (IBAction)reloadButtonPressed:(id)sender {
    NSLog(@"reloadButtonPressed");
    [self.msgTableView reloadData];
//    [self.msgTableView setContentOffset:CGPointMake(0,0) animated:NO];
}
@end
