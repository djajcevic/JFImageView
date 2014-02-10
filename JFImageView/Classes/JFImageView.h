//
// Created by Denis Jajčević on 10.02.2014..
// Copyright (c) 2014 JF. All rights reserved.
//

#import <Foundation/Foundation.h>


#define JFImageViewDownloadFinishedNotificationKey @"JFImageViewDownloadFinishedNotificationKey"

@interface JFImageView : UIView

@property(nonatomic, retain) UIImageView* imageView;


- (id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName andRequest:(NSURLRequest *)request;

- (void)reloadImage:(BOOL)clearCache;

- (void)reloadImage;
@end