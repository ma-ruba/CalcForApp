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
    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
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
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 15 { //равно
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

