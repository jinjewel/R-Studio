## 정규확률 플롯
# 옥수수 실험 - 정규확률 플롯
darwin<-c(49,-67,8,16,6,23,28,41,14,29,56,24,75,60,-48)
sort(darwin)
n<-length(darwin); n
p<-((1:n)-0.5)/n ;p # 상대누적도수
z<-qnorm(p) ; z # 상대누적도수에 해당하는 x값 구하기
cbind(sort(darwin),p ,z)
par(mfrow=c(1,2))
plot(sort(darwin)~z,ylim=c(-75,75),xlim=c(-2,2),main="darwin")
qqnorm(darwin,ylim=c(-75,75),xlim=c(-2,2),main="Q-Q norm - darwin")

# 정규분포로부터의 정규확률 플롯
# 직선적인 경향선을 볼수 있다.
par(mfrow=c(1,2))
qqnorm(rnorm(40,100,15),main="1st norm-1")
qqnorm(rnorm(40,100,15),main="1st norm-2")

# 혼합정규분포로 부터의 정규확률 플롯
# 중앙의 밀도가 낮고 강한 곡선성을 볼수 있다.
par(mfrow=c(1,2))
qqnorm(c(rnorm(20,70,15),rnorm(20,130,15)),main="2st norm-1")
qqnorm(c(rnorm(20,70,15),rnorm(20,130,15)),main="2st norm-2")

# 특이점이 존재하는 자료에 대한 정규확률 플롯
# 양 끝점이 주경향선을 기준으로 아래, 위로 떨어져있다.
par(mfrow=c(1,2))
qqnorm(c(25,175,rnorm(38,100,15)),main="have a expoint-1")
qqnorm(c(25,175,rnorm(38,100,15)),main="have a expoint-2")

# 꼬리가 짧은 분포에서의 정규확률 플롯
# S자 모양의 성장곡선을 보인다.
par(mfrow=c(1,2))
qqnorm(runif(40,80,120),main="short tail-1")
qqnorm(runif(40,80,120),main="short tail-2")

# 꼬리가 긴 분포에서의 정규확률 플롯
# 전체적으로 비스듬한 역 s자 성장곡선을 그린다.
par(mfrow=c(1,2))
qqnorm(c(rexp(20,1),-rexp(20,1)),main="long tail-1")
qqnorm(c(rexp(20,1),-rexp(20,1)),main="long tail-2")

# 큰 값 쪽으로 긴 꼬리를 뻗은 분포에서의 정규확률 플롯
# 비스듬이 기울어진 J자 곡선의 형태임을 볼 수 있다.
par(mfrow=c(1,2))
qqnorm(exp(rnorm(40,5,1)),main="log norm-1")
qqnorm(exp(rnorm(40,5,1)),main="log norm-2")

# 작은 값 쪽으로 긴고리를 뻗은 분포의 정규확률 플롯
# 비스듬이 기울어진 역J자 곡선의 형태를 볼 수 있다.
par(mfrow=c(1,2))
qqnorm(1500-sort(exp(rnorm(40,5,1))),main="non log norm-1")
qqnorm(1500-sort(exp(rnorm(40,5,1))),main="non log norm-2")



## 지수분포와 와이블분포로부터의 확률 플롯
# 지수분포에 적용한 확률플롯(직접 변형)
leukemia <- c(1,1,2,2,3,4,4,5,5,8,8,8,8,11,11,12,12,15,17,22,23)
n<-length(leukemia)
p<-seq(1:n)/n-0.5/n # p(i) 계산
x<--log(1-p)
y<-leukemia
plot(y~x,main="made ~ Q-Q plot for Exp Dist")

# 지수분포에 적용한 확률플롯(함수 사용)
# qqmath(~데이터,distribution = function(p) q분포함수)
library(lattice)
qqmath(~leukemia,distribution = function(p) qexp(p,1),main="function ~ Q-Q plot for Exp Dist")
              


## 와이블 분포
# 와이블 분포는 지수분포를 포함하는 분포군으로서 수명시간에 대한 확률모형으로 매우 유용하다.
library(MASS) # fitdistr 사용하기 위해 선언
library(lattice) # qqmath 사용하기 위해 선언
fitdistr(leukemia,"weibull") # shape = 모수 a
qqmath(~leukemia,distribution = function(p) qweibull(p,1.5,1),main="function ~ Q-Q plot for qweibull(p,1.5,1)")



## 두 표본의 등화
# 충분한 자료가 있는 경우(매끄럽다)
# 등백분위수 등화
# x에 해당하는 점수들을 y에 해당하는 분위수로 변환시키는 과정, 사후에는 백분위수가 일치하게 된다. 
x<-rbeta(800,2,3)*100
y<-rbeta(1200,3,2)*100
round(quantile(x),1)
round(quantile(y),1)
par(mfrow=c(1,2))
qqplot(x, y, xlim=c(0,100),main="충분한 자료에서 등백분위수 변환그래프(plot)")
qqplot(x, y, xlim=c(0,100), type="l",main="충분한 자료에서 등백분위수 변환그래프(line)")

# 충분한 자료가 없는 경우(울퉁불퉁하다)
# 등사분위수 동화
# 표본의 크기가 작은 경우, 모든 백분위수를 일치시키는 대신 (0%, Q1, M, Q3, 100%)을 일치시킨다.
x1<-rbeta(80,2,3)*100
y1<-rbeta(100,3,2)*100
x1.quantile<-round(quantile(x1),1)
y1.quantile<-round(quantile(y1),1)
par(mfrow=c(1,2))
qqplot(x1, y1, xlim=c(0,100), type="l",main="충분하지 않은 자료에서 등백분위수 변환그래프(line)")
x1.quantile; y1.quantile
x1.quantile[1]<-0 ; x1.quantile[5]<-100 
y1.quantile[1]<-0 ; y1.quantile[5]<-100
plot(y1.quantile~x1.quantile,xlim=c(0,100),type="l",main="충분하지 않은 자료에서 등사분위수 변환그래프(line)")
