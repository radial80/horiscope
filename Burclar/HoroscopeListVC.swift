//
//  HoroscopeListVC.swift
//  Burclar
//
//  Created by Recep Uyduran on 5.01.2023.
//

struct Horoscope {
    var name: String
    var image: String
    var detail: String
    var isFav: Bool = false
    //var detIsFav: Bool = false
}

import UIKit

class HoroscopeListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var horoscopeList = [
        Horoscope(name: "Aries", image: "aries", detail: "The cardinal fire sign is known for being dynamic, athletic, and having an insatiable appetite   for winning. For this reason, they take great pride in being early adopters of anything and everything from the hottest new sneaker drop to latest iPhone. And they pretty much live to compete and argue. Ram people tend to have the makings of a pro athlete, trend-setting influencer or lawyer."),
        Horoscope(name: "Cancer", image: "cancer", detail: "The cardinal water sign, influenced by the shimmering maternal moon, is one of the greatest dreamers and do-ers of the zodiac. As the ruler of the Fourth House, which deals with family and home life, they're homebodies who were pretty much born for quarantine, prioritizing bolstering their connections with loved ones and achieving a lasting sense of security. But their crabbiness absolutely will come into play when they're frustrated, feel put upon, or are otherwise catapulted into a moody headspace. They'll go into their self-protective shells requiring time away from others to take care of themselves before they can get back to taking care of everyone else."),
        Horoscope(name: "Gemini", image: "gemini", detail: "The word mercurial might have very well been created for Gemini, the mutable air sign that lives for communication in all forms. They're lovers of sharing whatever is on their mind, whenever, however. (Amy Schumer's sun and Venus are in the loquacious air sign.) Although, don't assume they're always outgoing. They can be reserved and shy one minute and incredibly chatty the next. Given their innate mastery of language and social skills, they tend to have a wide, diverse circle of friends and gravitate to career paths that allow them to express themselves and utilize their super-buzzy brains"),
        Horoscope(name: "Leo", image: "leo", detail: "The fixed fire sign is ruled by the confident sun, which informs their positive, cheerful, gung-ho vibe. Driven and self-assured leaders, they tend to be oriented toward taking action in life, and they're born feeling like they can accomplish their wildest dreams thanks to a glimmery combo of magnetism, luck, and endlessly believing in themselves. (Former President Barack Obama's sun and Mercury are in the charismatic fire sign.) Although they might struggle to step out of being self-focused, they can be extremely loyal, devoted, and adore showering their loved ones in playful energy and all of life's finest things."),
        Horoscope(name: "Libra", image: "libra", detail: "he cardinal air sign was born to bring balance, harmony, and justice to their work and relationships. Given their Venusian influence, they're lovers of art and beauty who are known for being social butterflies and the ultimate hosts. And as the ruler of the Seventh House of Partnership, they prioritize one-on-one bonds, especially of the romantic variety. But although they tend to be interested in achieving serenity at all costs and connecting with a wide range of people, they're not sheep."),
        Horoscope(name: "Pisces", image: "pisces", detail: "Imagine not only being super-tuned into your own feelings but also being wired to pick up on and take on everyone else's emotions. Now you're in the headspace of a person who has the significant presence of mutable water sign Pisces in their chart. Incredibly sensitive and intuitive, they are the healers, the hopeless romantics, the artists, and the escapists of the zodiac. While they have an instinct to get swept up in otherworldly daydreams to get away from any emotional pain, the healthiest way for them to channel these deeply-felt emotions is through creative outlets like theater, music, or poetry. (The late opera-loving RBG's sun and Venus were in the water sign.) And thanks to their Neptune influence, they have keen imaginations and tend to be up for exploring all things related to spirituality, the metaphysical, and psychology."),
        Horoscope(name: "Sagittarius", image: "sagittarius", detail: "Ruled by fortunate Jupiter, which brings a magnifying effect to everything it touches, Sagittarians are big, life-loving personalities who adore globe-trotting, being at the heart of any party, and exploring as much as life has to offer. They're also born philosophers who are endlessly passionate about their beliefs and have a tendency to hop on a soapbox frequently in order to share their world view, often in a way that pulls no punches. They're natural born comedians, entertainers, politicians, and/or generally gravitate to career paths that allow for lots of travel."),
        Horoscope(name: "Scorpio", image: "scorpio", detail: "The fixed water sign is known for being one of — if not the — most private sign in the zodiac. Co-ruled by transformative Pluto and go-getter Mars, they're able to command people's attention with their intense, powerful presence and air of mystery. They're also very much in touch with their spirituality and sexuality, but they hold their cards close to their chest. (Fiercely private family man Ryan Gosling has his sun and Mercury in the water sign.) Even after being in a relationship (platonic, romantic, or business-related) with a Scorpio for years, you might not know the whole story behind their emotional wounds and at times rough-around-the-edges tone. But once they're in any kind of emotional entanglement, the resolute, razor-focused sign is in it."),
        Horoscope(name: "Taurus", image: "taurus", detail: "The fixed earth sign has quite a reputation for being the most stubborn one of the zodiac, but remember, there are fixed signs in each element! Thanks to their Venusian influence, Taureans are actually fairly chill. They're known for loving luxury and indulgence, being super-loyal, and enjoying art."),
        Horoscope(name: "Virgo", image: "virgo", detail: "The mutable earth sign might very well be mistaken as an air sign given the influence of Mercury, which means their minds are pretty much going nonstop. Lovers of lists, spreadsheets, and blank journals, Virgos are the go-to researchers, organizers, and pretty much A students of the zodiac. They're also perfectionists who adore working hard to make the end result of any pursuit just right — whether that's a recipe, a professional project, or search for a partner. (Or in the case of Beyonce, whose sun is in the earth sign, the entertainment and art we can't get enough of.) Speaking of partners and loved ones, they'll often bend themselves into knots to help and be of service to their nearest and dearest.")
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoroscopeTableViewCell", for: indexPath) as! HoroscopeTableViewCell
        //cell.setupUI(name: horoscopeList[indexPath.row].name, image: UIImage(named: horoscopeList[indexPath.row].image)!)
        cell.setCell(horoscope: horoscopeList[indexPath.row], delegate: self, index: indexPath.row)
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Recep \(indexPath.row)")

        // Navigate
        let vc = storyboard?.instantiateViewController(withIdentifier: "HoroscopeDetailVC") as! HoroscopeDetailVC
        vc.horoscope = horoscopeList[indexPath.row]
        vc.index = indexPath.row
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Horoscope List"
        let item = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeFavsButtonTapped))
        navigationItem.rightBarButtonItem = item

        let textFieldCell = UINib(nibName: "HoroscopeTableViewCell",
                                  bundle: nil)
        tableView.register(textFieldCell,
                           forCellReuseIdentifier: "HoroscopeTableViewCell")

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    @objc func removeFavsButtonTapped() {
        for i in 0...horoscopeList.count - 1 {
            horoscopeList[i].isFav = false
        }
        tableView.reloadData()
    }

}


extension HoroscopeListVC: HoroscopeTableViewCellDelegate {
    func buttonTapped(index: Int) {
        horoscopeList[index].isFav.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
    }

}
extension HoroscopeListVC: HoroscopeDetailPageDelegate {
    func favTapButton(index: Int) {
        horoscopeList[index].isFav.toggle()
        tableView.reloadData()
    }
}



