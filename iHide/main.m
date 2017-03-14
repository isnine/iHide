//
//  main.m
//  iHide
//
//  Created by nine on 2017/3/14.
//  Copyright © 2017年 nine. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    system("defaults read com.apple.finder AppleShowAllFiles > /tmp/visible.tmp");
    FILE *f = fopen("/tmp/visible.tmp", "r");
    if (f != NULL) {
        int i;
        fscanf(f, "%d", &i);
        if (i == 0) {
            system("defaults write com.apple.finder AppleShowAllFiles -bool true");
        } else {
            system("defaults write com.apple.finder AppleShowAllFiles -bool false");
        }
        system("killall Finder");
        fclose(f);
        system("rm /tmp/visible.tmp");
    }
    exit(0);
    return NSApplicationMain(argc, argv);
}
