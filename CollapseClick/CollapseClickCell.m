//
//  CollapseClickCell.m
//  CollapseClick
//
//  Created by Ben Gordon on 2/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "CollapseClickCell.h"

@implementation CollapseClickCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    if(self.arrowImageName)
        self.TitleArrow.hidden = YES;
}

+ (CollapseClickCell *)newCollapseClickCellWithTitle:(NSString *)title index:(int)index content:(UIView *)content {
    NSString *nibName = @"CollapseClickCell";

    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        nibName = @"CollapseClickCell_iPad";

    NSArray* views = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    CollapseClickCell *cell; // = [[CollapseClickCell alloc] initWithFrame:CGRectMake(0, 0, 320, kCCHeaderHeight)];
    cell = [views objectAtIndex:0];

    // Initialization Here
    cell.TitleLabel.text = title;
    cell.index = index;
    cell.TitleButton.tag = index;

    CGRect newFrame = CGRectMake(cell.ContentView.frame.origin.x, cell.ContentView.frame.origin.y, cell.ContentView.frame.size.width, content.frame.size.height);
    if([title isEqualToString:@""]){
        cell.TitleView.hidden = YES;
        newFrame = CGRectMake(cell.ContentView.frame.origin.x, cell.ContentView.frame.origin.y - cell.TitleView.frame.size.height, cell.ContentView.frame.size.width, cell.ContentView.frame.size.height);
        content.frame = CGRectMake(content.frame.origin.x, content.frame.origin.y - cell.TitleView.frame.size.height, content.frame.size.width, content.frame.size.height);
    }else{
        cell.TitleView.hidden = NO;
    }
    cell.ContentView.frame = newFrame;
    [cell.ContentView addSubview:content];
    
    return cell;
}



@end
