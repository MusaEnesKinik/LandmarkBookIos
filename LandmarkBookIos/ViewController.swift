//
//  ViewController.swift
//  LandmarkBookIos
//
//  Created by L60809MAC on 22.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]() // landmarkNames adında boş bir String dizi oluşturduk
    var landmarkImages = [UIImage]() // landmark görsellerimizi kaydettiğimiz diziyi tanımladık
    var chozenLandmarkName = ""
    var chozenLandmarkImage = UIImage()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self //self viewController a referans
        tableView.dataSource = self // veri kaynağını viewController a eşitledik
        
        // Landmark verilerimiz
        
        //Dizideki isimleri ve görselleri aynı sıra ile tanımlıyoruz, diziler sıralı biçimde olduğu için isimle görseli aynı sıraya koyarak karışıklık olmasını önlüyoruz
        
        // landmarkName dizisinin içine tek tek isimleri ekliyoruz
        landmarkNames.append("Ahtamar")
        landmarkNames.append("Anıt Kabir")
        landmarkNames.append("Balıklı Göl")
        landmarkNames.append("Colesseum")
        landmarkNames.append("Galata Kulesi")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Tac Mahal")
        landmarkNames.append("Bursa Ulu Camii")
        
        // landmark görsellerimizi kaydettiğimiz diziyi yapıyoruz
        
        landmarkImages.append(UIImage(named: "ahtamar.jpeg")!) // ! koyarak görselin olduğuna eminiz diyoruz
        landmarkImages.append(UIImage(named: "anitkabir.jpeg")!)
        landmarkImages.append(UIImage(named: "balikligol.jpeg")!)
        landmarkImages.append(UIImage(named: "colesseum.jpeg")!)
        landmarkImages.append(UIImage(named: "galata.jpeg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpeg")!)
        landmarkImages.append(UIImage(named: "tacmahal.jpeg")!)
        landmarkImages.append(UIImage(named: "ulucamii.jpeg")!)
        
        navigationItem.title = "Kent Simgeleri" // Uygulama açıldığında navigation bar ın üzerinde bu başlık yazacak
        
    }
    
    // Veri Silmek İçin Hazır Fonksiyon Var ve Onu Kullanıyoruz
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete { // Eğer kullanıcı sola doğru çekip silmek istiyorsa
            landmarkNames.remove(at: indexPath.row) // landmarkNames den veriyi siler
            landmarkImages.remove(at: indexPath.row) // landmarkImages dan da veriyi siliyor
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade) // tableView den de siliyor
        }
        
    }

    // tableView kullanılan projelerin hempsinde ' UITableViewDelegate, UITableViewDataSource ' bu iki sınıf eklenmeli. Busınıflar eklendiğinde bir hata verecektir, hatanın sebebi de tableView kullanılan projede ' cellForRowAt ve numberOfRowsInsection ' fonksiyonları eklenmeli. Bu iki fonksiyon yazıldığında hata kaybolacaktır
    
    // Her bir sırada gösterilecek olan şey belirtiliyor; simgelerin hangi kentte olduğunu ve o simgenin görselini göstermek istiyoruz
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() // UITableViewCell sınıfından cell adında bir obje oluşturduk, bu objeyi kullanarak istenilen içerik gösterilebilir
        //cell.textLabel?.text = "Deneme" // numberOfRowsInSection fonc unda belirtilen satırların hepsinde "Deneme" yazar
        cell.textLabel?.text = landmarkNames[indexPath.row] // tableView da hangi satırdaysan dizide o satıra denk gelen sıradaki veri görünecek (tableView da 1. satırda dizinin 0. elemanı, sıralı şekilde görünecek)
        return cell
    }
    
    // tableView da kaç tane sıra olacağı burada belirtilir
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return 10 // 10 tane satır olacak anlamında
        return landmarkNames.count // landmarkNames.count //dizide kaç tane eleman olduğunu belirtir, landmarkNames.count (dizinin eleman sayısı kadar satır oluşturacak)
    }
    
    // viewController arası veri aktarımı
    // tabelView a tıklandığında imageViewControllar a geçip verinin resmini ve adını görmek için didSelectRowAt func kullanılır
    
    //SEçilince ne olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chozenLandmarkName = landmarkNames[indexPath.row] //tableView da seçilen yeri chosenLandmarkName in içine koydu
        chozenLandmarkImage = landmarkImages[indexPath.row] // tableView da seçilşen satırdaki yerin resmini chosenLandmarkImage değişkenine aktardı
        
        performSegue(withIdentifier: "toImageViewController", sender: nil) // tabelView a tıklandığında imageView a geçiyor
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue olmadan önce yapılacak işlemi yazıyoruz
        if segue.identifier == "toImageViewController" { // segue nin id sini kontrol ediyoruz
            //Karşıda ki viewController ı (imageViewController) bir değişkene tanımlıyoruz
            let destinationVC = segue.destination as! imageViewController // segue.destination u imageViewController olarak değişkene kaydet demek
            destinationVC.selectedLandmarkName = chozenLandmarkName // imageVieewController da ki seçilen yer ismine ulaşabiliyoruz
            destinationVC.selectedLandmarkImage = chozenLandmarkImage // imageVieewController da ki seçilen yer görseline ulaşabiliyoruz
        }
    }
    
}

