struct Endpoint {
    let baseUrl: String = "https://www.thecocktaildb.com/api/json/v1/1/"
    let path: String
    let param: String
    
    var url: URL {
        let urlString = baseUrl + path + param
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return URL(string: encodedUrlString)!
    }
}
