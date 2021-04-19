//
//  RecordViewCell.swift
//  Roll Dice
//
//  Created by Еркебулан on 14.04.2021.
//

import UIKit

class RecordViewCell: UITableViewCell {

    public static let identifier: String = "RecordViewCell"
    
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    
    public var roll: (first: Int, second: Int)?{
        didSet {
            if let roll = roll {
                firstLabel.text = "First: \(roll.first)"
                secondLabel.text = "Second: \(roll.second)"
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

}
