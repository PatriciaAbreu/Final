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
        
        let exercicios = dict.objectForKey("exercicios") as! NSArray
        
        let exercicio = exercicios.objectAtIndex(exercicio) as! NSDictionary
        
        let audios = exercicio.objectForKey("audio") as! NSDictionary
        
        let audio = audios.objectForKey(audio) as! NSString
        
        return audio as String
        
}

    func getVideo(exercicio: Int, video: String) -> String {
        
        let path: NSString = NSBundle.mainBundle().pathForResource("exercicios", ofType: "json")!
        let data: NSData = try! NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
        let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        
        let exercicios = dict.objectForKey("exercicios") as! NSArray
        
        let exercicio = exercicios.objectAtIndex(exercicio) as! NSDictionary
        
        let videos = exercicio.objectForKey("video") as! NSDictionary
        
        let video = videos.objectForKey(video) as! NSString
        
        return video as String
    }
    
    
}