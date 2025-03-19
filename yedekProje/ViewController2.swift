//
//  ViewController2.swift
//  yedekProje
//
//  Created by macbook on 18.11.2023.
//


struct User: Codable {
    
    let girilenBaslik : String
    let girilenAciklama: String
    let uretilenKod: String
    let girilenTarih: String
    let girilenKurucuIsim: String

}

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var baslikTextField: UITextField!
    @IBOutlet weak var aciklamaTextField: UITextField!
    @IBOutlet weak var olusturButton: UIButton!
    @IBOutlet weak var inputTarihTextField: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var kurucuIsimTextField: UITextField!
    
    
    let dataFormatter = DateFormatter()
    
    
    var basligim = ""
    var aciklamam = ""
    var giris = ""
    var nameee = ""
    
    var users = [User]()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInitView()
        
        olusturButton.layer.cornerRadius = 14
        
   
        // Gölge özellikleri
        dataPicker.layer.shadowColor = UIColor.black.cgColor
        dataPicker.layer.shadowOpacity = 10
        dataPicker.layer.shadowOffset = CGSize(width: 1, height: 1)
        dataPicker.layer.shadowRadius = 4

        // Görünür yapma
        dataPicker.layer.masksToBounds = false

        // Görüntü ekleme
        self.view.addSubview(dataPicker)
        
        
        
        
        // Gölge özellikleri
        olusturButton.layer.shadowColor = UIColor.black.cgColor
        olusturButton.layer.shadowOpacity = 0.5
        olusturButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        olusturButton.layer.shadowRadius = 4

        // Görünür yapma
        olusturButton.layer.masksToBounds = false

        // Görüntü ekleme
        self.view.addSubview(olusturButton)
        
        
        
     
        print(getDocumentPath())
        print(getJsonFilePath())
        readJsonFile()
    }
    
    
    
    // tarihi text field a atdım
    private func setInitView() {
        
        dataFormatter.dateFormat = "dd/MM/yyyy"
        inputTarihTextField.inputView = dataPicker
        dataPicker.datePickerMode = .date
        inputTarihTextField.text = dataFormatter.string(from: dataPicker.date)
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        inputTarihTextField.text = dataFormatter.string(from: sender.date)
        view.endEditing(true)
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
   
    
    
    // dosya okuma (read)
    
    func readJsonFile() {
        
        if let data = try? Data(contentsOf: getJsonFilePath()) {// jsonfile dosyasından gidip datayı oku varsa işlem yap yoksa yapma
            
            do {
                users = try JSONDecoder().decode([User].self, from: data)
            //    debugPrint(users)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        } else {  // dosya boşssa
            print("no file")
           }
    }
    
    
    
    func writeToJsonFile() {
        
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getJsonFilePath())
          //  navigationController?.popViewController(animated: true)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    

    
    
    @IBAction func olusturTiklandi(_ sender: Any) {
        
        basligim = baslikTextField.text!
        aciklamam = aciklamaTextField.text!
        nameee = kurucuIsimTextField.text!

    
        
        
        
        
// UYARI MESAJLARI FONKSYON İLE
        
            func alertOlustur(titleGirdisi: String, messageGirdisi: String) {
                
                let uyariMesaji = UIAlertController(title: titleGirdisi, message: messageGirdisi, preferredStyle: UIAlertController.Style.alert)
                
                let okButtton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    // ok button una tıklanınca olacaklar
                }
                
                uyariMesaji.addAction(okButtton)  // uyarı mesajına buttonu ekledik
                self.present(uyariMesaji, animated: true, completion: nil)
            }
            
        
        
        
              if basligim == "" && aciklamam == "" && nameee == "" {    // kullanıcı şifre kısmını girmemişse, hata mesajı ile parolanı girmemişsin
        
                 alertOlustur(titleGirdisi:"UYARI!" , messageGirdisi: "Lütfen Bilgileri Doldurun!!!")
            }
        
             else  if aciklamam == "" && basligim == ""  {   // kullanıcı email kısmını boş bırakırsa hata mesajı ver, emaili girmemişsse,hata mesajı ile emailini girmemişsin
           
                 alertOlustur(titleGirdisi: "UYARI!", messageGirdisi: "Toplantı Başlığı Ve Açıklaması girmediniz!!!")
            }
            
             else  if aciklamam == "" && nameee == ""  {   // kullanıcı email kısmını boş bırakırsa hata mesajı ver, emaili girmemişsse,hata mesajı ile emailini girmemişsin
           
                 alertOlustur(titleGirdisi: "UYARI!", messageGirdisi: "Toplantı Açıklaması Ve İsim Bilgisini girmediniz!!!")
            }
        
             else  if basligim == "" && nameee == ""  {   // kullanıcı email kısmını boş bırakırsa hata mesajı ver, emaili girmemişsse,hata mesajı ile emailini girmemişsin
           
                alertOlustur(titleGirdisi: "UYARI!", messageGirdisi: "Toplantı Başlığı Ve İsim Bilgisini girmediniz!!!")
            }
        
            else  if basligim == "" && aciklamam == ""  {   // kullanıcı email kısmını boş bırakırsa hata mesajı ver, emaili girmemişsse,hata mesajı ile emailini girmemişsin
           
                 alertOlustur(titleGirdisi: "UYARI!", messageGirdisi: "Toplantı Başlığı Ve Açıklaması girmediniz!!!")
            }
            
             else  if aciklamam == ""  {   // kullanıcı email kısmını boş bırakırsa hata mesajı ver, emaili girmemişsse,hata mesajı ile emailini girmemişsin
                
                 alertOlustur(titleGirdisi: "UYARI!", messageGirdisi: "Açıklama girmediniz!!!")
            }
            
            else if basligim == "" {    // kullanıcı şifre kısmını girmemişse, hata mesajı ile parolanı girmemişsin
                
                 alertOlustur(titleGirdisi:"UYARI!" , messageGirdisi: "Toplantı Başlığı Girmediniz!!!")
            }
        
           else if kurucuIsimTextField.text == "" {    // kullanıcı şifre kısmını girmemişse, hata mesajı ile parolanı girmemişsin
            
                alertOlustur(titleGirdisi:"UYARI!" , messageGirdisi: "İsim Bilgisi Girmediniz!!!")
        }
        
        
        else {
            
            let uretilen = arc4random()  // rastgele sayı üretmek
            
            giris = String(uretilen)
            print(giris)
            

       
            if let atananBaslik = baslikTextField.text, let atananAciklama = aciklamaTextField.text, let atananTarih = inputTarihTextField.text, let atananIsim = kurucuIsimTextField.text {
                
                
                let user = User(girilenBaslik: atananBaslik, girilenAciklama: atananAciklama, uretilenKod: giris, girilenTarih: atananTarih, girilenKurucuIsim: atananIsim)
                
 
                users.append(user)
                writeToJsonFile()
                
                // KOD İLE EKRANLAR ARASI GEÇİŞ
                        
                        performSegue(withIdentifier: "aktarim2-3", sender: nil)   // kod ile show u yapar kod ile ekranlar arası geçiş yapar
                
              
                
            }
            else {
                print("fill the information")
            }
            
        }
        
    }
    
    
    
    
    // VERİ AKTARIMI
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // ikinci ekrana veri aktarmak için fonksyon burası sadece veri aktarır
           
           if segue.identifier ==  "aktarim2-3" {
               
               let destinationVC = segue.destination as! ViewController3
               destinationVC.cıkıs = giris
           
           }
       }
    
    
    
    
      
     }
    
    
    


