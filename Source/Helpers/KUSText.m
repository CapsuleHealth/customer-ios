//
//  KUSText.m
//  Kustomer
//
//  Created by Daniel Amitay on 7/30/17.
//  Copyright © 2017 Kustomer. All rights reserved.
//

#import "KUSText.h"

#import <TSMarkdownParser/TSMarkdownParser.h>

@implementation KUSText

+ (NSAttributedString *)attributedStringFromText:(NSString *)text fontSize:(CGFloat)fontSize
{
    return [self attributedStringFromText:text fontSize:fontSize color:nil];
}

+ (NSAttributedString *)attributedStringFromText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color
{
    TSMarkdownParser *parser = [TSMarkdownParser standardParser];

    parser.defaultAttributes = KUSAttributedFontWithSize(parser.defaultAttributes, fontSize, color);
    parser.imageAttributes = KUSAttributedFontWithSize(parser.imageAttributes, fontSize, color);
    parser.linkAttributes = KUSAttributedFontWithSize(parser.linkAttributes, fontSize, color);
    parser.monospaceAttributes = KUSAttributedFontWithSize(parser.monospaceAttributes, fontSize, color);
    parser.strongAttributes = KUSAttributedFontWithSize(parser.strongAttributes, fontSize, color);
    parser.emphasisAttributes = KUSAttributedFontWithSize(parser.emphasisAttributes, fontSize, color);

    return [parser attributedStringFromMarkdown:text];
}

NSDictionary<NSString *, id> *KUSAttributedFontWithSize(NSDictionary<NSString *, id> *attributes, CGFloat fontSize, UIColor *color) {
    UIFont *currentFont = [attributes objectForKey:NSFontAttributeName];
    if (currentFont == nil || currentFont.pointSize == fontSize) {
        return attributes;
    }
    NSMutableDictionary<NSString *, id> *mutableAttributes = [attributes mutableCopy];
    UIFont *newFont = [UIFont fontWithName:currentFont.fontName size:fontSize];
    [mutableAttributes setObject:newFont forKey:NSFontAttributeName];
    if (color) {
        [mutableAttributes setObject:color forKey:NSForegroundColorAttributeName];
    }
    return mutableAttributes;
};


@end
