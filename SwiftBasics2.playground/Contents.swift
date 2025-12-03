import UIKit


//Only one type array
var favoriteMovies = [
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "12 Angry Men"
]



// Any object
var favoriteMixData = [
    "Kutay",
    12,
    12.5,
    true
] as [Any]

favoriteMovies[0].uppercased() // we can use this because this array is String array
favoriteMixData.count
favoriteMovies[favoriteMovies.count - 2]
favoriteMovies.last
favoriteMovies.first
favoriteMovies.sort()
