rm(list=ls())

# 3장 줄기와 잎
setwd("c://")
exam1 <- read.table("exam1.txt", header=T)

# 자료형 확인
str(exam1)
summary(exam1)

# 변수 고정
attach(exam1)

# 줄기와 잎그림
stem(score)

# 줄기 조절
stem(score, scale=0.5)
stem(score, scale=2) 

# stem.leaf{score, ...  }
# install.packages("aplpack")
# library(aplpack)

# stem.leaf(score,m=1, depth=F,Min=20,Max=70,trim.outlier=T) 
# m = 1,2,... : 한개의 줄기를 몇개로 나눌건지
# depth=F or T : 누적도수 끄기
# Min=10,20,..., Max=10,20,... : 줄기의 최소 최대 설정하기
# trim.outlier=T or F : 최대, 최소를 벗어나는 예외값 표시하기

# stem.leaf(score,unit=1)
# stem.leaf(score,unit=10)
# stem.leaf(score,unit=40)

# hist
hist(score, nclass=20) # 구간의 갯수 정하기
hist(score, breaks=c(0,20,25,30,40,50,60,100)) # 임의의 구간 나누기