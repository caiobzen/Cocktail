struct CocktailResponse: Codable {
    let cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}
