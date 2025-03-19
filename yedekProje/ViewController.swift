//
//  ViewController.swift
//  yedekProje
//
//  Created by macbook on 18.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resim1: UIImageView!
    @IBOutlet weak var toplantiOlustur: UIButton!
    @IBOutlet weak var toplantiGir: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toplantiOlustur.layer.cornerRadius = 19
        toplantiGir.layer.cornerRadius = 19
        resim1.layer.cornerRadius = 50
        
        
        
        // Gölge özellikleri
        toplantiOlustur.layer.shadowColor = UIColor.black.cgColor
        toplantiOlustur.layer.shadowOpacity = 0.5
        toplantiOlustur.layer.shadowOffset = CGSize(width: 8, height: 8)
        toplantiOlustur.layer.shadowRadius = 4

        // Görünür yapma
        toplantiOlustur.layer.masksToBounds = false

        // Görüntü ekleme
        self.view.addSubview(toplantiOlustur)
        
        // Gölge özellikleri
        toplantiGir.layer.shadowColor = UIColor.black.cgColor
        toplantiGir.layer.shadowOpacity = 0.5
        toplantiGir.layer.shadowOffset = CGSize(width: 8, height: 8)
        toplantiGir.layer.shadowRadius = 4

        // Görünür yapma
        toplantiGir.layer.masksToBounds = false

        // Görüntü ekleme
        self.view.addSubview(toplantiGir)
        
        
        
        
    }

    @IBAction func yeniBirToplantiOlustur(_ sender: Any) {
        
        performSegue(withIdentifier: "aktarim1-2", sender: nil)
    }
    
    
    @IBAction func toplantiyaGir(_ sender: Any) {
        
        performSegue(withIdentifier: "aktarim1-4", sender: nil)
    }
    
}

