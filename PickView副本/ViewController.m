//
//  ViewController.m
//  PickView
//
//  Created by lanou3g on 16/6/22.
//  Copyright © 2016年 ZD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic, strong)NSArray *foodArray;
@property (strong, nonatomic) IBOutlet UILabel *fruits;
@property (strong, nonatomic) IBOutlet UILabel *food;
@property (strong, nonatomic) IBOutlet UILabel *drink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//懒加载
-(NSArray *)foodArray{
    if (_foodArray == nil) {
        NSString *foodPath = [[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil];
        _foodArray = [NSArray arrayWithContentsOfFile:foodPath];
        
    }
    return _foodArray;

}
#pragma mark-----UIPickerViewDataSource
//返回pickView一共有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.foodArray.count;

}
//每列有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //获取对应列的数组
    NSArray *subArray = self.foodArray[component];
    return subArray.count;
}
#pragma mark-----UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //获取每列的数组
    NSArray *subArray = self.foodArray[component];
    NSString *name = subArray[row];
return name;

}
//选中列号和行号是调用
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//获取对应下列对应列的值
    NSString *name = self.foodArray[component][row];
//    NSLog(@"%@", name);
    if (0 == component) {
        self.fruits.text = name;
    }else if(1 == component){
    
        self.food.text = name;
    
    }else{
    
        self.drink.text = name;
    }

}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
