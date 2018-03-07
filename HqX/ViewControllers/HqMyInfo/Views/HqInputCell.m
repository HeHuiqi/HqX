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
    [self addSubview:_keyLab];
    
    _valueTf = [[UITextField alloc] init];
    _valueTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    _valueTf.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:UITextFieldTextDidChangeNotification object:_valueTf];
    [self addSubview:_valueTf];
    
}
- (void)layoutSubviews{
    
    CGFloat selfHeight = self.bounds.size.height;
    _keyLab.frame = CGRectMake(15, (selfHeight - 20)/2.0, 100, 20);
    _valueTf.frame = CGRectMake(CGRectGetMaxX(_keyLab.frame), (selfHeight - 20)/2.0, 150, 20);

    [super layoutSubviews];
}
- (void)setInputModel:(HqInputModel *)inputModel{
    _inputModel = inputModel;
    _keyLab.text = _inputModel.hqShowKey;
    _valueTf.text = _inputModel.hqShowValue;
    _valueTf.placeholder = _inputModel.hqPlaceHoder;
    _valueTf.userInteractionEnabled = !_inputModel.isReadOnly;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.inputModel.hqShowValue = textField.text;
}

#pragma mark - Notification Method
-(void)textFieldEditChanged:(NSNotification *)obj
{
    if (self.inputModel.hqInputLength>0) {
        UITextField *textField = (UITextField *)obj.object;
        NSString *toBeString = textField.text;
        
        //获取高亮部分
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position || !selectedRange)
        {
            if (toBeString.length > self.inputModel.hqInputLength)
            {
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.inputModel.hqInputLength];
                if (rangeIndex.length == 1)
                {
                    textField.text = [toBeString substringToIndex:self.inputModel.hqInputLength];
                }
                else
                {
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.inputModel.hqInputLength)];
                    textField.text = [toBeString substringWithRange:rangeRange];
                }
            }
        }
    }
   
}



@end
