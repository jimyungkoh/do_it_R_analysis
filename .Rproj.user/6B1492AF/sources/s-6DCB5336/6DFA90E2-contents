library(readxl)

df_exam <- read_excel("data/excel_exam.xlsx")
df_exam

mean(df_exam$english)

mean(df_exam$science)

#파일 첫 번째 행이 변수명이 아니라면...

df_exam_novar <- read_excel("data/excel_exam_novar.xlsx")
df_exam_novar

##col_names=F 파라미터를 설정해 첫번째 행을 데이터로 인식해 불러옴
##(데이터 유실 방지)
df_exam_novar <- read_excel("data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

#엑셀 파일에 시트가 여러 개 있다면?(세 번째 시트에 있는 데이터 불러오기)
df_exam_sheet <- read_excel("data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

#csv파일 불러오기
##첫번째 행에 변수명이 없는 csv 파일은 'header=F' 파라미터 지정할 것
##문자가 들어있는 파일을 불러올 때는 stringAsFactors=F
df_csv_exam <- read.csv("data/csv_exam.csv", stringsAsFactors = F)
df_csv_exam

#데이터 프레임을 CSV 파일로 저장하기
df_midterm <- data.frame(english=c(90, 80, 60, 70),
                         math=c(50, 60, 100, 20),
                         class=c(1,1,2,2))
df_midterm
write.csv(df_midterm, file="data/df_midterm.csv")

#RDS 파일 활용하기
saveRDS(df_midterm, file="df_midterm.rds")
rm(df_midterm)
df_midterm
df_midterm <- readRDS("df_midterm.rds")
df_midterm