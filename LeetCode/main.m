//
//  main.m
//  LeetCode
//
//  Created by delims on 2020/9/4.
//  Copyright © 2020 delims. All rights reserved.
//

#import <Foundation/Foundation.h>

//7. 整数反转
int reverse(int x){
    if (x == 0) return 0;
    bool negative = x < 0;
    int remainder = 0;
    int ret = 0;
    do {
        remainder = x % 10;
        x /= 10;
        if (negative) {
            if (((int)(1U<<31) - remainder) / 10 > ret) return 0;
        } else {
            if (((~0^(1U<<31))-remainder) / 10 < ret) return 0;
        }
        ret = ret * 10 + remainder;

    } while (x);
    return ret;
}

//6. Z 字形变换
char * convert(char * s, int numRows){
    int slen = (int)strlen(s);
    if (slen <= numRows || numRows <= 1) return s;
    char *ret = malloc(slen + 1);
    int index = 0;
    int i = 0,temp;
    do {
        ret[i++] = s[index];
        index += 2 * numRows - 2;
    } while (index < slen);
    index = 0;
    for (int row = 2; row < numRows ; row ++) {
        index = 0;
        do {
            temp = index - row + 1;
            if (temp >= 0 && temp < slen){
                ret[i++] = s[temp];
            }
            temp = index + row - 1;
            if (temp >= 0 && temp < slen){
                ret[i++] = s[temp];
            }
            index += 2 * numRows - 2;
        } while (index < slen + row + 1);
    }
    index = numRows - 1;
    do {
        ret[i++] = s[index];
        index += 2 * numRows - 2;
    } while (index < slen);
    
    ret[i] = 0;
    return ret;
}

int myAtoi(char * str){
    int ret = 0,temp = 0;
    bool positive = true,start = false;
    char ch = 0;
    for (int i = 0 ; i < strlen(str); i ++) {
        ch = str[i];
        if (ch == ' ') {
            if (start) return positive ? ret : -ret;
            continue;
        }
        if (ch == '-' || ch == '+') {
            if (start) return positive ? ret : -ret;
            start = true;
            if (ch == '-') positive = false;
        } else if (ch < '0' || ch > '9') {
            return positive ? ret : -ret;
        } else {
            start = true;
            temp = ch - '0';
            if (positive) {
                if ((0x7fffffff - temp) / 10 < ret) return 0x7fffffff;
                else {
                    if (0x7fffffff - ret * 10 <= temp) return 0x7fffffff;
                }
            } else {
                if (((int)0x80000000 + temp) / 10 > -ret) return 0x80000000;
                else {
                    if ((int)0x80000000 + ret * 10 >= -temp) return 0x80000000;
                }
            }

            ret = ret * 10 + temp;
        }
    }
    return positive ? ret : -ret;
}

//9. 回文数

bool isPalindrome(int x){
    
    return x == reverse(x);
    
}



int main(int argc, const char * argv[]) {
    
//    char *s = "LEETCODEISHIRING";
//    printf("%s \n",convert(s, 3));
    
//    int a = reverse(-12346436);
    
//    unsigned int a = 1;
//
//    a <<= 31;
//    a += 1;
    
        
    
//    printf("%i \n", myAtoi("0-1"));
//    printf("%i \n",((1<<31) )/10);
    
//    unsigned int b = 1U;
    
    return 0;
}
