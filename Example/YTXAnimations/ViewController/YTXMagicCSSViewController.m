//
//  YTXMagicCSSViewController.m
//  YTXAnimations
//
//  Created by CaoJun on 16/4/23.
//  Copyright © 2016年 lilonglong. All rights reserved.
//

#import "YTXMagicCSSViewController.h"
#import <YTXAnimations/UIView+YTXMagicCSS.h>
#import <objc/runtime.h>
#import <objc/message.h>

// RGB颜色
#define YTXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define YTXRandomColor YTXColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface YTXMagicCSSViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UILabel *AnimationLabel;

@property (nonatomic, strong) NSArray *listDict;
@end

@implementation YTXMagicCSSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - lazy init

- (NSArray *)listDict {
    if (!_listDict) {
        _listDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"MagicCSS.plist" ofType:nil]];
    }
    return _listDict;
}

- (NSDictionary *)firDic:(NSInteger)index {
    return self.listDict[index];
}

- (NSDictionary *)subDic:(NSInteger)index name:(NSString *)name {
    return [self.listDict[index] objectForKey:name];
}

- (NSString *)getKey:(NSIndexPath *)indexpath {
    NSDictionary *subDic = [self subDic:indexpath.section name:@"sub"];
    NSArray *allkeys = [subDic allKeys];
    return [allkeys objectAtIndex:indexpath.row];
}

- (NSString *)getValue:(NSIndexPath *)indexpath {
    NSDictionary *subDic = [self subDic:indexpath.section name:@"sub"];
    NSArray *allValues = [subDic allValues];
    return [allValues objectAtIndex:indexpath.row];
}
#pragma mark - delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listDict.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = [self firDic:section];
    return dic[@"name"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *subDic = [self subDic:section name:@"sub"];
    return subDic.count;
}

static NSString *identifity = @"cell";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifity];
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifity];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"      %@",[self getKey:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.AnimationLabel.layer removeAllAnimations];
    [self.AnimationLabel setTextColor:YTXRandomColor];
    
    SEL sel = NSSelectorFromString([self getValue:indexPath]);
    double time = 0.8;
    if (sel) {
        objc_msgSend(self.AnimationLabel,sel, &time);
    }
}
@end