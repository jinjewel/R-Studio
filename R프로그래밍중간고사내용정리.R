rm(list=ls()) # 환경 초기화

### 벡터
a = c(1,2,3,4,5)
b = 1:5
a # : 1 2 3 4 5
b # : 1 2 3 4 5
class(a) # : "integer" 정수형
class(b) # : "numeric" 실수형

# 길이가 다른 벡터 연산(한쪽이 다른한쪽의 배수이면, 처음으로 돌아와서 계산, 아니면 콘솔 오류)
c = c(1:4)
d = 1:2
c+d # : 2 4 4 6

# : 함수 : 등차가 1인 수열을 생성해준다.
umm = -0.4:3.7
umm # -0.4  0.6  1.6  2.6  3.6 



### 행렬
# matrix(데이터, nrow=r, ncol=c) : c개의 열, r개의 행, byrow=F를 기본값으로 선언
# byrow=F : c(열)를 기준으로 데이터를 채움
# byrow=T : r(행)를 기준으로 데이터를 채움
hl_data = c(1:9)
matrix(hl_data, nrow=3, ncol=3)
matrix(hl_data, nrow=3, ncol=3, byrow=T)

# diag(데이터) : 데이터를 넣으면 대각원소 반환, 데이터를 직접 선언하면 데이터를 대각원소로 가지는 대각행렬 선언
A = matrix(1:4,2,2)
diag(1:5)
diag(A) # : 1 4
diag(rep(1,4)) # : n=4인 단위행렬

# solve(데이터) : 역행렬을 반환
solve(A)

# 변수[n] ; 변수라는 벡터에서 인덱싱할 때, n을 상수로 적어도 되고, 백터로 만들어서 대입해도 된다. 예) c(1,3,5)
a[c(1,2,3)]

# bind 함수
# rbind 함수 : 열로 묶어서 행렬을 만든다.
# cbind 함수 : 행으로 묶어서 행렬을 만든다.
c = 1:3
d = 4:6
rbind(c, d)
cbind(c, d)

# rowSums, lowSums 함수
row_cd = rbind(c, d)
sum(row_cd) # 전체 원소의 합
rowSums(row_cd) # 행 별로 합을 한다.
colSums(row_cd) # 열 별로 합을 한다

# 행렬계산
A = matrix(1:4,2,2)
B = matrix(5:8,2,2)
A * B # 각 요소의 계산 : 5 12 21 32 
A %*% B # 행렬곱 : 23 34 31 46



### 변수 선언 
# sample(range, size, replace) : range는 범위로 ':' 사용, size는 추출개수, replace는 복원 추출의 여부로 =T 혹은 =F로 표기
n = 300
x <- seq(-3,3,length=n)
y <- x^2 + x - 6
sample(a,3,replace = T) # : 5 4 3
sample(b,2) # : 2 4



### 출력 선언
# cat 함수 : 출력, print 함수랑 똑같음
# cat(출력할 문장)
for(i in 1:5){ 
  cat("\t",i)
} 



### 수열선언
# seq(c1,c2,c3) : c1는 시작값, c2는 끝값, c3는 간격, c3는 length=n 로 대체가능하다.
# length=n : n등분을 한다.
# rep(c, n) 함수 : c는 상수, n은 반복수, 똑같은 원소 수열 선언
seq(-1,1,0.01)
x <- seq(-5,5,length=n)
rep(1,5)



### 분포함수
# 이항분포
# binom(n,size,prob) : B(size,p)에 해당하는 이항분포를 n회 실행
rbinom(5,10,0.5) # : 정규분포 근사 모양의 확률로 뽑힘
rbinom(5,10,0.2) # : 카이제곱분포 근사 모양의 확률로 뽑힘

# 베르누이분포
rbinom(10,1,0.5)

# 포아송분포
# pois(n, lamba) : POISS(lamda)에 해당하는 포아송분포를 n번 실행
rpois(10,5)

# 기하분포
# geom(n, prob)
rgeom(10,0.3)

# 정규분포
# norm(n, mean, sd) : N(mean, sd)의 해당하는 정규분포에서 n번 실행
rnorm(10,5,2)
# 표준정규분포 : 기본값으로 설정
rnorm(10)



### 그래프 함수
# plot 함수 : 점 찍기
# type="p" : 점으로 표시, 기본값
# type="l" : 선으로 연결
# type="o" : 점선 같이 표시
# type="h" : 수직선으로 표시, 적분범위 나타낼때 사용
# lwd=c : c는 상수, 선의 두께 
# bty="n" : boxtype 박스를 지울려면 n 타입으로 그린다.
# bty="o","l","7","c","u" : L, 7, C, U 모양으로 테두리 생성
# xlim=c(s,f) : s:시작값 , f:끝값으로 하는 x의 범위를 정함
# ylim=c(s,f) : s:시작값 , f:끝값으로 하는 y의 범위를 정함
# plot(density(data)) : density로 입력하면 자료를 정리하여 선으로 그려진다.
# main="title" : 그래프 이름을 title로 작성한다.
# xlab="title" : x축에 이름을 title로 작성한다.
# ylab="title" : y축에 이름을 title로 작성한다. 
plot(x,y) 
plot(x,y,type="p")
plot(x,y,type="l")
plot(x,y,type="o")
plot(x,y,type="h")
plot(x,y,xlim=c(0, 10), ylim=c(0, 10),xlab="width", ylab="length", main="iris")
# hist 함수 : 히스토그램 그리기
# freq=T : y축을 누적도수로 표현, 기본값
# freq=F : y축을 상대도수로 표현
hist(y, freq=T) # 기본값
hist(y, freq=F)

# points 함수 : 이미 그려져 있는 그래프에서 점을 그리는 함수
# points(x좌표들, y좌표들) : 각 좌표들의 매칭되는 점들을 표시
# pch=n : 점의 형태, n은 0~25의 숫자로 나타낸다. 1:빈점, 19:꽉찬점
# cex=n : 점의 크기, n은 실수형으로 표기
# col="색상" : 점 테두리 색
# bg="색상" : 점 채우기 색
# type="p" : 점으로 표시, 기본값
# type="l" : 선으로 연결
# type="o" : 점선 같이 표시
# type="h" : 수직선으로 표시, 적분범위 나타낼때 사용
plot(0,xlim=c(0,10),ylim=c(0,10))
points(c(1,4,6),c(2,6,8),pch=7,cex=2,col="red")
points(c(1,4,6),c(2,6,8),type="h",pch=7,cex=2,col="red")

# lines 함수 : 이미 그려져 있는 그래프에서 선을 그리는 함수
# lines(c(x좌표들),c(y좌표들),col="색상",lwd=두께,lty=선의 형태)
# 0:투명선 , 1:실선 , 2:대쉬선 , 3:점선 , 4:점선+대쉬선 , 5:긴대쉬선 , 6:두개의 대쉬선
plot(x,y)
lines(c(1,2,3,4,5),c(5,6,7,8,9),lty=2)

# abline(a=0, b=0, col="gray") # b를 지나고, 기울기가 a인 직선을 그린다.
# h=0 : a=0, b=0 대신 수평선을 그을땐 
# v=0 : a=0, b=0 대신 수직선을 그을땐 
abline(a=0, b=0, col="gray")
abline(h=0, col="gray")
abline(v=0, col="red")

# legend 함수 : 범례 추가 함수
# legend("위치표현", legend=c(자료의 타이틀), col=c(색상), lty=c(선의 유무 표시), pch=c(점의 유무 표시)
# 위치표현: top, bottom , right, left 의 조합, 예) bottomright
# 자료의 타이틀 : "제목1","제목2","제목3" 등으로 표현
# 색상 : "색상1","색상2","색상3" 등으로 표현
# 선의 유무 표시 : 1이면 선 , NA는 없음으로 표현
# 점의 유무 표시 : 1이면 점 , NA는 없음으로 표현
legend("topright", # 위치를 표현, top, bottom , right, left
       legend = c("N(0, 1) pdf","critical line","refection region","Z(0.05)"),
       col = c("black", "blue", "lightblue", "red"),
       lty = c(1, 1, 1, NA), 
       pch = c(NA, NA, NA, 16)) 

# Sys.sleep 명령문
# Sys.sleep(시간) : 시간만큼 딜레이가 들어간다.
Sys.sleep(1) # : 1초의 딜레이가 생긴다.



### 밀도함수 구하기
# 정규분포 그리기
mu = 0
sigma = 1
n = 300
x <- seq(-3,3,length=n)
Fx = dnorm(x,mu,sigma)
plot(x,Fx,type="l",lwd=3.0,col="blue")
title("Standard Normal Dist")

# 카이스퀘어분포 그리기
n=300
df=10
x <- seq(0,50,length=n)
Fx <- dchisq(x,df)
plot(x,Fx,type="l",lwd=2.0,col="red")
title("Chi-square Dist")

# d,p,q,r 사용하기
dnorm(0) # : 0.3989423 밀도함수의 값
pnorm(-1.644854) # : 0.04999996 밀도함수의 누적값
qnorm(0.05) # : -1.644854 알파값에 해당하는 x값
rnorm(2) # : -0.6284609  0.7471787 랜덤으로 2개의 값을 뽑는다.

# 그래프 합쳐서 그리기
n = 500
data = rnorm(n, 2, 3)
Fx = dnorm(sort(data), 2, 3)
plot(density(data), bty="n")
hist(data, freq=F, bty="n") # 히스토그램
lines(density(data), col="Blue") # plot의 라인그리기
lines(sort(data), Fx, col="Red", lwd = 2) # 정규분포 그리기



### 추세선 적합 / 회귀분석
# 분석목표 : 적절한 관계를 잘 설명할 수 있는 a,b를 찾는 것

# lm 함수(linear model) : 회귀직선의 기울기와 y절편을 추정해주는 함수
# lm(y~x)
# x : 설명변수 , y : 반응변수
# data: (X1,Y1),(X2,Y2), ... ,(Xn,Yn)

## 1차원 회귀직선
# y = a + b*x + e(오차)
n = 300
x <- seq(-3,3,length=n)
a = 3 # 설명변수 x, 직선의 y절편을 보인다.
b = -2 # 반응변수 y, 직선의 기울기를 보인다.
e = rnorm(n, sd=3) # 표준편차가 3인 정규분포를 따르는 오차생성
y = a + b*x + e # 회귀분석 식

# 데이터 좌표 표시
plot(x,y,col="gray",bty="n")

# 회귀직선 그리기
abline(a,b,lwd=1.5)

# 데이터를 바탕으로 1차 회귀직선 추정하기
fit = lm(y~x) 
fit # intercept : 설명변수 x 추정값, x : 반응변수 y의 추정값
fit$coefficients # fit보다 자세한 a, b의 추정값을 반환한다.
fit$fitted.values # 추정한 a'와 b'으로 y의 값을 n번 계산
lines(x,fit$fitted.values,col="red") # n이 커질수록 회귀직선이 정확해진다.

# 범례
legend("topright",
       legend=c("data plot","ture line","linear trendline"),
       col=c("gray","black","red"),
       lty=c(NA,1,1),
       pch=c(19,NA,NA),bty="n")

## 2차원 회귀직선
# y = a + b*x + c*x^2 + e(오차)
n = 300
x <- seq(-3,3,length=n)
a = -3 
b = 2
c = 1
e = rnorm(n, sd=3) 
y = a + b*x + c*x^2 + e

# 데이터 좌표 표시
plot(x,y,col="gray",bty="n")

# 1차원 회귀직선 추정 후 그리기
fit1 = lm(y~x)
lines(x,fit1$fitted.values,col="green",lwd=1.5)

# 2차원 회귀직선 추정 후 그리기
x2 = x^2
fit2 = lm(y~(x+x2))
lines(x,fit2$fitted.values,col="red",lwd=1.5)

# 범례
legend("topleft",
       legend=c("data plot","linear trend","quadratic trend"),
       col=c("gray","green","red"),
       lty=c(NA,1,1),
       pch=c(19,NA,NA),bty="n")

# 실제 데이터 적용사례1(cars)
plot(cars) # 기본적으로 R에 저장되어 있는 데이터
fit = lm(dist~speed, data = cars)
abline(fit) # a, b의 추정값이 들어있으므로 가능하다.

# 실제 데이터 적용사례2(bone)
# install.packages("loon.data") # 패키지 다운로드
library(loon.data) # loon data 불러오기
data(bone) # bone 데이터 불러오기
ages <- bone$age 
rsp <- bone$rspnbmd
plot(ages,rsp,col="gray",bty="n")

# 1차 회귀직선 그리기
x <- ages ; y <- rsp
fit1 = lm(y~x)
lines(x,fit1$fitted.values,col=10)

# 2차 회귀직선 그리기
x2 = x^2
fit2 = lm(y~(x+x2))
lines(sort(x),fit2$fitted.values[order(x)],col=11)

# 3차 회귀직선 그리기
x3 = x^3
fit3 = lm(y~(x+x2+x3))
lines(sort(x),fit3$fitted.values[order(x)],col=12)

# 4차 회귀직선 그리기
x4 = x^4
fit4 = lm(y~(x+x2+x3+x4))
lines(sort(x),fit4$fitted.values[order(x)],col=13)



### 실습
# 정규분포의 알파 면적 그리기
n = 300
a = 0.05 # 알파값 입력
x <- seq(-3,3,length=n)
fx <- dnorm(x)
# 정규분포
plot(x,fx,type="l",lwd=2.0,ylab="f",xlab="x",bty="n")
# 수평선그리기
abline(h=0,col="red")
# 알파값에 대한 x값 찍기
points(qnorm(1-a),0,col="red",pch=19,cex=2)
# 알파값에 대한 x에 수직선 그리기 
points(qnorm(1-a),dnorm(qnorm(1-a)),type="h",col="blue",lwd=3.0)
# 알파값에 해당하는 면적 그리기
points(x[x>qnorm(1-a)],dnorm(x[x>qnorm(1-a)]),type="h", col="red")
# 범례
legend("topright",
       legend=c("N(0,1) pdf","critical line","rejection region","z(0.05)"),
       col=c("gray","blue","green","red"),
       lty=c(1,1,1,NA),
       lwd=c(2,2,2,NA),
       pch=c(NA,NA,NA,19))
# 제목
title("Standard normal distrbution critical value for significant level 0.05")

# 카이스퀘어분포 알파면적 그리기
# 변수 선언
n=300
df=5
a=0.05 # 알파값
x <- seq(0,20,length=n)
# 그래프 그리기
plot(x,dchisq(x,5),type="l",lwd=2,bty="n",xlab="x",ylab="f")
# 알파값에 해당하는 점x 찍기
points(qchisq(1-a,df),0,pch=16,cex=1.15,col="red")
# 점x에 해당하는 수직선 그리기
lines(c(qchisq(1-a,df),qchisq(1-a,df)),c(0,dchisq(qchisq(1-a,df),df)),lwd=2.0,col="blue")
# 알파 면적에 해당하는 면적 표시
points(x[x>qchisq(1-a,df)],dchisq(x[x>qchisq(1-a,df)],df),type="h",col="red")
# 수평선그리기
abline(h=0,col="red")
# 범례
legend("topright",
       legend=c("Chi(5) pdf","critical line","rejection region","chi(0.05,5)"),
       col=c("gray","blue","green","red"),
       lty=c(1,1,1,NA),
       lwd=c(2,2,2,NA),
       pch=c(NA,NA,NA,19))
# 제목
title("Chi-square distribution critical value for significant level 0.05")

# Norm, T분포 그리기
mu = 0
sigma = 1
x = seq(-3,3,length=300)
fx = dnorm(x,mu,sigma)
# 정규분포
plot(x,fx,type="l",bty="n",lwd=2.0)
# T분포
lines(x,dt(x, 1),col="blue",lty=2)
lines(x,dt(x, 5),col="lightblue",lty=2)
lines(x,dt(x, 20),col="red",lty=2)
# 수직선
abline(v=0 ,col="green",lty=3)
# 제목
title("standard normal and t distribution...")
# 범례
legend("topright",
       legend = c("N(0, 1) pdf","t(1)","t(5)","t(20)"),
       col = c("black", "blue", "lightblue", "red"),
       lty = c(1, 2, 2, 2),
       pch = c(NA, NA, NA, NA)) 

# 격자 그리기
n=100
x <- seq(1,19,length=n)
y <- seq(1,19,length=n)
plot(x,y,type="n")
# 격자그리기
for(i in 1:19 ){
  if( i==1 || i==19 )
    abline(h=i, v=i, lwd=3.0)
  else
    abline(h=i, v=i, lwd=1.0, col="gray")
}
# 점 그리기
for(i in 1:19 ){
  for(j in 1:19){
    if( i==4||i==10||i==16){
      if( j==4||j==10||j==16){
        points(i,j, pch=4, cex=1.5, col="blue")
      }
    }
  }
}

# 그래프의 접선 그리기
# 변수선언
n=300
x <- seq(-10,10,length=n)
fx<- x^3 - x^2 + x - 1
dx<- 3*x^2 - 2*x + 1
# 그래프그리기
plot(x,fx,type="l",lwd=2.0,bty="n")
for(i in 1:10){
  plot(x,fx,type="l",lwd=2.0,bty="n")
  abline(fx[i*25]-x[i*25]*dx[i*25],dx[i*25],lwd=2.0,col="red")
  Sys.sleep(0.5)
}

# n차 회귀직선 그리기
ages <- bone$age 
rsp <- bone$rspnbmd
x <- ages ; y <- rsp
fx = 0

par(mfrow=c(1,1))
for(i in 1:6){
  # n차 회귀분석 함수 생성
  new_x = x^i
  fx = cbind(fx,new_x)
  
  # 그래프 그리기
  plot(x,y,col="gray",bty="n")
  fit = lm(y~fx)
  lines(sort(x),fit$fitted.values[order(x)],col=i,lwd=2.0)
  title(i)
  title("                               차 추정 회귀직선")
  Sys.sleep(1)
}
