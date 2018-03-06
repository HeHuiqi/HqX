//
//  HqInputCell.h
//  HqX
//
//  Created by macpro on 2018/3/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+HqAutoLayout.h"
#import "HqInputModel.h"
@interface HqInputCell : UITableViewCell

@property (nonatomic,strong) UILabel *keyLab;
@property (nonatomic,strong) UITextField *valueTf;

@property (nonatomic,strong) HqInputModel *inputModel;

@end
