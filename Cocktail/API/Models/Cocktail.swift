public struct Cocktail: Codable {
    public let name: String
    public let category: String
    public let alcoholic: String
    public let thumbUrl: String
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
    
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case instructions = "strInstructions"
        case thumbUrl = "strDrinkThumb"
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
    }
}
