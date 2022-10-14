//
//  Utilities.swift
//  CollectionViewDemo
//
//  Created by admin on 15/09/22.
//

import Foundation
import UIKit


struct Animal {
    
    var name : String
    var picture : String
}

//global array
var domesticAnimals = [Animal(name: "Cat", picture: "cat" ),
                       Animal(name: "Buffalo", picture: "buffalo"),
                       Animal(name: "Camel", picture: "camel"),
                       Animal(name: "Cow", picture: "cow"),
                       Animal(name: "Duck", picture: "duck"),
                       Animal(name: "Hen", picture: "hen")]



var wildAnimals = [
                    Animal(name: "Elephant", picture: "elephant"),
                    Animal(name: "Fox", picture: "fox"),
                    Animal(name: "Hippo", picture: "hippo"),
                    Animal(name: "Kaola", picture: "kaola"),
                    Animal(name: "Tiger", picture: "tiger"),
                    Animal(name: "Monkey", picture: "monkey"),
                    Animal(name: "Panda", picture: "panda"),
                    Animal(name: "Zebra", picture: "zebra")]
