//
//  ViewController.m
//  WebGLDemo
//
//  Created by Jean Lescure on 8/5/15.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    self.webGLView = [[WebGLViewController alloc] initWithFrame:self.glContainer.frame];
    [self.glContainer addSubview:self.webGLView.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
