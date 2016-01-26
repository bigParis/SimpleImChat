//
//  ChatMessageModel.m
//  SimpleImChat
//
//  Created by yy on 16/1/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "ChatMessageModel.h"

@implementation ChatMessageModel

+ (instancetype)messageWithDict:(NSDictionary *)dict {
    ChatMessageModel *model = [[ChatMessageModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
