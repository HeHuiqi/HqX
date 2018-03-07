//
//  HqInputModel.h
//  HqX
//
//  Created by macpro on 2018/3/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HqInputModel : NSObject

@property (nonatomic,copy) NSString *hqKey;//赋值的key为model的属性名称

@property (nonatomic,copy) NSString *hqPlaceHoder;//占位值

@property (nonatomic,copy) NSString *hqShowKey;//展示的key
@property (nonatomic,copy) NSString *hqShowValue;//展示的值

@property (nonatomic,assign) int hqInputLength;//输入字符数字

@property (nonatomic,assign) BOOL isReadOnly;//是否只读

@end
