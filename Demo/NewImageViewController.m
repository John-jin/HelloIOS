//
//  NewImageViewController.m
//  Demo
//
//  Created by jxn on 2017/1/6.
//  Copyright © 2017年 jxn. All rights reserved.
//

#import "NewImageViewController.h"
#import "ImageTools.h"


@interface NewImageViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) UIImagePickerController *imageViewCv;
@end

@implementation NewImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"head.jpg"];
    
    [_iv setImage:[ImageTools toRoundImage:image]];
    
    [_iv setUserInteractionEnabled:YES];
    UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleClick)];
   
    click.numberOfTapsRequired = 1;//点击次数
    click.numberOfTouchesRequired = 1;//手指数
    [_iv addGestureRecognizer:click];
}
-(void)singleClick{
    NSLog(@"图片点击");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *editImage = info[@"UIImagePickerControllerEditedImage"];
    [_iv setImage:editImage];
    [_imageViewCv dismissViewControllerAnimated:YES completion:nil];
    _imageViewCv = nil;
}
- (IBAction)selectPhoto:(id)sender {
    UIAlertController *alertCv = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *chooseAction = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self choosePhoto];
    }];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhoto];
    }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertCv addAction:chooseAction];
    [alertCv addAction:takePhoto];
    [alertCv addAction:cancle];
    [self presentViewController:alertCv animated:YES completion:nil];
}
-(void) takePhoto{
        NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    if(self.imageViewCv == nil){
        self.imageViewCv = [[UIImagePickerController alloc] init];
    }
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        _imageViewCv.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imageViewCv.mediaTypes = @[mediaTypes[0]];
        //设置相机模式
        _imageViewCv.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //设置摄像头  前置后置
        _imageViewCv.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        //设置闪光灯
        _imageViewCv.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
        [self presentViewController:_imageViewCv animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"你的设备不支持" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
-(void) choosePhoto{
    if(self.imageViewCv == nil){
        self.imageViewCv = [[UIImagePickerController alloc] init];
    }
    _imageViewCv.delegate = self;
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        //设置图片拾取器的sourceType
        _imageViewCv.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //设置支持的媒体格式
        _imageViewCv.mediaTypes = @[mediaTypes[0]];
        //其他设置 是否允许编辑
        _imageViewCv.allowsEditing = YES;
        [self presentViewController:_imageViewCv animated:YES completion:nil];
    }
}
@end
