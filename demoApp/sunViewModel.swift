import Foundation

class SunViewModel {

    
    var onDataReceived: ((SunResults) -> Void)?

    func fetchSunData() {

        guard let url = URL(string:
            "https://api.sunrisesunset.io/json?lat=38.907192&lng=-77.036873"
        ) else { return }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                print("Error:", error)
                return
            }

            guard let data = data else { return }

            do {
                let decoded = try JSONDecoder().decode(SunResponse.self, from: data)

                DispatchQueue.main.async {
                    self.onDataReceived?(decoded.results)
                }

            } catch {
                print("Decoding Error:", error)
            }

        }.resume()
    }
}
