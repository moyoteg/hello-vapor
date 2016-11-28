import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
	
	// http://0.0.0.0:8080
}



drop.get ("beers", Int.self) { request, beers in
	
	return try JSON(node: ["message": "Take one down, pass it around, \(beers - 1 ) bottles of beer on the wall..."])

	// http://0.0.0.0:8080/beers/8
	
}

drop.resource("posts", PostController())

drop.run()
