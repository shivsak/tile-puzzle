//
//  ViewController.h
//  SlideGame
//
//  Created by Shiv Sakhuja on 25/05/14.
//  Copyright (c) 2014 Shiv Sakhuja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {

    IBOutlet UIView *PuzzleView;
    
    IBOutlet UIView *view1;
    IBOutlet UIView *view2;
    IBOutlet UIView *view3;
    IBOutlet UIView *view4;

    IBOutlet UIView *view5;
    IBOutlet UIView *view6;
    IBOutlet UIView *view7;
    IBOutlet UIView *view8;
    
    IBOutlet UIView *view9;
    IBOutlet UIView *view10;
    IBOutlet UIView *view11;
    IBOutlet UIView *view12;
    
    IBOutlet UIView *view13;
    IBOutlet UIView *view14;
    IBOutlet UIView *view15;
    IBOutlet UIView *view16;
    
    IBOutlet UIView *viewBlankYellow;
    
    
    IBOutlet UIImageView *puzzleImageView11;
    IBOutlet UIImageView *puzzleImageView12;
    IBOutlet UIImageView *puzzleImageView13;
    IBOutlet UIImageView *puzzleImageView14;
    
    IBOutlet UIImageView *puzzleImageView21;
    IBOutlet UIImageView *puzzleImageView22;
    IBOutlet UIImageView *puzzleImageView23;
    IBOutlet UIImageView *puzzleImageView24;
    
    IBOutlet UIImageView *puzzleImageView31;
    IBOutlet UIImageView *puzzleImageView32;
    IBOutlet UIImageView *puzzleImageView33;
    IBOutlet UIImageView *puzzleImageView34;
    
    IBOutlet UIImageView *puzzleImageView41;
    IBOutlet UIImageView *puzzleImageView42;
    IBOutlet UIImageView *puzzleImageView43;
    IBOutlet UIImageView *puzzleImageView44;
    
    IBOutlet UIImageView *puzzleImageViewBlankYellow;
    
    IBOutlet UILabel *movesLabel;
    
    IBOutlet UIView *templatesView;
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

-(IBAction)assignPieces:(id)sender;
-(IBAction)pieceTouched:(id)sender;

-(IBAction)shuffle:(id)sender;

-(IBAction)showTemplates:(id)sender;
-(IBAction)templateChosen:(id)sender;

@end
