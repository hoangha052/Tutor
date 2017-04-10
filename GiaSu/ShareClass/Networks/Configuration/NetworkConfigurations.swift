//
//  NetworkConfigurations.swift
//  Bartr
//
//  Created by Thuy Luong on 5/22/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

enum TinryAPI {
    
//    private static let stagingBaseURL = "http://5.9.155.139:6677/api/"
//    private static let stagingImageBaseUrl = "http://5.9.155.139:6677"
//    
//    private static let productionBaseURL = "http://5.9.155.139:6677/api/"
//    private static let productionImageBaseUrl = "http://5.9.155.139:6677"
    
    private static let stagingBaseURL = "http://5.9.155.139:32138/api/"
    private static let stagingImageBaseUrl = "http://5.9.155.139:32138"
    
    private static let productionBaseURL = "http://5.9.155.139:32138/api/"
    private static let productionImageBaseUrl = "http://5.9.155.139:32138"
    
    static var properBaseURL: String = {
        let isStagingVersion = Bundle.main.bundleIdentifier?.contains("staging")
        return isStagingVersion == true ? stagingBaseURL : productionBaseURL
    }()
    
    static var properImageBaseUrl: String = {
        let isStagingVersion = Bundle.main.bundleIdentifier?.contains("staging")
        return isStagingVersion == true ? stagingImageBaseUrl : productionImageBaseUrl
    }()
    
    enum User {
        case getEmail
        case getRecomendations
        case loginFacebook
        case register
        case updateTokens
        case updateCurrency
        case updateNotificationSetting
        case updatePayoutInfo
        case getTourisTransactionHistory(Int, Int, Int)
        case getProviderTransactionHistory (Int, Int, Int)
        case feedback
        
        fileprivate func apiPath() -> String {
            switch self {
            case .getEmail:
                return "/user/get_user_by_email"
            case .getRecomendations:
                return "/user/get_recommendations"
            case .loginFacebook:
                return "/user/login_with_facebook"
            case .register:
                return "/user/register"
            case .updateTokens:
                return "/user/update_device_token"
            case .updateCurrency:
                return "/user/update_user_setting"
            case .updateNotificationSetting:
                return "/user/update_user_notification"
            case .updatePayoutInfo:
                return "/payment/insert_payout_method"
            case .getTourisTransactionHistory(let userId, let offset, let pageSize):
                return "/transactions/get_transactions_for_tourist/\(userId)/\(offset)/\(pageSize)"
            case .getProviderTransactionHistory(let userId, let offset, let pageSize):
                return "/transactions/get_transactions_for_provider/\(userId)/\(offset)/\(pageSize)"
            case .feedback:
                return "/user/send_feedback"
            
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    
    enum Tinry {
        case insertTripProfile
        case updateTripProfile
        case skipTripProfile(Int, Int)
        case getAllInterests
        case getTinryByTripProfileId(Int)

        case searchTripProfile(Int, Int)
        case getCurrentTripsUrl(Int, Int, Int)
        case getPassTripsUrl(Int, Int, Int)
        case getTripProfileByID(Int)
        case updateTinry
        
        fileprivate func apiPath() -> String {
            switch self {
            case .insertTripProfile:
                return "/trip_profile/insert_trip_profile"
            case .updateTripProfile:
                return "/trip_profile/update_trip_profile"
            case .getAllInterests:
                return "/interest/get_all_interests"
            case .getTinryByTripProfileId(let tripProfileId):
                return "/trip_profile/get_tinry_by_trip_profile_id/\(tripProfileId)"

            case .searchTripProfile(let index, let size):
                return "/trip_profile/search_trip_profile/\(index)/\(size)"
            case .getCurrentTripsUrl(let userId, let index, let count):
                return "/trip_profile/get_current_trip_profiles_by_user_id/\(userId)/\(index)/\(count)"
            case .getPassTripsUrl(let userId, let index, let count):
                return "/trip_profile/get_past_trip_profiles_by_user_id/\(userId)/\(index)/\(count)"
            case .getTripProfileByID(let profileId):
                return "/trip_profile/get_trip_profile_by_id/\(profileId)"
            case .updateTinry:
                return "/trip_profile/update_tinry"
            case .skipTripProfile(let userId, let tripId):
                return "/trip_profile/skip_trip_profile/\(userId)/\(tripId)"
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
        
    }
    
    enum Offer {
        case getFlightOffersByUserId(Int, Int, Int)
        case getAccommodationOffers
        case getTransportationOffers
        case getActivityOffers
        
        case getSkyScannerFlightOffers
        case getSkyScannerAccommodationOffers
        case getFlightOfferDetail(String, Int)
        
        case acceptFlightOffer
        
        fileprivate func apiPath() -> String {
            switch self {
            case .getFlightOffersByUserId(let userId, let index, let count):
                return "/flight/get_flight_offers/\(userId)/\(index)/\(count)"
            case .getAccommodationOffers:
                return ""
            case .getTransportationOffers:
                return ""
            case .getActivityOffers:
                return ""
            case .getSkyScannerFlightOffers:
                return ""
            case .getSkyScannerAccommodationOffers:
                return ""
            case .getFlightOfferDetail(let flightOfferId, let tripProfileId):
                return "/flight/get_flight_by_price_id/\(flightOfferId)/\(tripProfileId)"
            case .acceptFlightOffer:
                return "/trip_profile/accept_flight_offer"
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    
    enum Filter {
        case insert
        case update
        case getByUserId
    }
    
    enum Order {
        case getOrderFromUserId
        case getOrderToUserId
        case getSingleOrderById
        case getTimeReports
        case getOrderByUserId
        case getOrders
    }
    
    enum Message {
        case getMessagesForStuff
        case getChatSession(Int)
        case insert
        case remove(Int)
        
        fileprivate func apiPath() -> String {
            switch self {
            case .getMessagesForStuff:
                return "/message/get_message_by_stuff_user"
            case .getChatSession(let messageId):
                return "/message/get_chat_session/\(messageId)"
            case .insert:
                return "/message/insert"
            case .remove(let messageId):
                return "/message/remove/\(messageId)"
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    
    enum ReservationOffers {
        case getAllFligthOffer(Int, Int, Int)
        case getAllAcommodationOffer(Int, Int, Int)
        case getAllTransportationOffer(Int, Int, Int)
        case getAllActivityOffer(Int, Int, Int)
        case getAllActivityFilter(Int, Int, Int, Int)
        case getAllBooking(Int, Int)
        case getAllAccommodationBooking()
        case getAllTransportationBooking()
        case getAllActivityBooking()
        case deleteAccommodationOffer(Int)
        case deleteTransportationOffer(Int)
        case deleteActivityOffer(Int)

        
        fileprivate func apiPath() -> String {
            switch self {
            case .getAllFligthOffer(let userId, let index, let count):
                return "/accommodation/get_accommodation_offers_for_provider/\(userId)/\(index)/\(count)"
            case .getAllAcommodationOffer(let userId, let index, let count):
                return "/accommodation/get_accommodation_offers_for_provider/\(userId)/\(index)/\(count)"
            case .getAllTransportationOffer(let userId, let index, let count):
                return "/transportation/get_transportation_offer_for_provider/\(userId)/\(index)/\(count)"
            case .getAllActivityOffer(let userId, let index, let count):
                return "/activity/get_activity_offer_for_provider/\(userId)/\(index)/\(count)"
            case .getAllActivityFilter(let tripId, let userId, let index, let count):
                return "/activity/get_activity_offer_for_provider_by_trip/\(tripId)/\(userId)/\(index)/\(count)"
                
            case .getAllBooking(let userId, let bookingType):
                return "/listing/get_booking_list/\(userId)/\(bookingType)"
                
            case .getAllAccommodationBooking():
                return "/listing/get_accommodation_offer_list_by_date"
            case .getAllTransportationBooking():
                return "/listing/get_transportation_offer_list_by_date"
            case .getAllActivityBooking():
                return "/listing/get_activity_offer_list_by_date"
                
            case .deleteAccommodationOffer(let offerId):
                return "/accommodation/delete_accommodation_offer/\(offerId)"
            case .deleteTransportationOffer(let offerId):
                return "/transportation/delete_transportation_offer/\(offerId)"
            case .deleteActivityOffer(let offerId):
                return "/activity/delete_activity_offer/\(offerId)"
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    
    enum AccommodationOffer {
        case createAcommodationOffer
        case updateAccommodationOffer
        case getAllAmenities
        case getAllMyListing(Int, Int, Int)
        case getAllMyBooking(Int, Int, Int)
        case getAllAccommodationOfferProvider(Int, Int, Int)
        case submitAccommodationOffer
        case touristGetAllAccommodationOffer(Int, Int, Int)
        case acceptAccommodationOffer
        case declineAccommodationOffer(Int, Int, Int)
        case getAccommodationOfferDetail(Int, Int)
        case getAccommodationDetailById(Int)
        
        
        fileprivate func apiPath() -> String {
            switch self {
            case .createAcommodationOffer:
                return "/accommodation/insert_accommodation_offer"
            case .updateAccommodationOffer:
                return "/accommodation/update_accommodation_offer"
                
            case .getAllAmenities:
                return "/accommodation/get_all_amenities"
            case .getAllMyListing(let userId, let index, let count):
                return "/listing/get_listing_by_user_id/\(userId)/\(index)/\(count)"
            case .getAllMyBooking(let userId, let index, let count):
                return "/listing/get_listing_by_user_id/\(userId)/\(index)/\(count)"
            case .submitAccommodationOffer:
                return "/accommodation/send_accommodation_offer_to_user"
            case .touristGetAllAccommodationOffer(let userId, let index, let count):
                 return "/accommodation/get_accommodation_offers_for_tourist/\(userId)/\(index)/\(count)"
            case .acceptAccommodationOffer:
                return "/accommodation/accept_accommodation_offer"
            case .getAllAccommodationOfferProvider(let userId, let index, let count):
                return "/accommodation/get_accommodation_offers_for_provider/\(userId)/\(index)/\(count)"
            case .declineAccommodationOffer(let userID, let slotID, let offerID):
                return "/accommodation/decline_accommodation_detail/\(userID)/\(slotID)/\(offerID)"
            case .getAccommodationOfferDetail(let slotID, let offerID):
                return "/accommodation/get_accommodation_detail/\(slotID)/\(offerID)"
            case .getAccommodationDetailById(let offerID):
                return "/accommodation/get_accommodation_offer_detail/\(offerID)"
            }
        }

        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    

    enum TransportOffer {
        case getAllTransportType
        case getAllFeature
        case getAllClass
        case getAllPickup
        case createTransportOffer
        case updateTransportOffer
        case getAllTransportOffer(Int, Int, Int)
        case submitTRansportOffer
        case touristGetAllTransportOffer(Int, Int, Int)
        case acceptTransportOffer
        case declineTransportOffer(Int, Int, Int)
        case getTransportOfferDetail(Int, Int)
        case getTransportDetailById(Int)
        
        fileprivate func apiPath() -> String {
            switch self {
            case .getAllTransportType:
                return "/transportation/get_all_types"
            case .getAllFeature:
                return "/transportation/get_all_features"
            case .getAllClass:
                return "/transportation/get_all_classes"
            case .getAllPickup:
                return "/transportation/get_all_pickups"
            case .createTransportOffer:
                return "/transportation/insert_transportation_offer"
            case .updateTransportOffer:
                return "transportation/update_transportation_offer"
            case .getAllTransportOffer(let userId, let index, let count):
                return "/transportation/get_transportation_offer_for_provider/\(userId)/\(index)/\(count)"
            case .submitTRansportOffer:
                return "/transportation/send_transportation_offer_to_user"
            case .touristGetAllTransportOffer(let userId, let index, let count):
                return "/transportation/get_transportation_offers_for_tourist/\(userId)/\(index)/\(count)"
            case .acceptTransportOffer:
                return "/transportation/accept_transportation_offer"
            case .declineTransportOffer(let userId, let slotId, let offerId):
                return "/transportation/decline_transportation_detail/\(userId)/\(slotId)/\(offerId)"
            case .getTransportOfferDetail(let slotId, let offerId):
                return "/transportation/get_transportation_detail/\(slotId)/\(offerId)"
            case .getTransportDetailById(let offerId):
                return "/transportation/get_transportation_offer_detail/\(offerId)"
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    
    
    enum ActivityOffer {
        case getAllActivityType
        case createActivityOffer
        case updateActivityOffer
        case getAllActivityOffer(Int, Int, Int)
        case touristGetAllActivityOffer(Int, Int, Int)
        case acceptActivityOffer
        case submitActivityOffer
        case getActivityTimeSlot(Int, Int)
        case declineActivityOffer(Int, Int, Int)
        case getActivityDetail(Int, Int)
        case getActivityOfferById(Int)

        fileprivate func apiPath() -> String {
            switch self {
            case .getAllActivityType:
                return "/activity/get_all_tour_type"
            case .updateActivityOffer:
                return "/activity/update_activity_offer"
            case .createActivityOffer:
                return "/activity/insert_activity_offer"
            case .getAllActivityOffer(let userId, let index, let count):
                return "/activity/get_activity_offer_for_provider/\(userId)/\(index)/\(count)"
            case .touristGetAllActivityOffer(let userId, let index, let count):
                return "/activity/get_activity_offer_for_tourist/\(userId)/\(index)/\(count)"
            case .acceptActivityOffer:
                return "/activity/accept_activity_offer"
            case .submitActivityOffer:
                return "/activity/send_activity_offer_to_user"
            case .getActivityTimeSlot(let tripId , let slotID):
                return "/trip_profile/get_activity_slots/\(tripId)/\(slotID)"
            case .declineActivityOffer(let userId, let slotId, let offerId):
                return "/activity/decline_activity_detail/\(userId)/\(slotId)/\(offerId)"
            case .getActivityDetail(let slotId, let offerId):
                return "/activity/get_activity_detail/\(slotId)/\(offerId)"
            case .getActivityOfferById(let offerId):
                return "/activity/get_activity_offer_detail/\(offerId)"
            }
        }
        
        func urlString() -> String {
            return TinryAPI.properBaseURL + apiPath()
        }
    }
    
    enum Shipment {
        case create
        case getRate
    }
    
}
