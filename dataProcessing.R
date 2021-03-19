# 데이터 전처리 - 원하는 형태로 데이터 가공하기
## dplyr  함수를 이용해 데이터를 가공하는 방법
## filter(): 행 추출 | select(): 열(변수) 추출 | arranger(): 정렬
## mutate(): 변수 추가 | summarise(): 통계치 산출 | group_by(): 집단별로 나누기
## left_join(): 데이터 합치기(열) | bind_rows(): 데이터 합치기(행)

#조건에 맞는 데이터만 추출하기
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

##exam에서 class가 1인 경우만 추출해 출력
exam %>% filter(class==1)
### dplyr 패키지는 %>% 기호를 이용해 함수들을 나열하는 방식으로 코드를 작성한다.
### 위 코드는 exam을 출력하되, class가 1인 행만 추출하라는 조건이 지정됌.
### filter() 함수에 조건을 입력하면 조건에 해당되는 행만 추출한다.

### 밑에 같은 방식으로 2반 학생만 추출해보세요.
exam %>% filter(class==2)

#초과, 미만, 이상, 이하 조건 걸기
exam %>% filter(math>50) ## 수학 점수가 50점을 초과한 경우
exam %>% filter(math<50) ## 수학 점수가 50점 미만인 경우
exam %>% filter(math>=50) ## 수학 점수가 50점 이상인 경우
exam %>% filter(math<=50) ## 수학 점수가 50점 이하인 경우

#여러 조건을 충족하는 행 추출하기
##1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class==1&math>=50)
##2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class==2&english>=80)

#여러 조건 중 하나 이상 충족하는 행 추출하기('or'을 의미하는 '|' 기호 이용)
##영어 점수가 90점 미만이거나 과학 점수가 50점 미만인 데이터를 추출하세요~
exam %>% filter(english<90 | science<50)

#목록에 해당하는 행 추출하기
##1,3,5반에 해당하면 추출
exam %>% filter(class==1|class==3|class==5)
###이때, %in%(매치 연산자) 기호를 사용하면
###코드를 좀 더 간편하게 작성할 수 있다!
exam %>% filter(class %in% c(1,3,5))

#추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class==1)
class2 <- exam %>% filter(class==2)
mean(class1$math)
mean(class2$math)

#내가 몰랐던 산술 연산가
##  %/%: 나눗셈의 몫
##  %%: 나눗셈의 나머지

#   혼자서 해보기(mpg 데이터를 이용한)
## Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다.
##      displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 
##      hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요
displ1 <- mpg %>% filter(displ<=4)
displ2 <- mpg %>% filter(displ>=5)
mean(displ1$hwy, na.rm =TRUE)
mean(displ2$hwy, na.rm = TRUE)

## Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와
##      "toyota"중 어느 manufacturer의 cty(도시 연비)가 평균적으로
##      더 높은지 알아보세요.
audi <- mpg %>% filter(manufacturer=="audi")
toyota <- mpg %>% filter(manufacturer=="toyota")
mean(audi$cty)
mean(toyota$cty)

## Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고
##      합니다. 이 회사들의 데이터를 추출한 후 hwy 전체 평균을 구하세요.
makers <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(makers$hwy)
