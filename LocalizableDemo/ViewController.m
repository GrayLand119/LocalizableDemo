//
//  ViewController.m
//  LocalizableDemo
//
//  Created by GrayLand on 16/9/30.
//  Copyright © 2016年 GrayLand. All rights reserved.
//

#import "ViewController.h"
#import "GLLanguageManager.h"
#import "ChangeLanguageViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UIButton *changeLanguageBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initLanguage];
    
    [self updateTitle];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTitle) name:kNoticeLanguageChange object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupViews
{
    // xib
}

- (void)updateTitle
{
    self.navigationItem.title = GLLocalizedString(@"main_title", nil);
    
    [_changeLanguageBtn setTitle:GLLocalizedString(@"main_change_language", nil) forState:UIControlStateNormal];
    _label.text               = GLLocalizedString(@"main_apple", @"苹果");
    _label2.text              = GLLocalizedString(@"main_banana", nil);
}

- (void)initLanguage
{
    [[GLLanguageManager defaultManager] changeLanguageType:GLLanguageTypeChineseSimple];
//    [[LanguageManager defaultManager] changeLanguage:@"en"];
}

- (IBAction)onChangeLanguage:(UIButton *)sender
{
    ChangeLanguageViewController *vc = [[ChangeLanguageViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
