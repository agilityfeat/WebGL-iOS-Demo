//
//  WappoGLViewController.h
//  Wappo
//
//  Created by Jean Lescure on 7/25/15.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "MyCube.h"

@interface WebGLViewController : UIViewController <WKScriptMessageHandler, WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) MyCube *myCube;

- (WebGLViewController *)initWithFrame:(CGRect)frameRect;

@end
