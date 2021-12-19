//
//  detailVC.swift
//  WeatherKalinichev
//
//  Created by user on 19.12.2021.
//

import UIKit
import Alamofire
import SwiftyJSON
struct Cities {
    var city = ""
    var Temp = 0.0
}
var TempArray:[Cities] = []

class detailVC: UIViewController {
    var city = ""
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var tempLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let colorTop = UIColor(red: 89/255, green: 156/255, blue: 169/255, alpha:1.0).cgColor
        let colorBottom =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha:1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    func currentWeather(city: String){
       let url = "http://api.weatherapi.com/v1/current/.json?key=c0ed8d8cb3c14603bbd103202211810&q=\(city)"
       AF.request(url, method: .get).validate().responseJSON { response in
           
           switch response.result {
           case .success(let value):
               let json = JSON(value)
               let name = json["location"]["name"].stringValue
               let temp = json["current"]["temp_c"].doubleValue
               let country = json["location"]["country"].stringValue
            let weatherURLString = "https:\(json["location"][0]["icon"].stringValue)"
               
           case .failure(let error):
               print(error)
           }
       }
   }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
