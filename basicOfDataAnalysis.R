library(ggplot2)
library(dplyr)

exam <- read.csv("data/csv_exam.csv")

#데이터 앞부분 출력
head(exam)
head(exam, 10)

#데이터 뒷부분 출력
tail(exam)
tail(exam, 10)

#뷰어 창에서 데이터 확인하기
View(exam)

#데이터가 몇 행, 몇 열로 구성되어 있는지 알아보기
dim(exam)

#속성 파악하기
str(exam)

#요약 통계량 산출하기
summary(exam)

# mpg 데이터 파악하기
#: ggplot2 패키지의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)
##as.data.frame()은 데이터 속성을 데이터 프레임 형태로 바꾸는 함수임
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

#데이터 프레임 복사본 만들기
df_raw <- data.frame(var1= c(1,2,1),
                     var2= c(2,3,2))
df_raw

df_new <- df_raw
df_new

#변수명 바꾸기
df_new<-rename(df_new, v2=var2)
df_new

#변수 조합해 파생변수 만들기
df <- data.frame(var1=c(4,3,8),
                 var2=c(2,6,1))
df

df$var_sum <- df$var1+df$var2
df

df$var_mean <- (df$var1+df$var2)/2
df

#mpg 통합 연비 변수 만들기
mpg$total <- (mpg$cty+mpg$hwy)/2
head(mpg)
mean(mpg$total)

#조건문을 활용해 파생변수 만들기

##기준값 정하기
summary(mpg$total)
hist(mpg$total) ### mpg$total의 히스토그램 생성

##합격 판정 변수 만들기
mpg$test <- ifelse(mpg$total>=20, "pass", "fail")
head(mpg, 20)

##빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test) ### #table()함수는 데이터의 빈도를 보여준다.

##막대 그래프로 빈도 표현하기
qplot(mpg$test) ### qplot()은 값의 개수를 막대의 길이로 표현하는 기능을 한다.

#중첩 조건문 활용하기
## 세 가지 이상의 범주로 값을 부여하려면 ifelse() 안에 다시 ifelse를 넣는
## 형식으로 조건문을 중첩해 작성해야 한다: 중첩 조건문

##연비에 따라 세 가지 종류 등급을 부여해 grade 변수를 생성하는 코드
### total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total>=30, "A",
                    ifelse(mpg$total>=20, "B", "C"))
head(mpg,20)

##빈도표, 막대 그래프로 연비 등급 살펴보기
table(mpg$grade)
qplot(mpg$grade)

#원하는 만큼 범주 만들기
##A, B, C, D 등급 부여
mpg$grade2 <- ifelse(mpg$total>=30, "A",
                     ifelse(mpg$total>=25, "B",
                            ifelse(mpg$total>=20, "C", "D")))
table(mpg$grade2)
qplot(mpg$grade2)
