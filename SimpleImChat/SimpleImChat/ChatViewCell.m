//
//  ChatViewCell.m
//  SimpleImChat
//
//  Created by yy on 16/1/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "ChatViewCell.h"
#import "ChatMessageModel.h"
#import "Masonry.h"

@interface ChatViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *contentBtn;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImg;

@end

@implementation ChatViewCell

- (void)setMessageModel:(ChatMessageModel *)messageModel {
    _messageModel = messageModel;
    self.timeLabel.text = messageModel.time;
    [self.contentBtn setTitle:messageModel.text forState:UIControlStateNormal];

    [self layoutIfNeeded];
    
    // 通过frame设置是不可以的,AutoLayout会根据约束改变frame
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.contentBtn.titleLabel.frame.size.height);
    
    CGFloat labelHeight = self.contentBtn.titleLabel.frame.size.height;
//     用Masonary可能会有权限问题
    [self.contentBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(labelHeight));
    }];
    // 下面使用系统的约束添加
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentBtn
//                                                     attribute:NSLayoutAttributeHeight
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:nil
//                                                     attribute:NSLayoutAttributeHeight
//                                                    multiplier:1
//                                                      constant:labelHeight]];
    [self.contentBtn layoutIfNeeded];
    CGFloat spacing = 10.0f;
    messageModel.cellHeight = MAX(CGRectGetMaxY(self.portraitImg.frame), CGRectGetMaxY(self.contentBtn.frame)) + spacing;
    
//    [self layoutIfNeeded];
}
- (void)awakeFromNib {
    self.contentBtn.titleLabel.numberOfLines = 0;
    UIImage * image = [[UIImage imageNamed:@"文字气泡2.png"] stretchableImageWithLeftCapWidth:25 topCapHeight:15];
    [self.contentBtn setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
