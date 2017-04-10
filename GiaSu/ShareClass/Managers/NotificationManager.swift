//
//  NotificationManager.swift
//  Bartr
//
//  Created by Thuy Luong on 6/26/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
//import FirebaseDatabase

enum NotificationPayloadCode: String {
    case NewOffer = "1"
    case Message = "2"
    case Flight = "3"
    case Accommodation  = "32"
    case Transportation = "33"
    case Activity = "34"
    
    case AccommodationOfferSuggest = "35"
    case TransportationSuggest = "36"
    case ActivitySuggest = "37"

    case AccommodationOfferImprove = "40"
    case TransportationOfferImprove = "41"
    case ActivityOfferImprove = "42"
    
    case AccommodationOfferNoAction = "43"
    case TransportationOfferNoAction = "44"
    case ActivityOfferNoAction = "45"
    
}

class NotificationManager {
/*
    static func handleNotificationWithUserInfo(_ userInfo:  [AnyHashable: Any]) {
        if let code = userInfo["Code"] as? String {
            if code == NotificationPayloadCode.Flight.rawValue {
                var flightNotificationData = [String: AnyObject]()
                
                if let dataString = userInfo["Data"] as? String {
                    if let data = convertStringToDictionary(dataString),
                        let flightOfferId = data["FlightOfferId"] as? String,
                        let tripProfileId = data["TripProfileId"] as? String {
                        
                        flightNotificationData["FlightOfferId"] = flightOfferId as AnyObject?
                        flightNotificationData["TripProfileId"] = Int(tripProfileId) as AnyObject?
                    }
                }
                
                if let message = userInfo["Message"] as? String {
                    flightNotificationData["Message"] = message as AnyObject?
                }
                
                flightNotificationData["Code"] = code as AnyObject?
                
                NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notification.Flight), object: nil, userInfo: flightNotificationData)
            } else  if code == NotificationPayloadCode.Accommodation.rawValue ||
                code == NotificationPayloadCode.Transportation.rawValue ||
                code == NotificationPayloadCode.Activity.rawValue ||
                code == NotificationPayloadCode.AccommodationOfferImprove.rawValue ||
                code == NotificationPayloadCode.TransportationOfferImprove.rawValue ||
                code == NotificationPayloadCode.ActivityOfferImprove.rawValue ||
                code == NotificationPayloadCode.AccommodationOfferNoAction.rawValue ||
                code == NotificationPayloadCode.TransportationOfferNoAction.rawValue ||
                code == NotificationPayloadCode.ActivityOfferNoAction.rawValue {
                
                var accommodationOfferData = [String: AnyObject]()
//                if let data = userInfo["Data"] as? [String: AnyObject] {
//                    print("dataPushValue \(data)")
//                }
                
                
                if let dataString = userInfo["Data"] as? String{
                    if let data =  convertStringToDictionary(dataString) {
                        accommodationOfferData = data
                        
                        if let message = userInfo["Message"] as? String {
                            accommodationOfferData["Message"] = message as AnyObject?
                        }
                        accommodationOfferData["Code"] = code as AnyObject?
                        
                        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notification.AccommodationOffer), object: nil, userInfo: accommodationOfferData)
                    }
                }
            } else if code == NotificationPayloadCode.AccommodationOfferSuggest.rawValue ||
                code == NotificationPayloadCode.TransportationSuggest.rawValue ||
                code == NotificationPayloadCode.ActivitySuggest.rawValue {
                 var accommodationOfferData = [String: AnyObject]()
                
                if let dataString = userInfo["Data"] as? String{
                    if let data =  convertStringToDictionary(dataString) {
                        accommodationOfferData = data
                        
                        if let message = userInfo["Message"] as? String {
                            accommodationOfferData["Message"] = message as AnyObject?
                        }
                        accommodationOfferData["Code"] = code as AnyObject?
                        
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notification.AccommodationOffer), object: nil, userInfo: accommodationOfferData)
                    }
                }
            }
        }
    }
    
    static func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    */
}
