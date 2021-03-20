/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P1;

import java.util.Scanner;

/**
 *
 * @author Lenovo
 */
public class Q2 {
    public static void main(String Args[]){
        String s;
        Scanner t = new Scanner(System.in);
        System.out.println("Enter String");
        s = t.next();
        char c[]= s.toCharArray();
        int n= c.length;
        char rev[]= new char[n];
        for(int i=0;i<c.length;i++)
        {
            rev[n-1]=c[i];
            n=n-1;
        }
        System.out.println(rev);
        
    }
}
