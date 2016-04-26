//
//  YTXCSShakeViewController.m
//  YTXAnimations
//
//  Created by lilonglong on 04/11/2016.
//  Copyright (c) 2016 lilonglong. All rights reserved.
//

#import "YTXCSSHakeViewController.h"
#import <YTXAnimations/UIView+YTXCSShake.h>
#import <objc/runtime.h>
#import <objc/message.h>

// RGB颜色
#define YTXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define YTXRandomColor YTXColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface YTXCSShakeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UILabel *AnimationLabel;

@property (nonatomic, strong) NSArray *listDict;
@end

@implementation YTXCSShakeViewController

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
        _listDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CSShake.plist" ofType:nil]];
    }
    return _listDict;
}

- (NSDictionary *)firDic:(NSInteger)index {
    return self.listDict[index];
}

- (NSArray *)subDic:(NSInteger)index name:(NSString *)name {
    return [self.listDict[index] objectForKey:name];
}

- (NSString *)getKey:(NSIndexPath *)indexpath {
    NSArray *subArray = [self subDic:indexpath.section name:@"sub"];
    return subArray[indexpath.row][@"name"];
}

- (NSString *)getValue:(NSIndexPath *)indexpath {
    NSArray *subArray = [self subDic:indexpath.section name:@"sub"];
    return subArray[indexpath.row][@"function"];
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
    
    NSArray *subDic = [self subDic:section name:@"sub"];
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
    if (sel) { 
        objc_msgSend(self.AnimationLabel,sel);
    }
}
@end
