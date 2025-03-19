//
//  ViewController4.swift
//  yedekProje
//
//  Created by macbook on 18.11.2023.
//



import UIKit
import Foundation

class ViewController4: UIViewController {
    
    @IBOutlet weak var resim2: UIImageView!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var kodTextField: UITextField!
    @IBOutlet weak var kayitOlButton: UIButton!
    @IBOutlet weak var erisBtn: UIButton!
    
    
    var users = [User]()


    var password2 = ""
    var isimler = ""
    var kullanicidanAlinanIsimler = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        resim2.layer.cornerRadius = 70
        
        kayitOlButton.layer.cornerRadius = 14
        erisBtn.layer.cornerRadius = 14
        
        erisBtn.layer.shadowColor = UIColor.black.cgColor
        erisBtn.layer.shadowOpacity = 0.5
        erisBtn.layer.shadowOffset = CGSize(width: 8, height: 8)
        erisBtn.layer.shadowRadius = 4
        erisBtn.layer.masksToBounds = false
        self.view.addSubview(erisBtn)
        
        kayitOlButton.layer.shadowColor = UIColor.black.cgColor
        kayitOlButton.layer.shadowOpacity = 0.5
        kayitOlButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        kayitOlButton.layer.shadowRadius = 4
        kayitOlButton.layer.masksToBounds = false
        self.view.addSubview(kayitOlButton)
        
        readJsonFile()
    }

    
    
    
    

    
    func getDocumentPath() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory  // bu kodu çağırırsak bize uzantı getirir
    }
    
    
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
    
    
    
    
    

    

    
    
    
    @IBAction func bilgilereErisBtn(_ sender: Any) {
        performSegue(withIdentifier: "aktarim4-7", sender: nil)
    }
    
    
    @IBAction func kayitOlTiklandi(_ sender: Any) {


                        func alertOlustur(titleGirdisi: String, messageGirdisi: String) {
                            
                            let uyariMesaji = UIAlertController(title: titleGirdisi, message: messageGirdisi, preferredStyle: UIAlertController.Style.alert)
                            
                            let okButtton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                                // ok button una tıklanınca olacaklar
                            }
                            
                            uyariMesaji.addAction(okButtton)  // uyarı mesajına buttonu ekledik
                            self.present(uyariMesaji, animated: true, completion: nil)
                        }
                        
                    
                        if isimTextField.text == "" && kodTextField.text == "" {    // kullanıcı şifre kısmını girmemişse, hata mesajı ile parolanı girmemişsin
                    
                             alertOlustur(titleGirdisi:"UYARI!" , messageGirdisi: "İsim Ve Kodu Girmediniz!!!")
                        }
                        
                        
                        else  if isimTextField.text == ""  {   // kullanıcı email kısmını boş bırakırsa hata mesajı ver, emaili girmemişsse,hata mesajı ile emailini girmemişsin
                            
                            alertOlustur(titleGirdisi: "UYARI!", messageGirdisi: "İsminizi girmediniz!!!")
                        }
                        
                         else if kodTextField.text == "" {    // kullanıcı şifre kısmını girmemişse, hata mesajı ile parolanı girmemişsin
                            
                            alertOlustur(titleGirdisi:"UYARI!" , messageGirdisi: "Kodu Girmediniz!!!")
                        }
        else {
            
            password2 = kodTextField.text!
            
               for  user11 in users {
                            
                   if user11.uretilenKod == password2 {
                       isimler = isimTextField.text!
     
                       print("adana")
         
                  //     user11.kullanicilarIsimleri.append(isimTextField.text!)

                   //    users.append(user11)
                     //  writeToJsonFile()
                       
                       print(password2)
                       performSegue(withIdentifier: "aktarim4-5", sender: nil)
                   }
                   
                     else {
                       continue
                      }
                    }
        }

    }
    
    

    
    
    // VERİ AKTARIMI
    // burada veri aktarımında sıkıntı var !!! 5. ekrana aktaramadım
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // ikinci ekrana veri aktarmak için fonksyon burası sadece veri aktarır
           
           if segue.identifier ==  "aktarim4-5" {
               
               let destinationVC9 = segue.destination as! ViewController5
               destinationVC9.sifreler = password2
               destinationVC9.kullaniciName = isimler
           
           }
       }
    
    
    
    
    

}
