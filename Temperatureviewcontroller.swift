//
//  Temperatureviewcontroller.swift
//  Weather
//
//  Created by Диас Адямов  on 26.12.2024.
//

import UIKit

class Temperatureviewcontroller: UIViewController {
    
    @IBOutlet weak var temperaturelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchtemperature()
    }
    
    func fetchtemperature() {
guard let url = URL(string:"https://api.open-meteo.com/v1/forecast?lattitude=59.9836300&longtitude=30.3144130&current_weather=true") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error {
                print ("Ошибка: \(error.localizedDescription)")
            } else if let data {
                let object = try? JSONDecoder ().decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    self.temperaturelabel.text = object?.current_weather.temperature.description
                }
            } else {
                print ("Неизвестная ошибка")
            }
                    }).resume()
    }

    @IBAction func dismissbuttonpressed(_ sender: Any) {
        dismiss(animated:true)
    }
}




