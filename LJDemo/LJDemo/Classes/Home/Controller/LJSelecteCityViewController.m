//
//  LJSelecteCityViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/2.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJSelecteCityViewController.h"

static NSString * const LJHeaderId = @"header";

@interface LJSelecteCityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *citys;
@end

@implementation LJSelecteCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"选择城市";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
//    [self initNavigationBar];
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:LJHeaderId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar{
    
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 64)];
    [bar setBackgroundImage:[UIImage imageNamed:@"pjdk_butten_tijiao"] forBarMetrics:UIBarMetricsDefault];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"选择城市"];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [left setFrame:CGRectMake(0, 2, 28, 28)];
    [left setImage:[UIImage imageNamed:@"zhuche_back.png"] forState:UIControlStateNormal];
    
    [left addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:left];
    [item setLeftBarButtonItem:leftButton];
    [bar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:bar];
}


//
//#pragma mark - Private
///**
// *  自定义导航栏
// */
//- (void)initNavigationBar{
//    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 64)];
//    [bar setBackgroundImage:[UIImage imageNamed:@"pjdk_butten_tijiao"] forBarMetrics:UIBarMetricsDefault];
//    
//    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    cancelButton.frame = CGRectMake(LJScreenW - 56, 30, 40, 23);
//    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//    [cancelButton addTarget:self action:@selector(p_back) forControlEvents:UIControlEventTouchUpInside];
//    [bar addSubview:cancelButton];
//    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(8, 26.5, LJScreenW - 70, 31)];
//    view.backgroundColor = [UIColor colorWithRed:0.18 green:0.55 blue:0.34 alpha:1];
//    [bar addSubview:view];
//    
//    UIButton *choiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    choiceButton.frame = CGRectMake(5, 1, 60, 28);
//    choiceButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [choiceButton setTitle:@"二手房 ▾" forState:UIControlStateNormal];
//    [choiceButton addTarget:self action:@selector(p_choiceHouseMode) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:choiceButton];
//    
//    
//    [self.view addSubview:bar];
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        return self.citys.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@市",self.citys[indexPath.row]];
    }
    else {
        cell.textLabel.text = self.citys[indexPath.row];
    }

    return cell;
}

#pragma mark - UITableViewDelegate
/**
 *  自定义组头
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:LJHeaderId];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 11, 173, 21)];
    titleLabel.textColor = LJColor(0.67, 0.67, 0.67, 1);
    titleLabel.font = [UIFont systemFontOfSize:16];
    [header addSubview:titleLabel];
    
    // 覆盖文字
    if (section == 0) {
        titleLabel.text = @"当前定位的城市";
    } else {
        titleLabel.text = @"所有城市";
    }
    return header;
}

/**
 *  自定义组头高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

#pragma mark - Lazy
- (NSMutableArray *)citys {
    if (_citys == nil) {
        _citys = [[NSMutableArray alloc] init];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"LJCityDistrictInfo" ofType:@"plist"];
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
        for (int i = 0; i < array.count; ++i) {
            NSDictionary *dic = array[i];
            [_citys addObject:dic[@"name"]];
        }
    }
    return _citys;
}

@end
