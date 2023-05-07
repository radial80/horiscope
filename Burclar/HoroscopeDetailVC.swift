//
//  HoroscopeDetailVC.swift
//  Burclar
//
//  Created by Recep Uyduran on 19.01.2023.
//
//struct HoroscopeDetailList {
//    var name : String
//    var detail : String }

import Foundation
import UIKit
protocol HoroscopeDetailPageDelegate : AnyObject {
    func favTapButton(index: Int)
}
class HoroscopeDetailVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var horoscopeImageView: UIImageView!
    @IBOutlet weak var horoscopeFavBut: UIButton!

    weak var delegate: HoroscopeDetailPageDelegate?
    var horoscope: Horoscope?
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = horoscope?.name
        nameLabel.text = horoscope?.detail
        horoscopeImageView.image = UIImage(named: horoscope?.image ?? "")
        
        if horoscope!.isFav {
            horoscopeFavBut.imageView?.image = UIImage(systemName: "star.fill")
        } else {
            horoscopeFavBut.imageView?.image = UIImage(systemName: "star")
        }
    }

    @IBAction func favButtoTapped(_ sender: Any) {
        if horoscopeFavBut.imageView?.image == UIImage(systemName: "star") {
            horoscopeFavBut.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            horoscopeFavBut.setImage(UIImage(systemName: "star"), for: .normal)
        }
        delegate?.favTapButton(index: index)
    }
}
