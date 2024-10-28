//
//  EuroFlagsCollectionViewCell.swift
//  EuroFlags
//
//  Created by Mohammad Hazimeh on 26/10/2024.
//

import UIKit
import SDWebImage

class EuroFlagsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var countryImageView: UIImageView!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var countryCapitalLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    
        
        func setup(country: CountryResult){
            countryNameLabel.text = country.name.common
            
       
            
            if let url = URL(string:country.flags.png){
                self.countryImageView.sd_setImage(with: url)
            }
            
        }
        
        
        
    
    
}
