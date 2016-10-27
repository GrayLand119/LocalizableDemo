//
//  GLLanguageManager.h
//  SmartFoot
//
//  Created by GrayLand on 16/10/26.
//  Copyright © 2016年 icomwell. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GLLocalizedString(key, comment)               GLLocalizedStringFromTable(key, @"Localizable", nil)
#define GLLocalizedStringFromTable(key, tbl, comment) [[GLLanguageManager defaultManager] stringWithKey:key table:tbl]

static NSString * const kNoticeLanguageChange = @"kNoticeLanguageChange";


typedef NS_ENUM(NSUInteger, GLLanguageType) {
    GLLanguageTypeEnglish,
    GLLanguageTypeChineseSimple,
};

@interface GLLanguageManager : NSObject

+ (instancetype)defaultManager;

- (void)changeLanguageType:(GLLanguageType)type;
- (NSString *)stringWithKey:(NSString *)key table:(NSString *)table;


@end
