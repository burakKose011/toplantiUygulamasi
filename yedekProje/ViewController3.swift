//
//  ViewController3.swift
//  yedekProje
//
//  Created by macbook on 18.11.2023.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var kodLabel: UILabel!
    @IBOutlet weak var kodResmi: UIImageView!
    
    var cıkıs = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Gölge özellikleri
        kodLabel.layer.shadowColor = UIColor.black.cgColor
        kodLabel.layer.shadowOpacity = 0.5
        kodLabel.layer.shadowOffset = CGSize(width: 8, height: 8)
        kodLabel.layer.shadowRadius = 4

        // Görünür yapma
        kodLabel.layer.masksToBounds = false

        // Görüntü ekleme
        self.view.addSubview(kodLabel)

        kodLabel.text = cıkıs
        print(cıkıs)
    }
    



}
