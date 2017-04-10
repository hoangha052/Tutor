//
//  TinryNetworkProvider.swift
//  Tinry
//
//  Created by Thuy Luong on 8/9/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
//import RxSwift
import Gloss

class TinryNetworkProvider {
//    func insertTripProfile(_ tripProfile: TripProfile) -> Observable<TripProfileResponse?> {
//        let insertTripProfileUrl = TinryAPI.Tinry.insertTripProfile.urlString()
//        var bodyParams: [String: AnyObject] = tripProfile.toJSON()!
//        bodyParams["UserId"] = UserManager.sharedInstance.savedUser()?.userId! as AnyObject?
//        
//        return NetworkProvider().post(insertTripProfileUrl, params: bodyParams).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TripProfileResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func updateTripProfile(_ tripProfile: TripProfile) -> Observable<TripProfileResponse?> {
//        let updateTripProfileUrl = TinryAPI.Tinry.updateTripProfile.urlString()
//        var bodyParams: [String: AnyObject] = tripProfile.toJSON()!
//        bodyParams["UserId"] = UserManager.sharedInstance.savedUser()?.userId! as AnyObject?
//        
//        return NetworkProvider().post(updateTripProfileUrl, params: bodyParams).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TripProfileResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func skipTripProfile(_ tripProfileId: Int) -> Observable<TripProfileResponse?> {
//        let skipTripProfileUrl = TinryAPI.Tinry.skipTripProfile((UserManager.sharedInstance.savedUser()?.userId!)!,tripProfileId).urlString()
//        
//        return NetworkProvider().get(skipTripProfileUrl, params: nil).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TripProfileResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func fetchAllInterests() -> Observable<InterestResponse?> {
//        let getAllInterestsUrl = TinryAPI.Tinry.getAllInterests.urlString()
//        
//        return NetworkProvider().get(getAllInterestsUrl, params: nil).map {
//            response in
//            if let validResponse = response as? JSON {
//                return InterestResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func fetchTrips(_ tinryType: TinryType, index: Int, count: Int) -> Observable<TinryResponse?> {
//        let userId = UserManager.sharedInstance.savedUser()?.userId!
//        var getTripsUrl = String()
//        if tinryType == .current {
//            getTripsUrl = TinryAPI.Tinry.getCurrentTripsUrl(userId!, index, count).urlString()
//        }
//        else {
//            getTripsUrl = TinryAPI.Tinry.getPassTripsUrl(userId!, index, count).urlString()
//        }
//        return NetworkProvider().get(getTripsUrl, params: nil).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TinryResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func getSearchTripProfile(_ location: Location, searchMode : SearchMode, index: Int) -> Observable<SearchTripProfileResponse?> {
//        let searchUrl = TinryAPI.Tinry.searchTripProfile(index, Constants.sizePageLoad).urlString()
//        var bodyParams: [String: AnyObject] = ["Location": location.toJSON()! as AnyObject]
//        let userId = UserManager.sharedInstance.savedUser()?.userId!
//        bodyParams["UserId"] = userId as AnyObject?
//        
//        switch searchMode {
//        case .flight:
//             bodyParams["IsFlightSearch"] = true as AnyObject?
//            break
//        case .activity:
//            bodyParams["IsActivitySearch"] = true as AnyObject?
//            break
//        case .logding:
//            bodyParams["IsAccSearch"] = true as AnyObject?
//            break
//        case .car:
//            bodyParams["IsTranSearch"] = true as AnyObject?
//            break
//        }
//
//        if let filter = FilterManager.shared().getFilterManager() {
//            if let distance =  filter.distance {
//                bodyParams["Distance"] = distance as AnyObject?
//            }
//            
//            if let budget =  filter.budget {
//                bodyParams["BudgetType"] = budget as AnyObject?
//            }
//            
//            if let hashTag =  filter.hashtag {
//                bodyParams["Hashtag"] = hashTag as AnyObject?
//            }
//            
//            if let startDate =  filter.fromDate {
//                bodyParams["FromDate"] = Date.stringFromDate(startDate, format: "yyyy-MM-dd'T'HH:mm:ss") as AnyObject?
//            }
//            
//            if let endDate =  filter.toDate {
//                bodyParams["ToDate"] =  Date.stringFromDate(endDate, format: "yyyy-MM-dd'T'HH:mm:ss") as AnyObject?
//            }
//            
//            if let ratting =  filter.ratting {
//                bodyParams["Rating"] = ratting as AnyObject?
//            }
//            
//            if let interest = filter.interest {
////                bodyParams["Interests"] = interest.toJSONArray()
//                var arrays: [Int] = []
//                interest.forEach({ item in
//                    if let id = item.interestId {
//                        arrays.append(id)
//                    }
//                })
//                bodyParams["Interests"] = arrays as AnyObject?
//                
////                if  let array:[Int]?  = interest.map({ $0.interestId!}) {
////                    bodyParams["Interests"] = array
////                }
//            }
//        }
//        
//        return NetworkProvider().post(searchUrl, params: bodyParams).map
//        {
//            response in
//            if let validResponse = response as? JSON {
//                return SearchTripProfileResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
////    func getSearchTripProfileTest(location: Location, interest: [Interest]?, searchMode : SearchMode) -> Observable<SearchTripProfileResponse?> {
////        let searchUrl = TinryAPI.Tinry.SearchTripProfile.urlString()
////        var bodyParams: [String: AnyObject] = ["Location": location.toJSON()!,
////                                               "IsFlightSearch": true,
////                                               "Interests":(interest?.toJSONArray())!]
////        bodyParams["IsAccSearch"] = false
////        
////        return NetworkProvider().post(searchUrl, params: [:], bodyParams: bodyParams).map
////            {
////                response in
////                if let validResponse = response as? JSON {
////                    return SearchTripProfileResponse(json: validResponse)
////                }
////                return nil
////        }
////    }
//    
//    func getTripProfileById(_ tripProfileId: Int) -> Observable<TripProfileResponse?> {
//        let updateTripProfileUrl = TinryAPI.Tinry.getTripProfileByID(tripProfileId).urlString()
//        
//        return NetworkProvider().get(updateTripProfileUrl, params:nil).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TripProfileResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func getTinryByTripProfileId(_ tripProfileId: Int) -> Observable<TinryResponse?> {
//        let getTinryDetailUrl = TinryAPI.Tinry.getTinryByTripProfileId(tripProfileId).urlString()
//        
//        return NetworkProvider().get(getTinryDetailUrl, params: nil).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TinryResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func updateTinry(_ tinry: Tinry) -> Observable<TinryResponse?> {
//        let updateTinryUrl = TinryAPI.Tinry.updateTinry.urlString()
//        let bodyParams = tinry.toJSON()
//        
//        return NetworkProvider().post(updateTinryUrl, params: bodyParams).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TinryResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func getLocationAirPort(_ keyValue: String) -> Observable<SearchLocationAirPortResponse?> {
//        
//        let getSkyLocationUrl = "http://partners.api.skyscanner.net/apiservices/autosuggest/v1.0/US/USD/en-GB/"
//        let params: [String: AnyObject] = ["query": keyValue as AnyObject,
//                    "apiKey": Constants.SKY_API_KEY as AnyObject]
//        
//        return NetworkProvider().getMethodWithParams(getSkyLocationUrl, params:params).map {
//            response in
//            if let validResponse = response as? JSON {
//                return SearchLocationAirPortResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    
//    func getGoogleLocation(_ keyValue: String) -> Observable<GoogleLocationResponse?> {
//        
//        let getLocationUrl = "http://maps.googleapis.com/maps/api/geocode/json"
//        let params: [String: AnyObject] = ["address": keyValue as AnyObject,
//                                           "sensor": true as AnyObject]
//        
//        return NetworkProvider().getMethodWithParams(getLocationUrl, params:params).map {
//            response in
//            if let validResponse = response as? JSON {
//                return GoogleLocationResponse(json: validResponse)
//            }
//            return nil
//        }
//    }

}
