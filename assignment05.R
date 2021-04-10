# Q1
elec_gen <- read.csv("./Data/electricity_generation_per_person.csv", header = TRUE)
year_value <- substr(names(elec_gen[, 2:ncol(elec_gen)]),2,5)
column_value <- c("country", year_value)
colnames(elec_gen) <- column_value
View(elec_gen)

# Q2
elec_use <- read.csv("./Data/electricity_use_per_person.csv", header = TRUE)
year_value <- substr(names(elec_use[, 2:ncol(elec_use)]),2,5)
column_value <- c("country", year_value)
colnames(elec_use) <- column_value
View(elec_use)

# Q3
install.packages("tidyr")
library(tidyr)

elec_gen_df = gather(elec_gen, -country, key = "year", value = "Electricity_Generation")
elec_gen_df <- elec_gen_df %>% drop_na()
View(elec_gen_df)

elec_use_df = gather(elec_use, -country, key = "year", value = "Electricity_Use")
elec_use_df <- elec_use_df %>% drop_na()
View(elec_use_df)

merged_electricity <- merge(elec_gen_df, elec_use_df)
View(merged_electricity)

# Q4
# 필요한 데이터 로드 및 불필요한 문자 제거 작업
adult_female <- read.csv("./Data/literacy_rate_adult_female_percent_of_females_ages_15_above.csv", header = TRUE)
year_value <- substr(names(adult_female[, 2:ncol(adult_female)]),2,5)
column_value <- c("country", year_value)
colnames(adult_female)<- column_value

adult_male <- read.csv("./Data/literacy_rate_adult_male_percent_of_males_ages_15_and_above.csv", header = TRUE)
year_value <- substr(names(adult_male[, 2:ncol(adult_male)]),2,5)
column_value <- c("country", year_value)
colnames(adult_male)<- column_value

adult_total <- read.csv("./Data/literacy_rate_adult_total_percent_of_people_ages_15_and_above.csv", header = TRUE)
year_value <- substr(names(adult_total[, 2:ncol(adult_total)]),2,5)
column_value <- c("country", year_value)
colnames(adult_total)<- column_value

youth_female <- read.csv("./Data/literacy_rate_youth_female_percent_of_females_ages_15_24.csv", header = TRUE)
year_value <- substr(names(youth_female[, 2:ncol(youth_female)]),2,5)
column_value <- c("country", year_value)
colnames(youth_female)<- column_value

youth_male <- read.csv("./Data/literacy_rate_youth_male_percent_of_males_ages_15_24.csv", header = TRUE)
year_value <- substr(names(youth_male[, 2:ncol(youth_male)]),2,5)
column_value <- c("country", year_value)
colnames(youth_male)<- column_value

youth_total <- read.csv("./Data/literacy_rate_youth_total_percent_of_people_ages_15_24.csv", header = TRUE)
year_value <- substr(names(youth_total[, 2:ncol(youth_total)]),2,5)
column_value <- c("country", year_value)
colnames(youth_total)<- column_value

# Q5
adult_female_df = gather(adult_female, -country, key = "year", value = "adult_female")
adult_male_df = gather(adult_male, -country, key = "year", value = "adult_male")
adult_total_df = gather(adult_total, -country, key = "year", value = "adult_total")
youth_female_df = gather(youth_female, -country, key = "year", value = "youth_female")
youth_male_df = gather(youth_male, -country, key = "year", value = "youth_male")
youth_total_df = gather(youth_total, -country, key = "year", value = "youth_total")

# 모든 관측치 공통 자료 기준으로 합병 (inner join)
library(dplyr)
first_join <- inner_join(adult_female_df, adult_male_df, 
                         by = c("country", "year"))
second_join <- inner_join(first_join, adult_total_df, 
                          by = c("country", "year"))
third_join <- inner_join(second_join, youth_female_df, 
                         by = c("country", "year"))
fourth_join <- inner_join(third_join, youth_male_df, 
                          by = c("country", "year"))
final_join <- inner_join(fourth_join, youth_total_df, 
                         by = c("country", "year"))
colnames(final_join)<- c("country", "year", "adult_female", 
                         "adult_male", "adult_total", "youth_female", 
                         "youth_male", "youth_total")

# na 관측치 삭제
library(tidyr)
literacy_final <- final_join %>% drop_na()

View(literacy_final)

# 최종 결과물 na 값 여부와 사이즈 확인
# apply(literacy_final, 2, function(x) any(is.na(x)))
# nrow(literacy_final)
# ncol(literacy_final)

