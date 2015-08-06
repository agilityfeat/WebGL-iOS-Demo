//
//  ViewController.h
//  WebGLDemo
//
//  Created by Jean Lescure on 8/5/15.
//
//

#import <UIKit/UIKit.h>
#import "WebGLViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *glContainer;
@property (strong, nonatomic) WebGLViewController *webGLView;

@end

