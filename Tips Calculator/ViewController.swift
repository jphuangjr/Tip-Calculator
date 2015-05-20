//
//  ViewController.swift
//  Tips Calculator
//
//  Created by Joshua Huang on 5/3/15.
//  Copyright (c) 2015 Joshua Huang. All rights reserved.
//

import UIKit

var display = 0.00;
var decimal = 0;
var decimal_value = 0.00;
var first_time = 1
var ten = 10;
var fifteen = 15;
var twenty = 20;

var ten_tip_val = ((display + decimal_value) * Double(ten))/100
var fifteen_tip_val = ((display + decimal_value) * Double(fifteen))/100
var twenty_tip_val = ((display + decimal_value) * Double(twenty))/100

var ten_total_val = ten_tip_val+display+decimal_value
var fifteen_total_val = fifteen_tip_val+display+decimal_value
var twenty_total_val = twenty_tip_val+display+decimal_value

var groupsize = 1


class ViewController: UIViewController {
    
    @IBOutlet weak var ten_total: UILabel!
    @IBOutlet weak var fifteen_total: UILabel!
    @IBOutlet weak var twenty_total: UILabel!
    
    
    @IBOutlet weak var ten_tips: UILabel!
    @IBOutlet weak var fifteen_tip: UILabel!
    @IBOutlet weak var twenty_tips: UILabel!
    
    
    @IBOutlet weak var twenty_percent_label: UILabel!
    @IBOutlet weak var ten_percent_label: UILabel!
    @IBOutlet weak var fifteen_percent_label: UILabel!
   
    @IBAction func tipslider(sender: UISlider) {
        ten = Int(sender.value)
        fifteen = Int(sender.value) + 5
        twenty = Int(sender.value) + 10
                
        reload()
    }
    
    @IBOutlet weak var group_size_slider_label: UILabel!
    @IBAction func groupsize_slider(sender: UISlider) {
        
        ten_tip_val = (((display + decimal_value) * Double(ten))/100)/Double(groupsize)
        fifteen_tip_val = (((display + decimal_value) * Double(fifteen))/100)/Double(groupsize)
        twenty_tip_val = (((display + decimal_value) * Double(twenty))/100)/Double(groupsize)
        
        ten_total_val = (ten_tip_val+display+decimal_value)/Double(groupsize)
        fifteen_total_val = (fifteen_tip_val+display+decimal_value)/Double(groupsize)
        twenty_total_val = (twenty_tip_val+display+decimal_value)/Double(groupsize)
        
        groupsize = Int(sender.value)
        group_size_slider_label.text = "Group Size: \(groupsize)"
        
        reload()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalBill.text = "$\(display+decimal_value)";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload(){
        
        ten_tip_val = Double(round(100*(((display + decimal_value) * Double(ten))/100)/Double(groupsize))/100)
        fifteen_tip_val = Double(round(100*(((display + decimal_value) * Double(fifteen))/100)/Double(groupsize))/100)
        twenty_tip_val = Double(round(100*(((display + decimal_value) * Double(twenty))/100)/Double(groupsize))/100)
        
        ten_total_val = Double(round(100*(ten_tip_val+display+decimal_value)/Double(groupsize))/100)
        fifteen_total_val = Double(round(100*(fifteen_tip_val+display+decimal_value)/Double(groupsize))/100)
        twenty_total_val = Double(round(100*(twenty_tip_val+display+decimal_value)/Double(groupsize))/100)
        
        
        totalBill.text = "$\(display+decimal_value)"
        
        ten_total.text = "$\(ten_total_val)"
        fifteen_total.text = "$\(fifteen_total_val)"
        twenty_total.text = "$\(twenty_total_val)"
        
        ten_tips.text = "$\(ten_tip_val)"
        fifteen_tip.text = "$\(fifteen_tip_val)"
        twenty_tips.text = "$\(twenty_tip_val)"
        
        ten_percent_label.text = "\(ten)%"
        twenty_percent_label.text = "\(fifteen)%"
        fifteen_percent_label.text = "\(twenty)%"
        
                
    }

    @IBOutlet weak var totalBill: UILabel!
    
    
    
    @IBAction func numberPad(sender: UIButton) {
        
        if sender.tag == 11 && decimal == 0{
            decimal = 1;
        }
        if display == 0{
            if sender.tag == 1{
                display = 1;
                reload()
            }
            else if sender.tag == 2{
                display = 2.0;
                reload()
            }
            else if sender.tag == 3{
                display = 3.0;
                reload()
            }
            else if sender.tag == 4{
                display = 4.0;
                reload()
            }
            else if sender.tag == 5{
                display = 5.0;
                reload()
            }
            else if sender.tag == 6{
                display = 6.0;
                reload()
            }
            else if sender.tag == 7{
                display = 7.0;
                reload()
            }
            else if sender.tag == 8{
                display = 8.0;
                reload()
            }
            else if sender.tag == 9{
                display = 9.0;
                reload()
            }
            else if sender.tag == 10{
                display = 0.00;
                reload()
            }
        }
        else if sender.tag != 11{
            if sender.tag == 1{
                println(decimal_value)
                println(display)
                if decimal == 0{
                    display = (display * 10.0) + 1.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value += (1/10);
                    first_time++
                    reload()
                }
                else {
                    decimal_value += 1/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 2{
                if decimal == 0{
                    display = (display * 10.0)+2.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (2/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 2/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 3{
                if decimal == 0 {
                    display = (display * 10.0)+3.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (3/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 3/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 4 {
                if decimal == 0 {
                    display = (display * 10.0)+4.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (4/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 4/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 5{
                if decimal == 0 {
                    display = (display * 10.0)+5.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (5/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 5/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 6{
                if decimal == 0 {
                    display = (display * 10.0)+6.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (6/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 6/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 7{
                if decimal == 0 {
                    display = (display * 10.0)+7.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (7/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 7/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 8{
                if decimal == 0 {
                    display = (display * 10.0)+8.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (8/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 8/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 9{
                if decimal == 0 {
                    display = (display * 10.0)+9.0;
                    reload()
                }
                else if first_time == 1 {
                    decimal_value = decimal_value + (9/10);
                    first_time++
                    reload()
                }
                else{
                    decimal_value = decimal_value + 9/(pow(10, Double(first_time)))
                    first_time++
                    reload()
                }
            }
            else if sender.tag == 10{
                if decimal == 0 {
                    display *= 10.0;
                    reload()
                }
                
            }
            else if sender.tag == 12{
                display = 0.00
                decimal = 0;
                first_time = 1
                decimal_value = 0.00
                reload();
            }
        }
//        else if sender.tag == 11{
//            decimal = true;
//            
//        }
    }
    
    

}

