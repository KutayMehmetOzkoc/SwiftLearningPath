//
//  Musicians.swift
//  OOP
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import Foundation

enum MusicianTypes {
    case Guitarist
    case Violinist
    case Bassist
    case Drummer
}

class Musicians {
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianTypes
    
    
    // constructor
    init(name: String, age: Int, instrument: String, type: MusicianTypes) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
    }
    func chooseMusic(songName:String){
        print("Song Name : " + songName)
    }
    // only this class can access this method
    private func isNormalMusician(name: String){
        print(name + " is a normal musician")
    }
    
}
