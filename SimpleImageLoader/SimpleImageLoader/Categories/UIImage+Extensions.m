//
//  UIImage+Extensions.m
//  SimpleImageLoader
//
//  Created by Mladen Despotovic on 26/11/14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)

- (UIImage*)scaleToSizeOfView:(UIView*)paramView
{
    CGFloat widthRatio = self.size.width / paramView.bounds.size.width;
    CGFloat heightRatio = self.size.height / paramView.bounds.size.height;
    
    if (widthRatio > 1 && widthRatio > heightRatio) {
        
        CGSize newSize = CGSizeMake(paramView.bounds.size.width, self.size.height / widthRatio);
        return [self scaleToSize:newSize];
    }
    else if (heightRatio > 1 && heightRatio > widthRatio ) {
        
        CGSize newSize = CGSizeMake(self.size.width / heightRatio, paramView.bounds.size.height);
        return [self scaleToSize:newSize];
    }
    else {
        
        return self;
    }
}

- (UIImage*)scaleToSize:(CGSize)newSize
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        
        if ([[UIScreen mainScreen] scale] == 2.0) {
            
            UIGraphicsBeginImageContextWithOptions(newSize, YES, 2.0);
        } else {
            
            UIGraphicsBeginImageContext(newSize);
        }
    } else {
        
        UIGraphicsBeginImageContext(newSize);
    }
    
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
