//
//  HoroscopeTableViewCell.swift
//  Burclar
//
//  Created by Recep Uyduran on 5.01.2023.
//

import UIKit
import SnapKit

protocol HoroscopeTableViewCellDelegate: AnyObject {
    func buttonTapped(index: Int)
}

class HoroscopeTableViewCell: UITableViewCell {

    @IBOutlet private weak var imageBox: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet var tapButton: UIButton!
//    {
//        didSet{
//            tapButton.setImage(UIImage(systemName: "star.fill"), for: .normal)}
//    }

    lazy var imageBox2: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        return view
    }()

    lazy var nameLabel2: UILabel = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.scrollDirection = .horizontal
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()

    weak var delegate: HoroscopeTableViewCellDelegate?
    var cellIndex: Int = 0

    func setCell(horoscope: Horoscope, delegate: HoroscopeTableViewCellDelegate, index: Int) {
        nameLabel.text = horoscope.name
        imageBox.image = UIImage(named: horoscope.image)
        cellIndex = index
        self.delegate = delegate
        if horoscope.isFav {
            tapButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            tapButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
       
    }

    func setupUI() {
        imageBox2.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
            make.size.equalTo(32)
        }

        nameLabel2.snp.makeConstraints { make in
            make.leading.equalTo(imageBox2.snp.trailing).inset(8)
            make.top.bottom.trailing.equalToSuperview().inset(8)
        }
    }

    @IBAction func favoriteButtonTapped(_ sender: Any) {
        delegate?.buttonTapped(index: cellIndex)
    }
}
