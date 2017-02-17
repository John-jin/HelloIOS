//
//  PickerViewController.m
//  Demo
//
//  Created by jinxinnan on 2017/2/14.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIDatePicker *myDataPicker;

@property (weak, nonatomic) IBOutlet UIPickerView *myPicker;

@property(nonatomic,strong) NSArray *array;
@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *data = [[NSDate alloc] initWithTimeIntervalSinceNow:1];
    [_myDataPicker setDate:data];
    //设置本地化支持的语言（在此是中文)
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    [_myDataPicker setLocale:locale];
    //显示方式是只显示年月日
    _myDataPicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    
    self.array = @[@"first",@"second",@"third",@"fourth",@"fifth"];
    self.myPicker.delegate = self;
    self.myPicker.dataSource = self;
    
    
    
}
#pragma 下面四个代理是UIPickerView 的实现方法和选中事件
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.array.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.array[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%@",self.array[row]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)dataPickerChanged:(id)sender {
    //东8区 加上8小时
    NSDate *date = [_myDataPicker.date dateByAddingTimeInterval:8 * 60 * 60];
    NSLog(@"%@",date);
}

@end
