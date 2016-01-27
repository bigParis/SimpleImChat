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
@property (weak, nonatomic) IBOutlet UIImageView *oherPortraitImg;
@property (weak, nonatomic) IBOutlet UIButton *otherContentBtn;

@end

@implementation ChatViewCell

- (void)setMessageModel:(ChatMessageModel *)messageModel {
    _messageModel = messageModel;
    self.timeLabel.text = messageModel.time;
    if (_messageModel.type == MessageTypeMe) {
        [self setShowContent:self.contentBtn showPortrait:self.portraitImg hideContent:self.otherContentBtn hidePortrait:self.oherPortraitImg];
    } else {
        [self setShowContent:self.otherContentBtn showPortrait:self.oherPortraitImg hideContent:self.contentBtn hidePortrait:self.portraitImg];
    }
    
}

- (void)setShowContent:(UIButton *)showContent showPortrait:(UIImageView *)showPortrait hideContent:(UIButton *)hideContent hidePortrait:(UIImageView *)hidePortrait {
    showContent.hidden = NO;
    showPortrait.hidden = NO;
    hideContent.hidden = YES;
    hidePortrait.hidden = YES;
    
    [showContent setTitle:_messageModel.text forState:UIControlStateNormal];
    
    [self layoutIfNeeded];
    
    // 通过frame设置是不可以的,AutoLayout会根据约束改变frame
    //    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.contentBtn.titleLabel.frame.size.height);
    
    CGFloat labelHeight = showContent.titleLabel.frame.size.height;
    //     用Masonary可能会有权限问题
    [showContent mas_updateConstraints:^(MASConstraintMaker *make) {
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
    [showContent layoutIfNeeded];
    CGFloat spacing = 10.0f;
    _messageModel.cellHeight = MAX(CGRectGetMaxY(showPortrait.frame), CGRectGetMaxY(showContent.frame)) + spacing;
}
- (void)awakeFromNib {
    self.contentBtn.titleLabel.numberOfLines = 0;
    self.otherContentBtn.titleLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
