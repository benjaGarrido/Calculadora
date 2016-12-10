//
//  ViewController.swift
//  Calculadora
//
//  Created by Benjamín Garrido Barreiro on 10/12/16.
//  Copyright © 2016 Benjamín Garrido Barreiro. All rights reserved.
//

import UIKit

enum CalcOp : String {
    case Add = "op-suma"
    case Substract = "op-resta"
    case Multiply = "op-multiplica"
    case Divide = "op-divide"
}

class ViewController: UIViewController {
    @IBOutlet weak var icoSuma: UIImageView!
    @IBOutlet weak var icoDividir: UIImageView!
    @IBOutlet weak var icoMultiplica: UIImageView!
    @IBOutlet weak var icoResta: UIImageView!
    @IBOutlet weak var lblResult: UILabel!
    
    let currencyFormatter = NumberFormatter()
    
    var result : String? {
        didSet {
            if let result = result {
                lblResult.text = currencyFormatter.string(from: NSNumber(value: Double(result.replacingOccurrences(of: ",", with: "."))!))
            }
        }
    }
    var previousResult : String?
    var currentOperation : CalcOp? {
        willSet {
            resetIcons()
        }
        didSet {
            if let currentOperation = currentOperation {
                switch currentOperation {
                case .Add:
                    icoSuma.image = UIImage(named: "\(CalcOp.Add.rawValue)-on")
                case .Substract:
                    icoResta.image = UIImage(named: "\(CalcOp.Substract.rawValue)-on")
                case .Multiply:
                    icoMultiplica.image = UIImage(named: "\(CalcOp.Multiply.rawValue)-on")
                case .Divide:
                    icoDividir.image = UIImage(named: "\(CalcOp.Divide.rawValue)-on")
                }
            } else {
                resetIcons()
            }
        }
    }
    var previousOperation : CalcOp?
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func resetIcons() {
        icoSuma.image = UIImage(named: CalcOp.Add.rawValue)
        icoResta.image = UIImage(named: CalcOp.Substract.rawValue)
        icoMultiplica.image = UIImage(named: CalcOp.Multiply.rawValue)
        icoDividir.image = UIImage(named: CalcOp.Divide.rawValue)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

