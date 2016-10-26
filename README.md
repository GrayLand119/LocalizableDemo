# GLLanguageManager
App国际化语言管理工具,实现App内切换语言(App语言不随系统语言变化而变化)
0.0.1版本目前只添加了英语和简体中文

# 1.使用方法
## 1.1 给自己的工程添加国际化语言
略.(教程Google or Baidu)
## 1.2 使用GLLanguageManager
#import "GLLanguageManager.h"后直接调用GLLocalizedString宏 
> GLLocalizedString(key, comment) 
```objc
_label2.text = GLLocalizedString(@"main_banana", nil);
```

## 1.3 切换语言
```objc
- (void)changeLanguageType:(GLLanguageType)type;
```
## 1.4 目前支持语言
0.0.1版本目前只添加了英语和简体中文
```objc
typedef NS_ENUM(NSUInteger, GLLanguageType) {
    GLLanguageTypeEnglish,
    GLLanguageTypeChineseSimple,
};

```

# 安装方法
pod 'GLLanguageManager'
