//
//  YTXMagicCSSViewController.m
//  YTXAnimations
//
//  Created by CaoJun on 16/4/23.
//  Copyright © 2016年 YTX. All rights reserved.
//

#import "YTXTransformerViewController.h"
#import <YTXAnimations/YTXGooeyCircleLayer.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface YTXTransformerViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UIView *animationView;

@property (nonatomic, strong) NSArray *listDict;
@end

@implementation YTXTransformerViewController

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
        _listDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Transformer.plist" ofType:nil]];
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
    CALayer * layer = [[NSClassFromString([self getKey:indexPath]) alloc] init];
    for (CALayer * subLayer in  self.animationView.layer.sublayers) {
        [subLayer removeFromSuperlayer];
    }
    layer.frame = self.animationView.layer.bounds;
    
//    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.animationView.layer addSublayer:layer];
    [layer setNeedsDisplay];
    SEL sel = NSSelectorFromString([self getValue:indexPath]);
    double time = 0.8;
    if (sel) {
        objc_msgSend(layer, sel, &time);
    }
}
@end