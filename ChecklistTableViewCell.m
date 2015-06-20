//
//  ChecklistTableViewCell.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 3/14/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "ChecklistTableViewCell.h"

@implementation ChecklistTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSLog(@"whatup");
        // Initialization code
    }
    //self.tickbox = [[Checkbox alloc] init];
    [self.tickbox setImages];
    return self;
}
- (IBAction)tick:(Checkbox *)sender {
   /* if (self.tickbox.selected){
        [self.tickbox setSelected:NO];
    }
    else [self.tickbox setSelected:YES];
    //[self setImages];
    NSLog(@"eai bitches");*/
}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImages{
    [self.tickbox setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateHighlighted];
    [self.tickbox setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
    [self.tickbox setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    self.tickbox.adjustsImageWhenHighlighted=YES;
    
}

-(void)buttonTouched{
    
}

@end
