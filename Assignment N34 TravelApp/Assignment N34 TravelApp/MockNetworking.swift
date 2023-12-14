//
//  MockNetworking.swift
//  Assignment N34 TravelApp
//
//  Created by tornike <parunashvili on 14.12.23.
//

import Foundation

// MARK: Destination Mock Data

final class DestinationService {
    static func getMockDestinations() -> [Destination] {
        let mockJSON = """
        [
            {
                "id": "1",
                "name": "Paris",
                "imageName": "paris",
                "description": "City of Love and Lights in France.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to Charles de Gaulle Airport."},
                    {"name": "Metro", "description": "Use the metro for local transport."},
                    {"name": "Walking", "description": "Explore the city on foot."}
                ],
                "mustSeeInfo": [
                    {"name": "Eiffel Tower", "description": "Iconic landmark of Paris."},
                    {"name": "Louvre Museum", "description": "Home to famous art collections."},
                ],
                "hotelInfo": [
                    {"name": "Luxury Hotel", "description": "Experience opulent accommodations."},
                    {"name": "Cozy Inn", "description": "A comfortable stay for every traveler."}
                ]
            },
            {
                "id": "2",
                "name": "Tokyo",
                "imageName": "tokyo",
                "description": "Metropolis of Japan.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to Narita/Haneda Airport."},
                    {"name": "Subway", "description": "Use the subway for local transport."},
                    {"name": "Bullet Train", "description": "Fast travel between cities."}
                ],
                "mustSeeInfo": [
                    {"name": "Senso-ji Temple", "description": "Tokyo's oldest temple."},
                    {"name": "Shibuya Crossing", "description": "Famous pedestrian crossing."},
                ],
                "hotelInfo": [
                    {"name": "5-Star Hotel", "description": "Luxurious stay with top-notch service."},
                    {"name": "Budget Hostel", "description": "Affordable lodging for backpackers."}
                ]
            },
            {
                "id": "3",
                "name": "New York City",
                "imageName": "nyc",
                "description": "The Big Apple in the USA.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to JFK/Newark Airport."},
                    {"name": "Subway", "description": "Extensive subway system for travel."},
                    {"name": "Yellow Cab", "description": "Iconic yellow taxis."}
                ],
                "mustSeeInfo": [
                    {"name": "Central Park", "description": "Urban oasis in the city."},
                    {"name": "Statue of Liberty", "description": "Symbol of freedom and democracy."},
                ],
                "hotelInfo": [
                    {"name": "Grand Hotel", "description": "Classic luxury with city views."},
                    {"name": "Economy Inn", "description": "Simple, affordable accommodation."}
                ]
            },
            {
                "id": "4",
                "name": "London",
                "imageName": "london",
                "description": "Historic and modern blend in the UK.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to Heathrow Airport."},
                    {"name": "Tube", "description": "Use the London Underground."},
                    {"name": "Double-decker Bus", "description": "Explore the city by bus."}
                ],
                "mustSeeInfo": [
                    {"name": "Buckingham Palace", "description": "Residence of the monarch."},
                    {"name": "British Museum", "description": "Showcasing human history and culture."},
                ],
                "hotelInfo": [
                    {"name": "Historic Hotel", "description": "Traditional stay with modern amenities."},
                    {"name": "Hostel", "description": "Ideal for budget-conscious travelers."}
                ]
            },
            {
                "id": "5",
                "name": "Dubai",
                "imageName": "dubai",
                "description": "City of opulence and futuristic architecture.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to Dubai International Airport."},
                    {"name": "Metro", "description": "Use the metro for local transport."},
                    {"name": "Taxi", "description": "Convenient taxis for travel."},
                    {"name": "Car Rental", "description": "Self-drive options available."}
                ],
                "mustSeeInfo": [
                    {"name": "Burj Khalifa", "description": "Tallest building in the world."},
                    {"name": "Palm Jumeirah", "description": "Iconic artificial archipelago."},
                ],
                "hotelInfo": [
                    {"name": "Luxury Resort", "description": "Opulent stay with lavish amenities."},
                    {"name": "Apartment Hotel", "description": "Spacious accommodations for families."}
                ]
            },
            {
                "id": "6",
                "name": "Rome",
                "imageName": "rome",
                "description": "Eternal City with ancient history.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to Leonardo da Vinci Airport."},
                    {"name": "Metro", "description": "Use the metro for local transport."},
                    {"name": "Walking", "description": "Explore the city's historic streets."}
                ],
                "mustSeeInfo": [
                    {"name": "Colosseum", "description": "Iconic amphitheater from Roman times."},
                    {"name": "Vatican City", "description": "Center of Catholicism and art."},
                ],
                "hotelInfo": [
                    {"name": "Historic Hotel", "description": "Stay in buildings with rich history."},
                    {"name": "Boutique Hotel", "description": "Charming and personalized stay."}
                ]
            },
            {
                "id": "7",
                "name": "Bangkok",
                "imageName": "bangkok",
                "description": "Vibrant city of Thailand.",
                "transportInfo": [
                    {"name": "Airplane", "description": "Fly to Suvarnabhumi Airport."},
                    {"name": "Skytrain", "description": "Use the Skytrain for convenient travel."},
                    {"name": "Tuk-Tuk", "description": "Explore in these iconic vehicles."},
                    {"name": "Boat", "description": "Navigate the city via its waterways."}
                ],
                "mustSeeInfo": [
                    {"name": "Grand Palace", "description": "Royal residence and temples."},
                    {"name": "Chatuchak Market", "description": "Massive weekend market."},
                ],
                "hotelInfo": [
                    {"name": "Riverside Hotel", "description": "Stay by the Chao Phraya River."},
                    {"name": "Budget Hostel", "description": "Affordable stay for backpackers."}
                ]
            }
        ]
        """
        
        let jsonData = mockJSON.data(using: .utf8)!
        
        do {
            let destinations = try JSONDecoder().decode([Destination].self, from: jsonData)
            return destinations
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
}
