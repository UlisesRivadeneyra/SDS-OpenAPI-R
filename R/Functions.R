#' get_mortality_state
#'
#' This function return the mortality registers of a State from the selected state
#' from 2012-2020
#'
#' @param state State code provided by Secretaria de Salud dictionary 'ent_regis'
#' @return A data frame with the data
#' @export
get_mortality_state <- function(state){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-state?state=", state, sep="")
  data <- RJSONIO::fromJSON(content=url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}

#' get_mortality_state_year
#'
#' This function return the mortality registers of a State from the selected state
#' and the selected year
#'
#' @param state State code provided by Secretaria de Salud dictionary 'ent_regis'
#' @param year The desired year of the mortality registers 'anio_regis'
#' @return A data frame with the data
#' @export
get_mortality_state_year <- function(state,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-state?state=",
               state, "&year=", year,sep="")
  data <- RJSONIO::fromJSON(content=url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}

#' get_mortality_scholarship_year
#'
#' This function return the mortality of Mexico of a specific year and only
#' of a certain scholarship
#'
#' @param scholarship Scholarship code provided by Secretaria de Salud dictionary 'escolarida'
#' @param year The desired year of the mortality registers 'anio_regis'
#' @return A data frame with the data
#' @export
get_mortality_scholarship_year <- function(scholarship,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-scholarship-state?scholarship=",scholarship,
               "year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}

#' get_mortality_scholarship_state
#'
#' This function return the mortality of an specific state of Mexico with the
#' selected scholarship
#'
#' @param scholarship Scholarship code provided by Secretaria de Salud dictionary 'escolarida'
#' @param state State code provided by Secretaria de Salud dictionary 'ent_regis'
#' @export
get_mortality_scholarship_state <- function(scholarship,state){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-scholarship-state?scholarship=",scholarship,
               "&state=",state,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}

#'get_mortality_sex_year
#'
#'This function returns the mortality registers based on sex type and year
#'
#' @param sex sex code provided by Secretaria de Salud dictionary 'sexo'
#' @param year State code provided by Secretaria de Salud dictionary 'anio_regis'
#' @export
get_mortality_sex_year <- function(sex,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-sex-year?sex=",sex,
               "&year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)

}

#'get_mortality_sex_state
#'
#'Returns the mortality registers by sex type and specific state from Mexico
#'
#' @param sex sex code provided by Secretaria de Salud dictionary 'sexo'
#' @param state State code provided by Secretaria de Salud dictionary 'ent_regis'
#' @export
get_mortality_sex_state <- function(sex, state){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-sex-state?sex=",sex,
               "&state=",state,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}

#'get_mortality_medical_year
#'
#'Returns the mortality registers by medical attention received and specific state entity
#'
#' @param medical medical code provided by Secretaria de Salud dictionary 'asist_medi'
#' @param state State code provided by Secretaria de Salud dictionary 'ent_regis'
#' @export
get_mortality_medical_year <- function(sex,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-medical-year?medical=",sex,
               "&year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)

}# ERROR SERVICE

#'get_mortality_age_range
#'
#'Returns the mortality registers by age range from years 2012-2020
#'
#' @param age age range code provided by Secretaria de Salud dictionary 'edad_agru'
#' @export
get_mortality_age_range <- function(age){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-age-range?age=",age,sep="")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}

#'get_mortality_age_range_year
#'
#'Returns the mortality registers by age range and specific year (2012 - 2020)
#'
#' @param age age range provided by Secretaria de Salud dictionary 'edad_agru'
#' @param year year from 2012 - 2020 by Secretaria de Salud dictionary 'anio_regis'
#' @export
get_mortality_age_range_year <- function(age,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-age-range-year?age=",age
               ,"&year=",year,sep="")

  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}

#'get_top_morbidity
#'
#'Returns the mortality registers by top ten specific dicease  code provided
#'by Secretaria de Salud dictionary 'lista_mex' from years 2012 -2020
#' @export
get_top_morbidity <- function(){
  data <- RJSONIO::fromJSON(content ="https://mortalityopenapi.herokuapp.com/mortality/v.1/top-morbidity")
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Enfermedad"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}

#'get_top_morbidity_year
#'
#'Returns the mortality registers by top ten specific dicease code provided by
#'Secretaria de Salud dictionary 'lista_mex' and specific year(2012 -2020)
#' @param year year from 2012 - 2020 by Secretaria de Salud dictionary 'anio_regis'
#' @export
get_top_morbidity_year <- function(year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/top-morbidity-year?year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Enfermedad"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}

#'get_top_mortality_states
#'
#'Returns the mortality registers by top ten specific states codes provided by
#'Secretaria de Salud dictionary 'ent_regis' and years 2012 - 2020
#' @export
get_top_mortality_states <- function(){
  data <- RJSONIO::fromJSON(content = "https://mortalityopenapi.herokuapp.com/mortality/v.1/top-mortality-states")
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}

#'get_top_mortality_states_year
#'
#'Returns the mortality registers by top ten states and specific year.
#'Codes provided by Secretaria de Salud dictionary 'ent_regis' and specific year(2012 -2020)
#' @param year year from 2012 - 2020 by Secretaria de Salud dictionary 'anio_regis'
#' @export
get_top_mortality_states_year <- function(year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/top-mortality-states-year?year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}




