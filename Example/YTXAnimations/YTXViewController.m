//
//  YTXViewController.m
//  YTXAnimations
//
//  Created by lilonglong on 04/11/2016.
//  Copyright (c) 2016 lilonglong. All rights reserved.
//

#import "YTXViewController.h"
#import <YTXAnimations/UIView+YTXAnimation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface YTXViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (nonatomic, strong) NSArray *listDict;
@end

@implementation YTXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; 
}
#pragma mark - lazy init

- (NSArray *)listDict {
    if (!_listDict) {
        _listDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"list.plist" ofType:nil]];
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
    [self.animationView removeAnimation];
    SEL sel = NSSelectorFromString([self getValue:indexPath]);
    double time = 1.5;
    if (sel) { 
        objc_msgSend(self.animationView,sel, &time);
    }
}
@end
