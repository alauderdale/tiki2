//
//  tikiDetailViewController.h
//  tiki
//
//  Created by Alex Lauderdale on 1/14/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface tikiDetailViewController : UIViewController;
@property (retain, nonatomic) IBOutlet UILabel *tikiNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *tikiPowerLabel;
@property (strong, nonatomic) NSString *tikiNameText;
@property (strong, nonatomic) NSString *tikiPowerText;

@end
