//
//  ViewController6.swift
//  yedekProje
//
//  Created by macbook on 5.12.2023.
//

import UIKit

class ViewController6: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet weak var baslikBilgiLabel: UILabel!
    @IBOutlet weak var aciklamaBilgiLabel: UILabel!
    @IBOutlet weak var tarihBilgiLabel: UILabel!
    @IBOutlet weak var isimBilgiLabel: UILabel!
    @IBOutlet weak var tableView6: UITableView!
    
    var users = [User]()
    var kullaniciUser = [User2]()
    var sifreBilgi = ""
    var name = [String]()
    var dte = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView6.delegate = self      // table view için buraya bunları yazmalıyız
        tableView6.dataSource = self
          
     readJsonFile2()
        readJsonFile()
        // Do any additional setup after loading the view.
        checkUser()
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
    
    
    
    
    func getJsonFilePath2() -> URL {
        
        let paths2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory2 = paths2[0]
        return documentDirectory2.appendingPathComponent("kullanici.json") // users.json adında url ye dosya ekledik dosya türünü belirttik
    }
    
    func readJsonFile2() {
        
        if let data2 = try? Data(contentsOf: getJsonFilePath2()) {// jsonfile dosyasından gidip datayı oku varsa işlem yap yoksa yapma
            
            do {
                kullaniciUser = try JSONDecoder().decode([User2].self, from: data2)
            //    debugPrint(users)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        } else {  // dosya boşssa
            print("no file")
           }
    }
    
    
    
    
    
    func checkUser() {
            
        
            for user3 in users {
                if user3.uretilenKod == sifreBilgi {
                    
                        baslikBilgiLabel.text = "Toplantı Başlığı: \(user3.girilenBaslik)"
                        aciklamaBilgiLabel.text = "Toplanti Açıklaması: \(user3.girilenAciklama)"
                        tarihBilgiLabel.text = "Kurucunun Toplantı Tarihi: \(user3.girilenTarih) "
                        isimBilgiLabel.text = "Kurucunun İsmi: \(user3.girilenKurucuIsim)"
                    
                }
            }
        for user5 in kullaniciUser {
            if user5.kodSifre == sifreBilgi {
                dte = user5.kullanicimDate
                name = user5.kullanicimName
                tableView6.reloadData()
            }
            
        }
        
           
        }
    
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return name.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
           
            cell.textLabel?.text = "İsim:\(name[indexPath.row]) ----- Tarih:\(dte[indexPath.row])"
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {  // soldan sağa çekince siler
            
            if editingStyle == .delete {
                name.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)  // fade kararma animasyonu
            }
        
    }
    
    
    
    
   


}
