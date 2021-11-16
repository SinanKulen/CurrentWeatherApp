//
//  TableViewController.swift
//  CurrentWeatherApp
//
//  Created by Sinan Kulen on 16.11.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var cityName = ""
    var tempWeather = ""
    var tempMaxWeather = ""
    var tempMinWeather = ""
    var pressureWeather = ""
    var humidityWeather = ""
    var feelsLikeWeather = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       getData()
    }

    func getData() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef") else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [self] data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                if let result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject] {
                    DispatchQueue.main.async(execute: {
                        guard let resultWeather = result["main"] as? [String:AnyObject] else { return }
                        if let  tempResult = resultWeather["temp"] as? Double {
                            let temp = Int(tempResult - 273.15)
                            self.tempWeather = String(temp)
                            print(tempWeather)
                        }
                        if let  tempMaxResult = resultWeather["temp_max"] as? Double {
                            let tempMax = Int(tempMaxResult - 273.15)
                            self.tempMaxWeather = String(tempMax)
                            print(tempMaxWeather)
                        }
                        if let tempMinResult = resultWeather["temp_min"] as? Double {
                            let tempMin = Int(tempMinResult - 273.15)
                            self.tempMinWeather = String(tempMin)
                            print(tempMinWeather)
                        }
                        if let pressureResult = resultWeather["pressure"] as? Int {
                            let pressure = pressureResult
                            self.pressureWeather = String(pressure)
                            
                        }
                        if let humidityResult = resultWeather["humidity"] as? Int {
                            let humidity = humidityResult
                            self.humidityWeather = String(humidity)
                        }
                        if let feelsLikeResult = resultWeather["feels_like"] as? Double {
                            let feelsLike = Int(feelsLikeResult - 273.15)
                            self.feelsLikeWeather = String(feelsLike)
                        }
                        tableView.reloadData()
                    })

                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.tempLabel.text = tempWeather
        cell.humidityLabel.text = humidityWeather
        cell.pressureLabel.text = pressureWeather
        cell.tempMaxLabel.text = tempMaxWeather
        cell.tempMinLabel.text = tempMinWeather
        cell.feelsLikeLabel.text = feelsLikeWeather
        return cell
    }
}
