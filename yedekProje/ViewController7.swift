//
//  ViewController7.swift
//  yedekProje
//
//  Created by macbook on 5.12.2023.
//

import UIKit

class ViewController7: UIViewController {
    
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var kod7TextField: UITextField!
    @IBOutlet weak var bilgilereEris7Label: UIButton!
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView7.layer.cornerRadius = 70
        bilgilereEris7Label.layer.cornerRadius = 14
        bilgilereEris7Label.layer.shadowColor = UIColor.black.cgColor
        bilgilereEris7Label.layer.shadowOpacity = 0.5
        bilgilereEris7Label.layer.shadowOffset = CGSize(width: 8, height: 8)
        bilgilereEris7Label.layer.shadowRadius = 4
        bilgilereEris7Label.layer.masksToBounds = false
        self.view.addSubview(bilgilereEris7Label)
        readJsonFile()
    }
    
    /*
    func getDocumentPath() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory  // bu kodu çağırırsak bize uzantı getirir
    }
   */
    
    func getJsonFilePath() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory.appendingPathComponent("Users.json") // users.json adında url ye dosya ekledik dosya türünü belirttik
    }
    
    
    
    func readJsonFile() {
        
        if let data = try? Data(contentsOf: getJsonFilePath()) {// jsonfile dosyasından gidip datayı oku varsa işlem yap yoksa yapma
            
            do {
                users = try JSONDecoder().decode([User].self, from: data)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        } else {  // dosya boşssa
            print("no file")
           }
    }
    
    
    
    
    
    @IBAction func bilgilereEris7(_ sender: Any) {
        
        func alertOlustur1(titleGirdisi1: String, messageGirdisi1: String) {
            
            let uyariMesaji1 = UIAlertController(title: titleGirdisi1, message: messageGirdisi1, preferredStyle: UIAlertController.Style.alert)
            
            let okButtton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // ok button una tıklanınca olacaklar
            }
            
            uyariMesaji1.addAction(okButtton)  // uyarı mesajına buttonu ekledik
            self.present(uyariMesaji1, animated: true, completion: nil)
        }
        
        
        if kod7TextField.text! == ""  {    // kullanıcı şifre kısmını girmemişse, hata mesajı ile parolanı girmemişsin
    
             alertOlustur1(titleGirdisi1:"UYARI!" , messageGirdisi1: "Kod girmediniz!!!")
        }
        
        else {
            for uuser in users{
            
                let pass = kod7TextField.text!
                if uuser.uretilenKod == pass {
                    performSegue(withIdentifier: "aktarim7-6", sender: nil)
                }
                else{
                    continue
                }
            }
        }
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // ikinci ekrana veri aktarmak için fonksyon burası sadece veri aktarır
           
           if segue.identifier ==  "aktarim7-6" {
               
               let destinationVC77 = segue.destination as! ViewController6
               destinationVC77.sifreBilgi = kod7TextField.text!
           
           }
       }
    
}
