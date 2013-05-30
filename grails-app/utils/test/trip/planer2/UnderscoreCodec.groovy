package test.trip.planer2

class UnderscoreCodec {
	static encode = {target->
	  target.replaceAll(" ", "-")
	}
	
	static decode = {target->
	  target.replaceAll("-", " ")
	}
}