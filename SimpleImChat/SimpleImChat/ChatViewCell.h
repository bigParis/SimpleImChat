//
//  ChatViewCell.h
//  SimpleImChat
//
//  Created by yy on 16/1/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatMessageModel;

@interface ChatViewCell : UITableViewCell

@property (strong, nonatomic) ChatMessageModel *messageModel;

@end
