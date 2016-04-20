//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Luke Morse on 4/19/16.
//  Copyright © 2016 Luke Morse. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var evoLabel: UILabel!
    
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        idLabel.text = "\(pokemon.pokedexId)"
        attackLabel.text = pokemon.attack
        
        if pokemon.nextEvoId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            
            var str = "Next Evolution: \(pokemon.nextEvoTxt)"
            
            if pokemon.nextEvoLvl != "" {
                str += " - LVL \(pokemon.nextEvoLvl)"
            }
        }
    }
    
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
}
