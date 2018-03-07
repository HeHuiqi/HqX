//
//  HqInputModel.m
//  HqX
//
//  Created by macpro on 2018/3/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqInputModel.h"

@implementation HqInputModel

+ (HqInputModel *)inputModelWithKey:(NSString *)key placehoder:(NSString *)placehoder showkey:(NSString *)showkey showValue:(NSString *)showValue inputLength:(int)inputLength readOnly:(BOOL)readOnly{
    HqInputModel *model = [[HqInputModel alloc] init];
    model.hqKey = key;
    model.hqPlaceHoder = placehoder;
    model.hqShowKey = showkey;
    model.hqShowValue = showValue;
    model.hqInputLength = inputLength;
    model.isReadOnly = readOnly;
    return model;
    
   
}
@end
