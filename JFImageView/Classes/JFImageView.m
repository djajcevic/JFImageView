//
// Created by Denis Jajčević on 10.02.2014..
// Copyright (c) 2014 JF. All rights reserved.
//

#import "JFImageView.h"
#import "JFDownload.h"


@interface JFImageView ()
@property(nonatomic, strong) NSURLRequest *request;
@property(nonatomic, copy) NSString *imageName;
@end

@implementation JFImageView {

}

- (id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName andRequest:(NSURLRequest *)request
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:(CGRect){{0,0}, frame.size}];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        self.imageName = imageName;
        self.request = request;

        [self setupObserver];
//        [self reloadImage];
    }

    return self;
}

- (void)reloadImage:(BOOL) clearCache
{
    if (clearCache) {
        [[NSURLCache sharedURLCache] removeCachedResponseForRequest:self.request];
    }
    [self reloadImage];
}

- (void)reloadImage
{
    JFDownload *jfDownload = [[JFDownload performRequest:self.request withSuccessBlock:^(JFDownload *download) {
        NSLog(@"Image downloaded [%d]", download.image != nil);
        [[NSNotificationCenter defaultCenter] postNotificationName:JFImageViewDownloadFinishedNotificationKey object:download.image userInfo:download.userInfo];
    } andFailedBlock:^(JFDownload *download) {
        NSLog(@"%@", download.error);
    }] setResultOnMainThread];
    [jfDownload setUserInfo:@{@"imageName" : self.imageName}];
    [jfDownload startAsync];
}

- (void)setupObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imageDownloadFinished:) name:JFImageViewDownloadFinishedNotificationKey object:nil];
}

- (void)imageDownloadFinished:(NSNotification *)notification
{
    if ([notification.userInfo[@"imageName"] isEqualToString:self.imageName]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"received %@ image", self.imageName);
            self.imageView.image = notification.object;
        });
    }
}

@end