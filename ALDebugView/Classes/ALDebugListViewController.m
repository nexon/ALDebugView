//
//  ALDebugListViewController.m
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import "ALDebugListViewController.h"

@interface ALDebugListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) ALDebugListViewDataSource *localDataSource;

- (void) setupNavigationController;
- (void) closeDebugListViewController;
- (void) setupTableView;
@end

@implementation ALDebugListViewController

#pragma mark - Shared Instance

+ (instancetype)sharedDebugView {
    static ALDebugListViewController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
    });
    return sharedMyManager;
}

#pragma mark - Init

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        _mode = ALDDeploymentDebugMode;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationController];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.display = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup Navigation

- (void) setupNavigationController {
    if([self.delegate respondsToSelector:@selector(ALDebugViewTitleForDebugView:)]) {
        self.navigationItem.title = [[self delegate] ALDebugViewTitleForDebugView:self];
    }
    
    // Setup UIBarButtonItem
    
    UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self
                                                                       action:@selector(closeDebugListViewController)];
    
    self.navigationItem.rightBarButtonItem = closeButtonItem;
}


#pragma mark - Close Button

- (void) closeDebugListViewController {
    if([self.delegate respondsToSelector:@selector(ALDebugViewWillCloseView:)]) {
        [self.delegate ALDebugViewWillCloseView:self];
    }
    
    self.display = NO;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Setup TableView 

- (void)setupTableView {
    // Hack to avoid lines.
    self.tableView.tableFooterView = [UIView new];
    
    // Setup cell
    
    UINib *nibCell = [UINib nibWithNibName:@"ALDebugTableViewCell" bundle:[NSBundle bundleForClass:[self class]]];
    [self.tableView registerNib:nibCell forCellReuseIdentifier:[ALDebugTableViewCell reuseIdentifier]];
    
    self.localDataSource                  = [[ALDebugListViewDataSource alloc] initWithDataSource:self.datasource forViewController:self];
    
    self.tableView.dataSource             = self.localDataSource;
    self.tableView.delegate               = self.localDataSource;
    self.localDataSource.tableView        = self.tableView;
}

@end
