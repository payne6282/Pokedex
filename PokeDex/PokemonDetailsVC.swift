//
//  PokemonDetailsVC.swift
//  PokeDex
//
//  Created by newmac on 5/11/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import UIKit
import Alamofire


class PokemonDetailsVC: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var descImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var PokeIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var nextEvolutionLabel: UILabel!
    @IBOutlet weak var currentEvlnImage: UIImageView!
    @IBOutlet weak var nextEvlnImage: UIImageView!
    
    @IBOutlet var pokemonDetailsVC: UIView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemon.downloadPokeData {
            
            self.updateUI()
            
        }
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        descImage.image = img
        PokeIdLabel.text = "\(pokemon.pokedexId)"
        textLabel.text = pokemon.name
        currentEvlnImage.image = img
        let nextImage = ((pokemon.pokedexId) + 1)
        let evolvedImg = UIImage(named: "\(nextImage)")
        nextEvlnImage.image = evolvedImg
        
    }
    
    func updateLabel() {
        
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        
        defenseLabel.text = pokemon.pokeDefense
        heightLabel.text = pokemon.pokeHeight
        weightLabel.text = pokemon.pokeWeight
        baseAttackLabel.text = pokemon.pokeBaseAttack
        typeLabel.text = pokemon.pokeType
        descLabel.text = pokemon.pokeDesc
        
    }
    
    
}
