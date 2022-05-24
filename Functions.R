get_mortality_state <- function(state){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-state?state=", state, sep="")
  data <- RJSONIO::fromJSON(content=url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}


get_mortality_state_year <- function(state,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-state?state=", 
               state, "&year=", year,sep="")
  data <- RJSONIO::fromJSON(content=url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}


get_mortality_scolarship_year <- function(scholarship,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-scholarship-state?scholarship=",scholarship,
               "year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}


get_mortality_scolarship_state <- function(scholarship,state){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-scholarship-state?scholarship=",scholarship,
               "&state=",state,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}


get_mortality_sex_year <- function(sex,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-sex-year?sex=",sex,
               "&year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
  
}


get_mortality_sex_state <- function(sex, state){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-sex-state?sex=",sex,
               "&state=",state,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}


get_mortality_medical_year <- function(sex,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-medical-year?medical=",sex,
               "&year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
  
}# ERROR SERVICE


get_mortality_age_range <- function(age){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-age-range?age=",age,sep="")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}


get_mortality_age_range_year <- function(age,year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/mortality-age-range-year?age=",age
               ,"&year=",year,sep="")
  
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- rbindlist(data,fill = T)
  return(data_frame)
}


get_top_morbidity <- function(){
  data <- RJSONIO::fromJSON(content ="https://mortalityopenapi.herokuapp.com/mortality/v.1/top-morbidity")
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Enfermedad"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}


get_top_morbidity_year <- function(year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/top-morbidity-year?year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Enfermedad"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}


get_top_mortality_states <- function(){
  data <- RJSONIO::fromJSON(content = "https://mortalityopenapi.herokuapp.com/mortality/v.1/top-mortality-states")
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}


get_top_mortality_states_year <- function(year){
  url <- paste("https://mortalityopenapi.herokuapp.com/mortality/v.1/top-mortality-states-year?year=",year,sep = "")
  data <- RJSONIO::fromJSON(content = url)
  data_frame <- do.call(rbind.data.frame, data)
  colnames(data_frame)[1]="Estado"
  colnames(data_frame)[2]="Cantidad de muertes"
  return(data_frame)
}




