//
//  SearchResultCell.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

class SearchResultCell: UITableViewCell {
    static let identifier = "SearchResultCell"
    
    // MARK: - Components
    private var lblItemName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setUI() {
        selectionStyle = .none
        lblItemName = UILabel()
        lblItemName.translatesAutoresizingMaskIntoConstraints = false
        lblItemName.textAlignment = .left
        lblItemName.numberOfLines = 1
        addSubview(lblItemName)
        
        let itemNameLabelConstraints = [
            lblItemName.leftAnchor.constraint(equalTo: leftAnchor, constant: 7),
            lblItemName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(itemNameLabelConstraints)
    }
    
    func configData(searchResult: SearchResult?) {
        if let name = searchResult?.itemName {
            lblItemName.text = name
        }
    }

}
