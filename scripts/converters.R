fahr_to_kelvin <- function(temperature_f) {
  kelvin <- (temperature_f  - 32) * ( 5/9) + 273.15
  return(kelvin)
}

kelvin_to_celsius <- function(temperature_k){
  celsius <- temperature_k - 273.15
  return(celsius)
}

