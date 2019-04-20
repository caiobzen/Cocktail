public class Fetcher {
    
    let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetch(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        urlSession.dataTask(with: endpoint.url) { data, _, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}

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

struct ResponseError: Codable {

}
