//
//  LJBannerCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/28.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJBannerCell.h"

//定义轮播图片的个数
#define image_count 3

@interface LJBannerCell ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation LJBannerCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"BannerCell";
    UINib *nib = [UINib nibWithNibName:@"LJBannerCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJBannerCell *cell = [[LJBannerCell alloc] init];
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initScrollView];
}

- (void)initScrollView {
    //1 创建imageView
    CGFloat imgW = [UIScreen mainScreen].bounds.size.width;
    CGFloat imgH = self.scrollView.frame.size.height;
    
    for (int i = 0;i < image_count;i++){
//        NSString *imgName = [NSString stringWithFormat:@"%02d",i+1];
        UIImage *img = [UIImage imageNamed:@"default-banner"];
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        [self.scrollView addSubview:imgView];
        
        CGFloat imgY = 0;
        CGFloat imgX = i * imgW + imgW;
        imgView.frame = CGRectMake(imgX, imgY, imgW, imgH);
        
        [self.images addObject:img];
    }
    
    //为了无限循环  头和尾都增加一个imageView
    
    //把第一张图片 ,添加到最后
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.images[0]];
    [self.scrollView addSubview:imgView];
    imgView.frame = CGRectMake(imgW * (image_count+1), 0, imgW, imgH);
    //把最后一张图片,添加到最前面
    imgView = [[UIImageView alloc] initWithImage:self.images[self.images.count - 1]];
    [self.scrollView addSubview:imgView];
    imgView.frame = CGRectMake(0, 0, imgW, imgH);
    
    //滚动到第一张图片
    self.scrollView.contentOffset = CGPointMake(imgW, 0);
    
    //2 设置scrollView可以滚动
    self.scrollView.contentSize = CGSizeMake(imgW * (image_count+2), 0);
    
    //3 分页控件
    self.scrollView.pagingEnabled = YES;
    //去掉滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //设置总共多少页
    self.pageControl.numberOfPages = image_count;
    //设置代理
    self.scrollView.delegate = self;
    
    //4 定时器,自动滚动    当时间间隔到达才会执行
    NSTimer *timer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    self.timer = timer;
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage {
    NSInteger currentPage = self.pageControl.currentPage;
    currentPage++;
    currentPage = currentPage > self.pageControl.numberOfPages ? 0 :currentPage;
    
    [self.scrollView setContentOffset:CGPointMake((currentPage+1)*self.scrollView.frame.size.width, 0) animated:YES];
}

#pragma mark - scrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算当前是第几页
    //    //   (10  + 50) / 100
    //    int page = (scrollView.contentOffset.x + scrollView.frame.size.width/2) / scrollView.frame.size.width;
    
    //  100 + 10 - 50/ 100
    int page = (scrollView.contentOffset.x - scrollView.frame.size.width/2) / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //开始拖拽,停止定时器
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //结束拖拽 重新开启定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    self.timer = timer;
    //    extern NSString* const  NSDefaultRunLoopMode ;
    //    extern NSString* const  NSRunLoopCommonModes;
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
}

//非手指动画停止的时候
//当停止动画,如果此时 在最后一张(显示的是第一张图片)  偷换
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    int page = self.scrollView.contentOffset.x/scrollView.frame.size.width;
    if (page == 0) {
        //如果是0  偷换到最后一张图片的位置
        scrollView.contentOffset = CGPointMake(self.pageControl.numberOfPages*scrollView.frame.size.width, 0);
    }else if(page == self.pageControl.numberOfPages+1){
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
}

//手指拖动,滚动停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = self.scrollView.contentOffset.x/scrollView.frame.size.width;
    if (page == 0) {
        //如果是0  偷换到最后一张图片的位置
        scrollView.contentOffset = CGPointMake(self.pageControl.numberOfPages*scrollView.frame.size.width, 0);
    }else if(page == self.pageControl.numberOfPages+1){
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
}

- (NSMutableArray *)images{
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    return _images;
}


@end
