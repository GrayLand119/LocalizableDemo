//
//  GLLanguageManager.m
//  SmartFoot
//
//  Created by GrayLand on 16/10/26.
//  Copyright © 2016年 icomwell. All rights reserved.
//

#import "GLLanguageManager.h"


static NSString * const kCH          = @"zh-Hans";
static NSString * const kEN          = @"en";
static NSString * const kProj        = @"lproj";
static NSString * const kLanguageSet = @"kLanguageSet";

@interface GLLanguageManager()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSString *languageString;

@end

@implementation GLLanguageManager

+ (instancetype)defaultManager
{
    static dispatch_once_t onceToken;
    static GLLanguageManager *manager;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[GLLanguageManager alloc] init];
        }
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setupEnv];
    }
    
    return self;
}

- (void)setupEnv
{
    NSString *tempStr = [[NSUserDefaults standardUserDefaults] objectForKey:kLanguageSet];
    NSString *path;
    
    if (!tempStr) {
        tempStr = kEN;
    }
    
    self.languageString = tempStr;
    path = [[NSBundle mainBundle] pathForResource:self.languageString ofType:kProj];
    self.bundle = [NSBundle bundleWithPath:path];
    
    if ([self.languageString isEqualToString:kCH]) {
        _languageType = GLLanguageTypeChineseSimple;
    }else if ([self.languageString isEqualToString:kEN]) {
        _languageType = GLLanguageTypeEnglish;
    }
}

- (void)changeLanguageType:(GLLanguageType)type;
{
    if (self.currentLanguageType == type) {
        return;
    }
    
    _languageType = type;
    switch (type) {
        case GLLanguageTypeEnglish:
            _languageString = kEN;
            break;
        case GLLanguageTypeChineseSimple:
            _languageString = kCH;
            break;
        default:
            _languageString = kCH;
            _languageType   = GLLanguageTypeChineseSimple;
            break;
    }
    
    if ([_languageString isEqualToString:kEN] || [_languageString isEqualToString:kCH]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:_languageString ofType:kProj];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:_languageString forKey:kLanguageSet];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNoticeLanguageChange object:nil];
}

- (NSString *)stringWithKey:(NSString *)key table:(NSString *)table
{
    if (_bundle) {
        return  NSLocalizedStringFromTableInBundle(key, table, _bundle, nil);
    }
    
    return NSLocalizedStringFromTable(key, table, nil);
}

@end
