//
//  PokemonCollectionVC.swift
//  PokeDex
//
//  Created by newmac on 5/9/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import UIKit

class PokemonCollectionVC: UICollectionViewCell {
    
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 16.0
    }
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        nameLabel.text = self.pokemon.name.capitalized
        pokeImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
   
    
    
    
}
