//
//  HqMyInfoVC.m
//  HqX
//
//  Created by macpro on 2018/2/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqMyInfoVC.h"
#import "HqInputCell.h"

@interface HqMyInfoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *datas;

@end

@implementation HqMyInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.view.backgroundColor = [UIColor purpleColor];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = left;
    [self initView];
    self.title = @"MyInfo";
    self.leftBtnImageName = @"back";

}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initData{
    HqInputModel *name = [[HqInputModel alloc] init];
    name.hqKey = @"name";
    name.hqShowKey = @"姓名";
    name.hqPlaceHoder = @"请入姓名";
    name.hqShowValue = @"小明";
    
    HqInputModel *age = [[HqInputModel alloc] init];
    age.hqKey = @"age";
    age.hqShowKey = @"年龄";
    name.hqPlaceHoder = @"请入年龄";
    age.hqShowValue = @"20";
    
    self.datas = @[name,age];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _tableView.frame = CGRectMake(0,self.navBarheight,self.view.bounds.size.width, self.view.bounds.size.height-self.navBarheight);
}
- (void)initView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,self.navBarheight,self.view.bounds.size.width, self.view.bounds.size.height-self.navBarheight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentfier = @"cell";
    HqInputCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentfier];
    if (!cell) {
        cell = [[HqInputCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentfier];
    }
    cell.inputModel = _datas[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
