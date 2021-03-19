english <- c(90,80,60,70)
english

math <- c(50,60,100,20)
math

#english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm

#학생 반에 대한 정보가 추가된 데이터 프레임 생성
class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

#분석하기
mean(df_midterm$english)
mean(df_midterm$math)

#데이터 프레임 한번에 만들기
df_midterm <- data.frame(english= c(90,80,60,70),
                         math=c(50,60,100,20),
                         class=c(1,1,2,2))
df_midterm

#혼자서 해보기
df_fruits <- data.frame(product=c("사과", "딸기", "수박"),
                        price=c(1800,1500,3000),
                        quantity=c(24,38,13))
df_fruits
mean(df_fruits$price)
mean(df_fruits$quantity)