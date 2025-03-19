//
//  ViewController5.swift
//  yedekProje
//
//  Created by macbook on 18.11.2023.
//

struct User2: Codable{
    var kullanicimName: [String]
    var kullanicimDate: [String]
    var kodSifre: String
}



import UIKit

class ViewController5:UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var gelenBaslikLabel: UILabel!
    @IBOutlet weak var gelenAciklamaLabel: UILabel!
    @IBOutlet weak var gelenTarihLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var kaydetBtn: UIButton!
    @IBOutlet weak var katilimciTarihTextField: UITextField!
    @IBOutlet weak var dataPickerKatilimci: UIDatePicker!
    @IBOutlet weak var kurucuIsimLabel: UILabel!
    
    let dataFormatter2 = DateFormatter()
    
    var kullaniciIsimleri = ""
    var kullaniciDiziIsimleri = [String]()
    var sifreler = ""
    var users =  [User]()
    var kullaniciName = ""
    var kullaniciUser = [User2]()
    var dateee = [String]()
    var nameee = [String]()
    var sss = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        setInitView2()
        tableView.layer.cornerRadius = 10
        kaydetBtn.layer.cornerRadius = 14
        readJsonFile()
       
        checkUser()
    
      tableView.delegate = self
      tableView.dataSource = self
        
        print(getDocumentPath2())
        print(getJsonFilePath2())
        readJsonFile2()
    }
    
    

    
    
    func getDocumentPath2() -> URL {
        
        let paths2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory2 = paths2[0]
        return documentDirectory2
    }
    
    
    func getJsonFilePath2() -> URL {
        
        let paths2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory2 = paths2[0]
        return documentDirectory2.appendingPathComponent("kullanici.json")
    }
    
    
    func readJsonFile2() {
        
        if let data2 = try? Data(contentsOf: getJsonFilePath2()) {
            
            do {
                kullaniciUser = try JSONDecoder().decode([User2].self, from: data2)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        } else {
            let usse = User2(kullanicimName: [""], kullanicimDate: [""], kodSifre: sifreler)
            kullaniciUser.append(usse)
            writeToJsonFile2()
          
           }
    }
    
    
    
    
    func writeToJsonFile2() {
        
        do {
            let data2 = try JSONEncoder().encode(kullaniciUser)
            try data2.write(to: getJsonFilePath2())
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    func getJsonFilePath() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory.appendingPathComponent("Users.json")
    }
    

     
    
    
    
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        
        func alertOlustur(titleGirdisi: String, messageGirdisi: String) {
            
            let uyariMesaji = UIAlertController(title: titleGirdisi, message: messageGirdisi, preferredStyle: UIAlertController.Style.alert)
            
            let okButtton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
               
            }
            
            uyariMesaji.addAction(okButtton)
            self.present(uyariMesaji, animated: true, completion: nil)
        }
        
      
        
        
           
        for var user05 in kullaniciUser{
            
            if user05.kodSifre == sifreler{
                user05.kullanicimDate.append(katilimciTarihTextField.text!)
                user05.kullanicimName.append(kullaniciName)
                user05.kodSifre = sifreler
                kullaniciUser.append(user05)
                writeToJsonFile2()
                
                nameee = user05.kullanicimName
                dateee = user05.kullanicimDate
                tableView.reloadData()
                sss = "ddd"
            }
            else{
                continue
            }
        }
        
                if sss != "ddd" {
                    let uss = User2(kullanicimName: [kullaniciName], kullanicimDate: [katilimciTarihTextField.text!], kodSifre: sifreler)
                    kullaniciUser.append(uss)
                    writeToJsonFile2()
                    nameee = uss.kullanicimName
                    dateee = uss.kullanicimDate
                    tableView.reloadData()
                }
                else{
                    print("abc")
                }
                
                    
                
           alertOlustur(titleGirdisi:"UYARI!" , messageGirdisi: "Kayıt Başarıyla Oluşturuldu")
           print(sifreler)
        
    }
 
        
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return nameee.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
           
            cell.textLabel?.text = "İsim:\(nameee[indexPath.row]) ------ Tarih:\(dateee[indexPath.row])" //indexPath.row iindexleri sırasıyla çağırır
            return cell
        }
        
        

    
    
    
    private func setInitView2() {
        
        dataFormatter2.dateFormat = "dd/MM/yyyy"
        katilimciTarihTextField.inputView = dataPickerKatilimci
        dataPickerKatilimci.datePickerMode = .date
        katilimciTarihTextField.text = dataFormatter2.string(from: dataPickerKatilimci.date)
    }
    
    @IBAction func dataPickerKatilimcilar(_ sender: UIDatePicker) {
        katilimciTarihTextField.text = dataFormatter2.string(from: sender.date)
        view.endEditing(true)
    }
    
    
   
    
    

    
    func readJsonFile() {
        
        if let data = try? Data(contentsOf: getJsonFilePath()) {
            
            do {
                users = try JSONDecoder().decode([User].self, from: data)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        } else {  
            print("no file")
           }
    }
    
    
    

    
    func checkUser() {
            
        
            for user2 in users {
                if user2.uretilenKod == sifreler {
                    
                        gelenBaslikLabel.text = "Toplantı Başlığı: \(user2.girilenBaslik)"
                        gelenAciklamaLabel.text = "Toplanti Açıklaması: \(user2.girilenAciklama)"
                        gelenTarihLabel.text = "Kurucunun Toplantı Tarihi: \(user2.girilenTarih) "
                        kurucuIsimLabel.text = "Kurucunun İsmi: \(user2.girilenKurucuIsim)"
    
                    
                }
            }
        }

    

}
