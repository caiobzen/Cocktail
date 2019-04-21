public struct Cocktail: Codable {
    public let id: String
    public let name: String
    public let category: String
    public let alcoholic: String
    public let thumbUrl: String
    public let tagsString: String?
    public let glass: String
    
    public let instructions: String
    public let ingredient1: String
    public let ingredient2: String
    public let ingredient3: String
    public let ingredient4: String
    public let ingredient5: String
    public let ingredient6: String
    public let ingredient7: String
    public let ingredient8: String
    public let ingredient9: String
    public let ingredient10: String
    public let ingredient11: String
    public let ingredient12: String
    public let ingredient13: String
    public let ingredient14: String
    public let ingredient15: String
    
    public let measure1: String
    public let measure2: String
    public let measure3: String
    public let measure4: String
    public let measure5: String
    public let measure6: String
    public let measure7: String
    public let measure8: String
    public let measure9: String
    public let measure10: String
    public let measure11: String
    public let measure12: String
    public let measure13: String
    public let measure14: String
    public let measure15: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case instructions = "strInstructions"
        case thumbUrl = "strDrinkThumb"
        case tagsString = "strTags"
        case glass = "strGlass"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
    }
}

extension Cocktail {
    var tags: [String] {
        return tagsString?.split{$0 == ","}.map(String.init) ?? []
    }
}
