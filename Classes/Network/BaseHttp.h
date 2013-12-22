//
//  BaseHttp.h
//  myb-ios
//
//  Created by warrior gao on 13-6-7.
//  Copyright (c) 2013年 51myb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "AlertViewHelper.h"

@protocol HttpListenerDelegate;

@interface BaseHttp : NSObject
{
    NSURLConnection* _connect;
    NSMutableData* _receiveData;
    NSString *_httpUrl;
    NSString *_identify;
    __unsafe_unretained id<HttpListenerDelegate> _delegate;
}

@property (nonatomic, unsafe_unretained) id<HttpListenerDelegate> delegate;

@property (nonatomic, M_STRONG) NSURLConnection *connect;
@property (nonatomic, M_STRONG) NSMutableData *receiveData;

@property (nonatomic, M_STRONG) NSString *httpUrl;
//设置当前服务的唯一标示，默认为当前的URL
@property (nonatomic, M_STRONG) NSString *identify;

- (id)initWithHttpUrl:(NSString *)url;

//开始调用远程服务
- (void)execute;
- (void)execute:(id)param;
//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
//数据传完之后调用此方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
- (void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error;

@end


@protocol HttpListenerDelegate <NSObject>

@optional
//接收到服务器回应的时候调用此方法
- (void)didReceiveResponse:(NSURLResponse *)response identify:(NSString *)identify;

- (void)didReceiveData:(NSData *)data identify:(NSString *)identify;
//后台加载数据完成
- (void)didFinishLoading:(NSMutableData*)receiveData identify:(NSString *)identify;
//网络请求异常
- (void)didFailWithError:(NSError *)error identify:(NSString *)identify;

@end