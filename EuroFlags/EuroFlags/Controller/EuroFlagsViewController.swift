//
//  EuroFlagsViewController.swift
//  EuroFlags
//
//  Created by Mohammad Hazimeh on 26/10/2024.
//

import UIKit
import SDWebImage

class EuroFlagsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var countryList : [CountryResult] = []
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCountriesFromServer()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: "EuroFlagsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "EuroFlagsCollectionViewCell")
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EuroFlagsCollectionViewCell", for: indexPath) as! EuroFlagsCollectionViewCell
        
        cell.layer.cornerRadius = cell.bounds.size.height / 12
        
        let country = countryList[indexPath.item]
        
        cell.countryNameLabel.text = country.name.common
        cell.countryCapitalLabel.text = country.capital.first
        cell.countryImageView.sd_setImage(with: URL(string: country.flags.png), completed: nil)
        
    
        
        

      
 
        
        return cell
        
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 180)
        
        
    }
    func getCountriesFromServer() {

        // Step 1: Declare the URL String
        let urlString = "https://restcountries.com/v3.1/region/europe"

        // step 2: We convert the url string to an actual URL in Swift
        guard let url = URL(string: urlString) else { return }

        // step 3: Call the request

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
               
                return
            }

            do {

                let countryResponse = try JSONDecoder().decode([CountryResult].self, from: data)

                self.countryList = countryResponse

                self.countryList.sort { $0.name.common < $1.name.common }
              
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()
                    
                
                  
                }


            } catch {
                print("Error couldn't retreive data")
            }

        }.resume()
    }
}
