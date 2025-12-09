//
//  main.swift
//  OOP
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import Foundation

let james = Musicians(name: "James", age: 25, instrument: "Guitar", type: .Guitarist)
james.chooseMusic(songName: "Nothing Else Metters")
print(james.type)


let kirk = SuperMusician(name: "Kirk", age:55, instrument: "Guitar", type: .Guitarist)
kirk.chooseMusic(songName: "Fade To Black")
kirk.doesMakeSolo()
kirk.chooseMusic(songName: "One")
// SuperMusician use Musicians all attributes and methods and add itself methods
