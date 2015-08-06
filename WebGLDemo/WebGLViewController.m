//
//  WappoGLViewController.m
//  Wappo
//
//  Created by Jean Lescure on 7/25/15.
//

#import "WebGLViewController.h"

@interface WebGLViewController ()

@end

@implementation WebGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (WebGLViewController *)initWithFrame:(CGRect)frameRect {
    self = [super init];
    self.view.frame = CGRectMake(0.0f, 0.0f, frameRect.size.width, frameRect.size.height);
    
    self.myCube = [[MyCube alloc] init];
    
    NSString *path = [NSString stringWithFormat:@"%@.%@", @"com.example", @"index.html"];
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:path]];
    
    NSData *data = [self.myCube.moduleString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    [data writeToURL:url options:NSDataWritingAtomic error:&error];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    WKWebViewConfiguration *glConfig = [[WKWebViewConfiguration alloc] init];
    [glConfig.userContentController addScriptMessageHandler:self name:@"interOp"];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frameRect.size.width, frameRect.size.height) configuration:glConfig];
    self.webView.navigationDelegate = self;
    
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    return self;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"Finished Loading");
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSDictionary *sentData = (NSDictionary*)message.body;
    
    if ([sentData[@"action"]  isEqual: @"log"]) {
        NSLog(@"GL MSG: %@",sentData[@"string"]);
    }
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

@end
