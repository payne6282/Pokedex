//
//  Pokemon.swift
//  PokeDex
//
//  Created by newmac on 5/9/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _pokeDesc: String!
    private var _pokeType: String!
    private var _pokeHeight: String!
    private var _pokeWeight: String!
    private var _pokeDefense: String!
    private var _pokePokedexId: String!
    private var _pokeBaseAttack: String!
    private var _pokeNextEvln: String!
    private var _pokeURL: String!
    
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    var pokeDesc: String {
        
        if _pokeDesc == nil {
            _pokeDesc = ""
        }
        return _pokeDesc
    }
    
    var pokeType: String {
        
        if _pokeType == nil {
            _pokeType = ""
        }
        return _pokeType
    }
    
    var pokeHeight: String {
        
        if _pokeHeight == nil {
            _pokeHeight = ""
        }
        return _pokeHeight
    }
    
    var pokeWeight: String {
        
        if _pokeWeight == nil {
            _pokeWeight = ""
        }
        return _pokeWeight
    }
    
    var pokeDefense: String {
        
        if _pokeDefense == nil {
            _pokeDefense = ""
        }
        return _pokeDefense
    }
    
    var pokePokedexId: String {
        
        if _pokePokedexId == nil {
            _pokePokedexId = ""
        }
        return _pokePokedexId
    }
    
    var pokeBaseAttack: String {
        
        if _pokeBaseAttack == nil {
            _pokeBaseAttack = ""
        }
        return _pokeBaseAttack
    }
    
    var pokeNextEvln: String {
        
        if _pokeNextEvln == nil {
            _pokeNextEvln = ""
        }
        return _pokeNextEvln
    }
    
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        self._pokeURL = "\(pokeURL_BASE)\(pokeURL_SUBSET)\(self.pokedexId)/"
        
    }
    
    func downloadPokeData(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokeURL).responseJSON {
            response in
            print("\(self._pokeURL)")
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    
                    self._pokeWeight = weight
                }
                
                if let height = dict["height"] as? String {
                    
                    self._pokeHeight = height
                    
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._pokeBaseAttack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._pokeDefense = "\(defense)"
                    
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] {
                    let brac = "/"
                    if self._pokeType != nil {
                        self._pokeType = ""
                    }
                    
                    for type in types {
                        
                        
                        if let name = type["name"] {
                            
                            self._pokeType = self._pokeType + brac + "\(name.capitalized)"
                            
                        }
                        
                    }
                    
                    self._pokeType.remove(at: self._pokeType.startIndex)
                    
                }
                else {
                    
                    self._pokeType = ""
                    
                }
                
                if let desc = dict["descriptions"] as? [Dictionary<String, AnyObject>] {
                    
                    var resourceURL = [String]()
                    for i in 0 ..< desc.count {
                        
                        if let resUrl = desc[i]["resource_uri"] as? String {
                            resourceURL.append(resUrl)
                        }
                        
                        
                    }
                    
                    let rand = arc4random_uniform(UInt32(desc.count))
                    let descURL = "\(pokeURL_BASE)" + "\(resourceURL[Int(rand)])"
                    
                    Alamofire.request(descURL).responseJSON {
                        
                        response in
                        
                        if let descApiUrl = response.result.value as? Dictionary<String, AnyObject> {
                            
                            if let description = descApiUrl["description"] as? String {
                                
                                self._pokeDesc = description
                                
                            }
                            completed()
                        }
                    }
                    
                }
                
            }
            
            completed()
        }
        completed()
        
    }
    
    
}


