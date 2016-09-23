//
//  ViewController.m
//  UIImageView_02_TomCat
//
//  Created by yaoln on 16/9/23.
//  Copyright © 2016年 zhangze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


- (IBAction)playClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *Function ：点击播放动画
 *Parameter：
 *Return   ：
 *From     ：
 *Version  ：
 */
- (IBAction)playClick:(id)sender {
    NSMutableArray *imageArray = [NSMutableArray array];
    
    for (int i = 0; i < 9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"poke_belly_right_%d.jpg",i];
        NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"/Tom/%@.jpg",imageName]];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [imageArray addObject:image];
    }
    //设置帧动画变化所需要的图片资源集合
    [self.imageView setAnimationImages:imageArray];
    //设置动画持续时间
    [self.imageView setAnimationDuration:self.imageView.animationImages.count * 0.1];
    //设置动画的运动次数
    [self.imageView setAnimationRepeatCount:1];
    //启动动画
    [self.imageView startAnimating];
    
    //在执行完之后进行一次内存的释放
    [self performSelector:@selector(removeImage) withObject:nil afterDelay:self.imageView.animationImages.count * 0.1+1];
}


- (void)removeImage
{
    //释放图片的内存空间
    self.imageView.animationImages = nil;
}
@end
