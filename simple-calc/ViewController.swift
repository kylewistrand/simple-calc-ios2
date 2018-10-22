//
//  ViewController.swift
//  simple-calc
//
//  Created by Kyle Wistrand on 10/15/18.
//  Copyright © 2018 Kyle Wistrand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var numerator : Int = 0
    var op : Int = 0
    var denominator : Int = 0
    var numbers : [Int] = []

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var equalsButton: UIButton!
    
    @IBAction func numPressed(_ sender: Any) {
        let thisNum : Int = (sender as AnyObject).tag
        
        if op == 0 || op >= 6 {
            if numerator < Int.max {
                numerator = (numerator * 10) + thisNum
            }
            updateProductLabel(numerator)
        } else {
            if numerator < Int.max {
                denominator = (denominator * 10) + thisNum
            }
            updateProductLabel(denominator)
        }
    }
    
    @IBAction func operPressed(_ sender: Any) {
        let thisOp : Int = (sender as AnyObject).tag
        
        if thisOp == 0 {
            var product : Int
            
            switch op {
            case 1:
                product = numerator + denominator
                break
            case 2:
                product = numerator - denominator
                break
            case 3:
                product = numerator * denominator
                break
            case 4:
                if denominator == 0 {
                    product = Int.max
                } else {
                    product = numerator / denominator
                }
                break
            case 5:
                product = numerator % denominator
                break
            case 6:
                numbers.append(numerator)
                product = numbers.count
                numbers.removeAll()
                break
            case 7:
                numbers.append(numerator)
                product = 0
                for num in numbers {
                    product += num
                }
                
                product = product / (numbers.count)
                
                numbers.removeAll()
                break
            default:
                product = 0
                break
            }
            
            numerator = product
            op = 0
            denominator = 0
            equalsButton.setTitle("clear", for: .normal)
            updateProductLabel(product)
        } else if thisOp == 6 || thisOp == 7 {
            numbers.append(numerator)
            numerator = 0
            updateProductLabel(numerator)
            
            op = thisOp
            equalsButton.setTitle("=", for: .normal)
        } else if thisOp == 8 {
            var product : Int
            
            if numerator == 0 {
                product = 0
            } else if numerator > 20 {
                product = Int.max
            } else {
                product = 1
                for i in (1...numerator) {
                    product *= i
                }
            }
            
            numerator = product
            op = 0
            denominator = 0
            equalsButton.setTitle("clear", for: .normal)
            updateProductLabel(product)
        } else {
            equalsButton.setTitle("=", for: .normal)
            op = thisOp
        }
    }
    
    func updateProductLabel(_ newProduct: Int) {
        productLabel.text = String(newProduct)
    }
    
}

