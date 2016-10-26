//
//  ChangeLanguageViewController.m
//  LocalizableDemo
//
//  Created by GrayLand on 16/9/30.
//  Copyright © 2016年 GrayLand. All rights reserved.
//

#import "ChangeLanguageViewController.h"
#import "GLLanguageManager.h"

static NSString * const kTitle             = @"kTitle";
static NSString * const kLanguageShortName = @"kLanguageShortName";

@interface ChangeLanguageViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *languages;
@end

@implementation ChangeLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _languages = @[@{kTitle : @"English",
                     kLanguageShortName : @(GLLanguageTypeEnglish)},
                   @{kTitle : @"简体中文",
                     kLanguageShortName : @(GLLanguageTypeChineseSimple)}];
}

#pragma - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _languages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"languageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _languages[indexPath.row][kTitle];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GLLanguageType type = [_languages[indexPath.row][kLanguageShortName] intValue];
    [[GLLanguageManager defaultManager] changeLanguageType:type];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
