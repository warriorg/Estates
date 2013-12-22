//
//  BaseHttp.m
//  myb-ios
//
//  Created by warrior gao on 13-6-7.
//  Copyright (c) 2013年 51myb. All rights reserved.
//

#import "BaseHttp.h"

@implementation BaseHttp

@synthesize connect = _connect, receiveData = _receiveData, delegate = _delegate, httpUrl = _httpUrl, identify = _identify;

- (id)initWithHttpUrl:(NSString *)url
{
    self = [self init];
    _httpUrl = [NSString stringWithFormat: @"%@%@",SERVER_URL, url];
    _identify = url;
    return self;
}

-(void)setHttpUrl:(NSString *)httpUrl
{
    _httpUrl = httpUrl;
    if(!(_identify))
        _identify = httpUrl;
}

//开始调用远程服务
- (void)execute
{
    [self execute:@""];
}


- (void)execute:(id)param
{
    if(IS_DEBUG) {
        NSLog(@"开始请求:%@", _httpUrl);
    }
    
    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:_httpUrl];
    //第二步，创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:DEFAULT_HTTP_TIMEOUT];
    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:HTTP_HEADER_VALUE forHTTPHeaderField:HTTP_HEADER_KEY];
    
    NSData *bodyData = nil;
    if([param isKindOfClass:[NSString class]]){
        bodyData = [param dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([param isKindOfClass:[NSData class]]){
        bodyData = param;
    } else if ([param isKindOfClass:[NSNumber class]]) {
        bodyData = [[param stringValue] dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    [request setHTTPBody:bodyData];
        
    //第三步，连接服务器
    
    _connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(_connect){
        _receiveData = [NSMutableData data];
    }
}

//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receiveData setLength:0];
    if([_delegate respondsToSelector:@selector(didReceiveResponse:identify:)])
        [_delegate didReceiveResponse:response identify:_identify];
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
    if([_delegate respondsToSelector:@selector(didReceiveData:identify:)])
        [_delegate didReceiveData:data identify:_identify];
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if(IS_DEBUG){
        NSLog(@"请求后台数据完成---:%@",_identify);
    }
    
    if(IS_DEBUG){
        NSString *receiveStr = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",receiveStr);
    }
    
    if([_delegate respondsToSelector:@selector(didFinishLoading:identify:)])
        [_delegate didFinishLoading:_receiveData identify:_identify];
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
- (void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    if(IS_DEBUG){
         NSLog(@"%@",[error localizedDescription]);
    }
   
    if([_delegate respondsToSelector:@selector(didFailWithError:identify:)])
        [_delegate didFailWithError:error identify:_identify];
    else {
        [AlertViewHelper alertMessage:HTTP_CONNECT_ERROR];
    }
}



@end
