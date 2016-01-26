//
//  ChatMessageModel.h
//  SimpleImChat
//
//  Created by yy on 16/1/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MessageType) {
    MessageTypeMe = 0,
    MessageTypeOther = 1
};

@interface ChatMessageModel : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *time;
@property (assign, nonatomic) MessageType type;
@property (assign, nonatomic) CGFloat cellHeight;
+ (instancetype)messageWithDict:(NSDictionary *)dict;

@end
