library(ggplot2)
library(dplyr)

#ggplot 2 패키지에는 미국 동북중부 437개 지경긔 인구통계 정보를 담은 midwest라는
#데이터가 들어 있다 midwest 데이터를 사용해 데이터 분석 문제 해결해 보세요

#문제1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 
#       특징을 파악하세요.
midwest <- as.data.frame(ggplot2:: midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

#문제2. poptotal(전체 인구) 변수를 total로, popasian(아시아 인구) 변수를 asian
#       으로 수정하세요.
midwest <- rename(midwest, total=poptotal)
midwest <- rename(midwest, asian=popasian)
head(midwest, 20)

#문제3. totla, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수
#       를 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.
midwest$ratio <- (midwest$asian/midwest$total)*100
hist(midwest$ratio)

#문제4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large",
#       그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
mean(midwest$ratio)

midwest$size <- ifelse(midwest$ratio>mean(midwest$ratio), "Large", "Small")
midwest$size

#문제5. "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대
#       그래프를 만들어 확인해 보세요.

table(midwest$size)

qplot(midwest$size)