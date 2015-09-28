//
//  ExercicioJSON.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 01/09/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import UIKit

class ExercicioJSON: NSObject {
    
    func busca(){
        let jData = NSData(contentsOfFile: "exercicios.json")
        
        var arrayDeResultados = (try! NSJSONSerialization.JSONObjectWithData(jData!, options: NSJSONReadingOptions.MutableContainers)) as! NSArray
    }
    
    func getAudio(exercicio: Int, audio: String)-> String{
        
        let path: NSString = NSBundle.mainBundle().pathForResource("exercicios", ofType: "json")!
        let data: NSData = try! NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
        let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        print(dict)
        
        let exercicios = dict.objectForKey("exercicios") as! NSArray
        print(exercicios)
        
        let exercicio = exercicios.objectAtIndex(exercicio) as! NSDictionary
        print(exercicio)
        
        let audios = exercicio.objectForKey("audio") as! NSDictionary
        print(audios)
        
        let audio = audios.objectForKey(audio) as! NSString
        print(audio)
        
        return audio as String
        
}

    func getVideo(exercicio: Int, video: String) -> String {
        
        let path: NSString = NSBundle.mainBundle().pathForResource("exercicios", ofType: "json")!
        let data: NSData = try! NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
        let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        print(dict)
        
        let exercicios = dict.objectForKey("exercicios") as! NSArray
        print(exercicios)
        
        let exercicio = exercicios.objectAtIndex(exercicio) as! NSDictionary
        print(exercicio)
        
        let videos = exercicio.objectForKey("video") as! NSDictionary
        print(videos)
        
        let video = videos.objectForKey(video) as! NSString
        print(video)
        
        return video as String
    }
    
    
}