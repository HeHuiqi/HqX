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

@property (nonatomic,strong) NSMutableDictionary *dataDics;

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
    name.hqInputLength = 4;
    
    HqInputModel *nickname = [[HqInputModel alloc] init];
    nickname.hqKey = @"nickname";
    nickname.hqShowKey = @"昵称";
    nickname.hqPlaceHoder = @"请入昵称";
    
    HqInputModel *age = [[HqInputModel alloc] init];
    age.hqKey = @"age";
    age.hqShowKey = @"年龄";
    age.hqPlaceHoder = @"请入年龄";
    age.hqShowValue = @"20";
    age.hqInputLength = 3;
    
    HqInputModel *idNum = [[HqInputModel alloc] init];
    idNum.hqKey = @"idNum";
    idNum.hqShowKey = @"证件号吗";
    idNum.hqPlaceHoder = @"请入证件号码";
    idNum.hqShowValue = @"12345";
    idNum.hqInputLength = 18;
    idNum.isReadOnly = YES;
    
    HqInputModel *mobile = [[HqInputModel alloc] init];
    mobile.hqKey = @"mobile";
    mobile.hqShowKey = @"手机号";
    mobile.hqPlaceHoder = @"请入手机号";
    
    HqInputModel *degree = HqInputModel(@"degree", @"请入学历", @"学历", nil, 0, NO);
    
    HqInputModel *address = [[HqInputModel alloc] init];
    address.hqKey = @"address";
    address.hqShowKey = @"地址";
    address.hqPlaceHoder = @"请入地址";
    
    self.datas = @[name,nickname,age,idNum,mobile,degree,address];

    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    [dataDic hqSetObjectValue:name forKey:name.hqKey];
    [dataDic hqSetObjectValue:nickname forKey:nickname.hqKey];
    [dataDic hqSetObjectValue:age forKey:age.hqKey];
    [dataDic hqSetObjectValue:idNum forKey:idNum.hqKey];
    [dataDic hqSetObjectValue:mobile forKey:mobile.hqKey];
    [dataDic hqSetObjectValue:degree forKey:degree.hqKey];
    [dataDic hqSetObjectValue:address forKey:address.hqKey];
    self.dataDics = dataDic;
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
//    return self.datas.count;
    return self.dataDics.count;

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
//    cell.inputModel = _datas[indexPath.row];
    cell.inputModel = [_dataDics hqGetValueWithIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backClick{
    [self.view endEditing:YES];

    HqInputModel *model = self.datas[0];
    NSLog(@"model.value==%@",model.hqShowValue);
    [super backClick];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
