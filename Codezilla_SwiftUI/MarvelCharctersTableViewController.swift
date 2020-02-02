//
//  MarvelCharctersTableViewController.swift
//  Codezilla_SwiftUI
//
//  Created by Mahmoud Fathelbab on 1/31/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class MarvelCharctersTableViewController: UITableViewController {
    
    private var marvelCharcters: [MarvelCharcter] = MarvelCharcter.mockedData
    private var bestCharcters: [MarvelCharcter] {
        return marvelCharcters.filter { $0.isBest }
    }
    private var showBest: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Hello Codezilla!"
        
        tableView.register(TitledToggleCell.self, forCellReuseIdentifier: "ToggleCell")
        tableView.register(MarvelCell.self, forCellReuseIdentifier: "MarvelCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return (showBest ? bestCharcters : marvelCharcters).count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell", for: indexPath) as! TitledToggleCell
            cell.configure(with: showBest) { [weak self] value in
                self?.showBest = value
                self?.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCell", for: indexPath) as! MarvelCell
            cell.configure(with: (showBest ? bestCharcters : marvelCharcters)[indexPath.row])
            return cell
        }
    }
    
}

class TitledToggleCell: UITableViewCell {
    
    private var onUpdate: ((Bool) -> ())?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Show best"
        label.textColor = UIColor.label
        return label
    }()
    
    private lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(toggleUpdated(_:)), for: .valueChanged)
        return toggle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
        
        toggle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(toggle)
        NSLayoutConstraint.activate([
            toggle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            toggle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            toggle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
    
    @objc private func toggleUpdated(_ sender: AnyObject?) {
        onUpdate?(toggle.isOn)
    }
    
    func configure(with isOn: Bool, onUpdate: @escaping ((Bool) -> ())) {
        toggle.isOn = isOn
        self.onUpdate = onUpdate
    }
    
}

class MarvelCell: UITableViewCell {
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.secondaryLabel.cgColor
        return view
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, constant: -12),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            iconView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, constant: -12)
        ])
        
        containerView.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mainLabel.topAnchor.constraint(equalTo: containerView.topAnchor)
        ])
        
        containerView.addSubview(secondaryLabel)
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondaryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            secondaryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containerView.rightAnchor.constraint(equalTo: secondaryLabel.rightAnchor, constant:40),
            secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 0),
            secondaryLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func configure(with marvel: MarvelCharcter) {
        iconView.image = UIImage(named: marvel.image)
        mainLabel.text = marvel.title
        secondaryLabel.text = marvel.desc
    }
    
}

#if DEBUG
import SwiftUI

struct MarvelCharctersTableViewControllerPreviews: PreviewProvider, UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MarvelCharctersTableViewControllerPreviews>) -> MarvelCharctersTableViewController {
        return MarvelCharctersTableViewController()
    }
    
    func updateUIViewController(_ uiViewController: MarvelCharctersTableViewController, context: UIViewControllerRepresentableContext<MarvelCharctersTableViewControllerPreviews>) {
        
    }
    
    static var previews: some View {
        NavigationView {
            MarvelCharctersTableViewControllerPreviews()
        }
    }

}
#endif
