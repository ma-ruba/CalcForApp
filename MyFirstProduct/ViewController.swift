//
//  ViewController.swift
//  MyFirstProduct
//
//  Created by Мария on 03.10.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen: Double = 0;
    var firstNum: Double = 0;
    var mathSign: Bool = false;
    var operation: Int = 0;
    var flag: Int = 0;
    var operationNum: Int = 0;
    var dotNum = false;
    var equalOper = false;
    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        if equalOper {
            result.text = ""
            equalOper = false
        }
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        if Double(result.text!) != nil {
            numberFromScreen = Double(result.text!)!
        }
    }
    func equality () { //равно
        operationNum = 0
        if operation == 11 {
            result.text = String(firstNum / numberFromScreen)
        }
        else if operation == 12 {
            result.text = String(firstNum * numberFromScreen)
        }
        else if operation == 13 {
            result.text = String(firstNum - numberFromScreen)
        }
        else if operation == 14 {
            result.text = String(firstNum + numberFromScreen)
        }
    }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            if operationNum == 1 && sender.tag != 18 {
                equality()
            }
            if Double(result.text!) != nil && sender.tag != 18{
                firstNum = Double(result.text!)!
            }
            if sender.tag == 11 { //поделить
                result.text = "/"
            }
            else if sender.tag == 12 {//умножить
                result.text = "x"
            }
            else if sender.tag == 13 {//вычесть
                result.text = "-"
            }
            else if sender.tag == 14 {//прибавить
                result.text = "+"
            }
            else if sender.tag == 17 {//процент числа
                result.text = String(firstNum / 100)
            }
            else if sender.tag == 16 {//знак числа
                flag += 1
                if flag % 2 != 0 {
                    result.text = "-" + result.text!
                }
                else {
                    result.text?.removeFirst(1)
                }
            }
            else if sender.tag == 18 && !dotNum {//запятая
                if Double(result.text!) != nil {
                    result.text = result.text! + "."
                    dotNum = true
                    numberFromScreen = Double(result.text!)!
                }
            }
            if sender.tag != 18 {
                mathSign = true
                operation = sender.tag
                operationNum = 1
                dotNum = false
            }
        }
        else if sender.tag == 15 { //равно
            equality()
            equalOper = true
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

