//
//  ViewController.swift
//  Roll Dice
//
//  Created by Еркебулан on 12.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var roll: UIButton!
    private var dices: [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
//    private var dict: [Int: Int] = [:]
    private var rolls: [(first: Int, second: Int)] = [(first: Int, second: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roll.layer.cornerRadius = 4
        roll.layer.masksToBounds = true
        firstImageView.image = UIImage(named: "dice3")
        secondImageView.image = UIImage(named: "dice6")
        self.becomeFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            rolled()
        }
    }
    
    func rolled () {
        let randomNumber1 = Int(arc4random() % 6)
        let randomNumber2 = Int(arc4random() % 6)
        
//        dict[randomNumber1] = randomNumber2
        rolls.append((first: randomNumber1, second: randomNumber2))
        firstImageView.image = UIImage(named: dices[randomNumber1])
        secondImageView.image = UIImage(named: dices[randomNumber2])
    }
    
    @IBAction func rolledButton(_ sender: UIButton) {
        rolled()
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            vc.modalPresentationStyle = .fullScreen
            vc.rolls = rolls
            vc.delegate = self
//            vc.callBack = { [weak self] roll in
//                guard let self = self else {
//                    return
//                }
//                self.firstImageView.image = UIImage(named: self.dices[roll.first])
//                self.secondImageView.image = UIImage(named: self.dices[roll.second])
//            }
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: SecondViewControllerProtocol{
    func changeRoll(first: Int, second: Int) {
        firstImageView.image = UIImage(named: "dice\(first+1)")
        secondImageView.image = UIImage(named: "dice\(second+1)")
    }
}
