//
//  KUSChatSessionTableViewCell.m
//  Kustomer
//
//  Created by Daniel Amitay on 7/22/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import "KUSChatSessionTableViewCell.h"

#import "KUSAPIClient.h"
#import "KUSChatSession.h"
#import "KUSImage.h"
#import "KUSText.h"

#import "KUSChatSettingsDataSource.h"

@interface KUSChatSessionTableViewCell () <KUSObjectDataSourceListener> {
    KUSAPIClient *_apiClient;

    KUSChatSession *_chatSession;
}

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation KUSChatSessionTableViewCell

#pragma mark - Lifecycle methods

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier apiClient:(KUSAPIClient *)apiClient
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _apiClient = apiClient;

        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatarImageView];

        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        [self.contentView addSubview:_titleLabel];

        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.backgroundColor = [UIColor whiteColor];
        _subtitleLabel.textColor = [UIColor blackColor];
        _subtitleLabel.textAlignment = NSTextAlignmentLeft;
        _subtitleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_subtitleLabel];

        _dateLabel = [[UILabel alloc] init];
        _dateLabel.backgroundColor = [UIColor whiteColor];
        _dateLabel.textColor = [UIColor lightGrayColor];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_dateLabel];

        [_apiClient.chatSettingsDataSource addListener:self];
    }
    return self;
}


#pragma mark - Property methods

- (void)setChatSession:(KUSChatSession *)chatSession
{
    _chatSession = chatSession;

    self.avatarImageView.image = [KUSImage kustomerTeamIcon];

    self.subtitleLabel.attributedText = [KUSText attributedStringFromText:_chatSession.preview fontSize:12.0];

    // TODO: String from lastSeenAt/last message
    self.dateLabel.text = @"19 hours ago";

    [self _updateTitleLabel];

    [self setNeedsLayout];
}

#pragma mark - Internal methods

- (void)_updateTitleLabel
{
    KUSChatSettings *chatSettings = [_apiClient.chatSettingsDataSource object];
    NSString *teamName = chatSettings.teamName.length ? chatSettings.teamName : _apiClient.organizationName;

    // TODO: Grab username from responders/messages
    self.titleLabel.text = [NSString stringWithFormat:@"Chat with %@", teamName];
}

#pragma mark - Layout methods

- (void)layoutSubviews
{
    [super layoutSubviews];

    // TODO: Extract layout constants
    CGSize avatarImageSize = CGSizeMake(40.0, 40.0);
    self.avatarImageView.frame = (CGRect) {
        .origin.x = 16.0,
        .origin.y = (self.bounds.size.height - avatarImageSize.height) / 2.0,
        .size = avatarImageSize
    };
    self.avatarImageView.layer.cornerRadius = avatarImageSize.width / 2.0;


    CGFloat textXOffset = CGRectGetMaxX(self.avatarImageView.frame) + 8.0;
    CGFloat rightMargin = 20.0;

    CGFloat titleHeight = ceil(self.titleLabel.font.lineHeight);
    self.titleLabel.frame = (CGRect) {
        .origin.x = textXOffset,
        .origin.y = (self.bounds.size.height / 2.0) - titleHeight - 4.0,
        .size.width = self.bounds.size.width - textXOffset - rightMargin - 80,
        .size.height = titleHeight
    };

    CGFloat subtitleHeight = ceil(self.subtitleLabel.font.lineHeight);
    self.subtitleLabel.frame = (CGRect) {
        .origin.x = textXOffset,
        .origin.y = (self.bounds.size.height / 2.0) + 4.0,
        .size.width = self.bounds.size.width - textXOffset - rightMargin,
        .size.height = subtitleHeight
    };

    CGFloat dateHeight = ceil(self.dateLabel.font.lineHeight);
    self.dateLabel.frame = (CGRect) {
        .origin.x = self.bounds.size.width - rightMargin - 80.0,
        .origin.y = (self.bounds.size.height / 2.0) - dateHeight - 4.0,
        .size.width = 80.0,
        .size.height = dateHeight
    };
}

#pragma mark - KUSObjectDataSourceListener methods

- (void)objectDataSourceDidLoad:(KUSObjectDataSource *)dataSource
{
    [self _updateTitleLabel];
}

@end
