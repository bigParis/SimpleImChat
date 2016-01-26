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
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.msgTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view.
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
//    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath:%ld", indexPath.row);
    ChatViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ChatViewCellIdentifier"];
    cell.messageModel = self.messages[indexPath.row];
    return cell;
    
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"estimatedHeightForRowAtIndexPath:%ld", indexPath.row);
    return 200.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath:%ld", (long)indexPath.row);
    ChatMessageModel *model = self.messages[indexPath.row];
    return model.cellHeight;
}
@end
