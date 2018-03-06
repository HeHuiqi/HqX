//
//  HqInputCell.m
//  HqX
//
//  Created by macpro on 2018/3/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqInputCell.h"

@implementation HqInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    _keyLab = [[UILabel alloc] init];
    _keyLab.frame = CGRectMake(15, 15, 100, 20);
    [self addSubview:_keyLab];
    
    _valueTf = [[UITextField alloc] init];
    _valueTf.frame = CGRectMake(CGRectGetMaxX(_keyLab.frame), 20, 100, 20);
    [self addSubview:_valueTf];
    
}
- (void)setInputModel:(HqInputModel *)inputModel{
    _inputModel = inputModel;
    _keyLab.text = _inputModel.hqShowKey;
    _valueTf.text = _inputModel.hqShowValue;
    _valueTf.placeholder = _inputModel.hqPlaceHoder;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
