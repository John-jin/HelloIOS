//
//  TVCellTableViewCell.m
//  Demo
//
//  Created by jxn on 2017/1/6.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "TVCellTableViewCell.h"
@interface TVCellTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *label;


@end
@implementation TVCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(NSString *)str{
    [_label setText:str];
}
@end
