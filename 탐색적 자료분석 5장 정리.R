# 5장 자료의 재표현
# 자료의 재표현 : 분포의 대칭화, 산포의 균일화, 변수간의 관계를 단순하게 하기 위하여 사용

### 분포의 대칭화

## 로그변환
data <- c(880, 1511, 1944, 2350, 2738, 3135, 3609, 4170, 5068, 7695)
par(mfrow=c(1,2))
plot(data, main="original")
plot(log(data),main="log exchange")

## 대칭변환
x <- rnorm(1000,0,1)
par(mfrow=c(1,2))
hist(x,main="original")
plot(quantile(x, prob=(1:9)/10), main="대칭 exchange")

## 선형변환
x <- rnorm(1000,0,1)
par(mfrow=c(1,2))
hist(x,main="original")
hist(x*2 + 100,main="line exchange")

## 비선형변환 (ex : log, exp ...)
x <- rnorm(1000,0,1)
par(mfrow=c(2,2))
hist(x,main="original")
hist(log(x),main="nonline exchange, log")
hist(x^2,main="nonline exchange, th")
hist(sqrt(x),main="nonline exchange, sqrt")

## 멱승변환(거듭곱)     
par(mfrow=c(2,2))
x<-seq(0, 5, 0.1)
# 첫번째 변환(멱승)
y1<-x
y2<-2*sqrt(x+1)-2
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5), lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5), ylim=c(-1,5))
# 두번째 변환(멱승)
y1<-y2
y2<-4*(x+1)^0.25-4
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))
# 세번째 변환(멱승)
y1<-y2
y2<-8*(x+1)^0.125-8
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))
# 네번째 변환(로그)
y1<-y2
y2<-log(x+1)
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))
# 멱승 역변환
# 첫번째 변환
DIY<-function(p){1+x/p}^p-1
par(mfrow=c(2,2))
x<-seq(0,5,0.1)
y1<-x
y2<-DIY(2)
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))
# 두번째 변환
y1<-y2
y2<-DIY(4)
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))
# 세번째 변환
y1<-y2
y2<-DIY(8)
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))
# 네번째 변환
y1<-y2
y2<-exp(x)-1
plot(y1~x,type="l",xlim=c(-1,5),ylim=c(-1,5),lty="dotted")
par(new=T)
plot(y2~x,type="l",xlim=c(-1,5),ylim=c(-1,5))



### 산포의 동질화

x1<-rgamma(100,4); g1<-rep("A",100)
x2<-rgamma(100,5); g2<-rep("B",100)
x3<-rgamma(100,9); g3<-rep("C",100)
claims<-c(x1,x2,x3)
group<-factor(c(g1,g2,g3))
par(mfrow=c(1,1))
boxplot(claims~group)
par(mfrow=c(1,2))
boxplot(sqrt(claims)~group)
boxplot(log(claims)~group)



### 관계의 단순화

x<-rnorm(100,5,1.5)
par(mfrow=c(1,1))
y1<-0.1*x^2+0.2*rnorm(100,0,1)
plot(y1~x,xlim=c(0,10),ylim=c(0,10))
# 두변수간의관계(x^2)
par(mfrow=c(1,2))
plot(sqrt(y1)~x,xlim=c(0,10))
x1=x^2
plot(y1~x1)
# 두변수간의관계(x^(1/2))
par(mfrow=c(1,1))
y2<-10*sqrt(x/10)+0.2*rnorm(100,0,1)
plot(y2~x,xlim=c(0,10),ylim=c(0,10))
# 두변수간의관계(x^(1/2))
par(mfrow=c(1,2))
plot(y2^2~x,xlim=c(0,10))
x2=sqrt(x)
plot(y2~x2)



### 표준화 변환

# 로버트슨 표준화변환
# 한 묶음의 자료에선 표준화변환(Z)를 사용하면 편하다.
# 하지만 여러묶음의 자료들을 통합하여 결과를 내려고 하면 표준화변환(Z)은 적합하지않다.
# 그래서 안전하게 여러묶음의 자료를 통합하여 비교하기 위해 사용한다.
# 예시) 무작위로 나눈 90명과 10명의 각조 학생들의 점수 산출에서 결과의 분포가 다를경우

# 표준화변환
# Z

# 로버트슨 변환
# Z(i) = ( x(i) - med(x) ) / sigma(x) , i=1,2,...,n
# med(x) = 그 자료묶음에 중앙값, sigma(x) = IQR / 1.35

par(mfrow=c(2,2))
x<-rnorm(100,40,10) # 한 묶음의 자료
y<-c(rnorm(90,40,10),rnorm(10,80,5)) # 두 묶음의 자료를 합친 자료
# 표준화 변환
z.x<-(x-mean(x))/sd(x)
z.y<-(y-mean(y))/sd(y)
hist(z.x, breaks=seq(-6,6,0.5),freq=F,ylim=c(0,0.7),main="1group, Z")
hist(z.y, breaks=seq(-6,6,0.5),freq=F,ylim=c(0,0.7),main="2group, Z")
# 로버트슨 변환
zz.x<-(x-median(x))/(IQR(x)/1.35)
zz.y<-(y-median(y))/(IQR(y)/1.35)
hist(zz.x, breaks=seq(-6,6,0.5),freq=F,ylim=c(0,0.7),main="1group, robustness")
hist(zz.y, breaks=seq(-6,6,0.5),freq=F,ylim=c(0,0.7),main="2group, robustness")
