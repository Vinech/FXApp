//
//  MarketViewController.h
//  iChart
//
//  Created by bin huang on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"
#import "data.h"
#import "SFHFKeychainUtils.h"
@interface MarketViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,GCDAsyncSocketDelegate,UIScrollViewDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UITextFieldDelegate>{
    UIActionSheet *actionsheet_setup;
    UITableView *mytableview_productname;//左边的tableview,只用于展示产品的名字
    UITableView *mytableview_productdetail;//右边的用于展示字段
    NSString *string_yanse;//用老接收高亮或者黑暗
    NSString *string_color;//用来判断高亮或者黑暗
    UIScrollView *scrowview_cellsc;
    int count;//用于计算获取数据的次数
    GCDAsyncSocket *socket1;
    GCDAsyncSocket *socket_zhuce;
    GCDAsyncSocket *socket_denglu;
    UILabel *label_productname;//用于存放产品的名字
    // int biaozhiwei;
    // UILabel * label ;
    UIAlertView *alertview_denglu;
    UIAlertView *alertview_zhuce;
    //注册弹框里面的东西
    UIScrollView *scro_zhuce;
    UITextField *texfield_zhuceusername;
    UITextField *textfield_zhucemin;
    UITextField *textfield_zhuceqmin;
    UITextField *textfileld_zhuceemail;
    UITextField *textfield_zhucephonenumber;
    //登陆弹框里面的东西
    UITextField *textfield_dengluusername;
    UITextField *textfield_denglumin;
 UIAlertView *alertviewdenglujieguo;
    UIAlertView *alertviewzhucejieguo;
}
@property(strong,nonatomic) NSString *stringhost;
@property(strong,nonatomic) NSString *stringport;
@property (nonatomic,assign)int signin;

@property(strong,nonatomic) NSString *sessionid;
@property(strong,nonatomic) NSString *captchas;


@property(assign,nonatomic) int biaozhiwei;//判断当前是什么类型的产品

@end
