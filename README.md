#XJNumButton

#功能
一种可以显示编号的按钮，分为选中和未选中状态，可根据背景图片判断出来。

**导入**

	#import "XJNumButton.h"
**代理**

	@interface <#YourDemo#> ()<XJNumButtonDelegate>
**应用**

	NSInteger row;
    NSInteger collum;
    
    CGFloat widthOfButton = 70;
    CGFloat heightOfButton = 30;
    for (int i = 0; i < 10; i++) {
        
        row = i / 3;
        collum = i % 3;
        
        XJNumButton *button = [XJNumButton buttonWithNumber:i+1 
        withString:[NSString stringWithFormat:@"%.3d",i+100]];
        
        button.frame = CGRectMake((12 + widthOfButton) * collum + 
        100, (6+ heightOfButton) * row + 200, widthOfButton, 
        heightOfButton);
        
        [self.view addSubview:button];
        
    }
**若想调用按钮点击方法，可**

	//设置代理
	button.delegate = self;
	//设置区分
    button.tag = i + 100;
**代理方法**

	- (void)buttonResponseMethod:(XJNumButton *)button {
    	NSLog(@" 这是按钮tag值 %ld",button.tag);
	}
