//
//  Checkbox.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/24/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "Checkbox.h"

@implementation Checkbox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImages];
    }
    return self;
}


-(id) init{
    self = [super init];
    if (self){
        [self setImages];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
