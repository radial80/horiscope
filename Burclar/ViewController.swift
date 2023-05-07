//
//  ViewController.swift
//  Burclar
//
//  Created by Recep Uyduran on 4.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            //self.performSegue(withIdentifier: "segue", sender: self)
            self.navigate()
        }

    }


//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        imageView.center = view.center
//        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
//            self.animation()
//        }
//    }

    func navigate() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "HoroscopeListVC") as! HoroscopeListVC
        self.navigationController?.setViewControllers([secondViewController], animated: true)

    }

}


// ANIMATE FUNCS
//extension ViewController {
//    func animation() {
//        UIView.animate(withDuration: 1){
//            let size =  self.view.frame.size.width * 2
//            let xposition = size - self.view.frame.size.width
//            let yposition =  self.view.frame.size.width - size
//
//            self.imageView.frame = CGRect(x: -(xposition/2), y: (yposition/2), width: size, height: size)
//            self.imageView.alpha = 0
//        }
//
//    }
//}
