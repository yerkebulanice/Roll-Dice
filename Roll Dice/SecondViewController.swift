//
//  SecondViewController.swift
//  Roll Dice
//
//  Created by Еркебулан on 14.04.2021.
//

import UIKit

protocol SecondViewControllerProtocol: NSObjectProtocol {
    func changeRoll(first: Int, second: Int)
}

class SecondViewController: UIViewController {
    public var rolls: [(first: Int, second: Int)] = [(first: Int, second: Int)]()
//    public var callBack: (((first: Int, second: Int)) -> (Void))?
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    public weak var delegate: SecondViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: RecordViewCell.identifier, bundle: Bundle(for: RecordViewCell.self)), forCellReuseIdentifier: RecordViewCell.identifier)
    }

}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecordViewCell.identifier, for: indexPath) as! RecordViewCell
        let first = rolls[indexPath.row].first + 1
        let second = rolls[indexPath.row].second + 1
        cell.roll = (first: first, second: second)
        return cell
    }
    
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let roll = rolls[indexPath.row]
        delegate?.changeRoll(first: rolls[indexPath.row].first, second: rolls[indexPath.row].second)
        self.dismiss(animated: true, completion: nil)
    }
}
