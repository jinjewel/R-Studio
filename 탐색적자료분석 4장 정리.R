# 4장 수치요약과 상자그림, 여러 그룹의 비교

# 자료 불러오기
setwd("c://")
exam1 <- read.table("exam1.txt", header=T)

# 자료 고정
attach(exam1)

str(exam1)
summary(exam1)
summary(exam1)[-4]
sd(score)
quantile(score, type=6)

# p 분위수
score.sort<-sort(score)
q.5 <- score.sort[33]
q.25 <- (1/3)*score.sort[16]+(2/3)*score.sort[17]
q.125 <- (1/2)*score.sort[8]+(1/2)*score.sort[9]
q.0625 <- (7/12)*score.sort[4]+(8/12)*score.sort[5]
c(q.5, q.25, q.125, q.0625)
quantile(score, c(1/2, 1/4, 1/8, 1/16), type=8)

# 상자그림
boxplot(score, horizontal=T)