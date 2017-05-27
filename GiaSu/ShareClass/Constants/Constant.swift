//
//  Constatnt.swift
//  Bartr
//
//  Created by Thuy Luong on 5/13/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

struct Constants {
    static let GOOGLE_API_KEY = "AIzaSyDiV6P3ZeiQtgnciWtNL-WPi_5kwEVBiyg"
    static let SKY_API_KEY = "ti282203035892138371492205491142"
    static let FIREBASE = "developmentV2"
//    static let tabBarHeight: CGFloat = 49
    static let sizePageLoad = 10
    static let TinryKeychainService = "TinryKeychainService"
    static let TinryDeviceTokenKeychain = "TinryDeviceKeychain"
    
    struct Storyboard {
        static let authentication = "Authetication"
        static let search = "Search"
        static let main = "Main"
        static let calendar = "Calendar"
        static let tripProfile = "TripProfile"
        static let tinry = "Tinry"
        static let mylisting = "MyListing"
        static let offer = "Offer"
        static let imagePicker = "ImagePicker"
        static let mainProvider = "Provider"
        static let tripProvider = "TripProvider"
        static let setting = "Setting"
        static let booking = "Booking"
        static let message = "Messages"
    }
    
    struct Notification {
        static let ImagePickDone = "ImagePickDone"
        static let CancelSearching = "CancelSearching"
        static let UserDidLogout = "UserDidLogout"
        static let FCMTokenFetched = "FCMTokenFetched"
        static let DidGetTinryDetail = "DidGetTinryDetail"
        static let DidUpdateTripProfile = "DidUpdateTripProfile"
        static let DidAcceptFlightOffer = "DidAcceptFlightOffer"
        
        // Remote notification
        static let Flight = "Flight"
        static let AccommodationOffer = "AccommodationOffer"
        
        static let ReloadDataSearchTripProfile = "ReloadDataSearchTripProfile"
    }
    
    struct UserDefaultKey {
        static let facebookToken = "FACEBOOK_TOKEN"
        static let facebookEmail = "FACEBOOK_EMAIL"
        static let deviceToken = "DEVICE_TOKEN"
        static let newMessageCount = "NEWMESSAGECOUNT"
        static let firstStartApp = "IS_FIRST_START_APP"
        static let reloadMessage = "RELOADMESSAGE"
    }
}

struct AppColors {
    static let main = "#66C6BA"
    static let mainBackground = "#ebebeb"
    static let mainGray = "#959595"
    static let buttonNormalState = "#959595"
    static let buttonSelectedState = "#00aeef"
    static let requiredFieldSign = "#ed2a32"
    static let hashtagText = "#ffffff"
    static let searchFilterHeader = "#959595"
    static let textLightGray = "#898989"
    static let stuffHighlight = "#2fbaee"
    static let formText = "#545454"
    static let sectionHeaderBackground = "#e9e9e9"
    static let receivedOfferCellBackground = "#ffffff"
    static let sentOfferCellBackground = "#f4f4f4"
    static let tripProfilePlanning = "#F58027"
    static let tripProfileProcess = "#00447E"
    static let tripProfileTaken = "#FFFFFF"
    static let shadowTextColor = "#4c4c4c"
}
