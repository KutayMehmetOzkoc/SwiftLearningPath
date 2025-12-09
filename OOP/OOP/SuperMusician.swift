//
//  SuperMusician.swift
//  OOP
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import Foundation


class SuperMusician : Musicians{
    func doesMakeSolo(){
        print("Yes")
    }
    
    // Override and add attribute for Musician chooseMusic method
    override func chooseMusic(songName: String){
        print(name + " is going to choose \(songName)")
    }
}
