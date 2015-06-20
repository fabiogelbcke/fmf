//
//  Checkbox.h
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/24/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Checkbox : UIButton
-(void)setImages;
-(void)buttonTouched;
@property (strong, nonatomic) NSIndexPath *cellPath;
@end
