# 주어진 구간(영역)에서 randow으로 생성되는 데이터 만들기

# 1차원
# 구간 a~b에서 data n개 생성

# data <- runif(n,a,b)

# 2차원
# x=[a,b], y=[c,d]에서의 data n개 생성

# x <- runif(n,a,b)
# y <- runif(n,c,d)
# data <- cbind(x,y)

n=300
x <- runif(n,-1,1)
y <- runif(n,-1,1)
data <- cbind(x,y)

x11()
plot(x,y,xlim=c(-2,2),ylim=c(-2,2))
abline(v=-1,h=-1)
abline(v=1,h=1)


# 원

# 데이터 그리기
data_n=1000
x <- runif(data_n,-1,1)
y <- runif(data_n,-sqrt(1-x^2),sqrt(1-x^2))
# for(i in 1:n){
#   y[i] = runif(n,-sqrt(1-x^2),sqrt(1-x^2))
# }
data = cbind(x,y)
par(pty="s") # 그래프 비율 고정
plot(data,col=rainbow(100, alpha=0.4)) # 무지개 색을 표현, alpha는 -1,1사이의 숫자로 투명도를 표현


# 직접 원그리기
n=300
l_x <- seq(-1,1,length=n)
l_y1 <- sqrt(1-l_x^2)
l_y2 <- -sqrt(1-l_x^2)

lines(l_x,l_y1,lwd=2)
lines(l_x,l_y2,lwd=2)
abline(h=c(-1,1),v=c(-1,1),lty=2)


# 실습
# 중심이 (a,b)이고 반지름이 r인 원 내부에서 n개의 data를 생성하는 함수 만들기
# unif_on_circle(n,a,b,r)
rm(list=ls())

unif_on_circle = function(n,a,b,r){
  
  # 범위내 데이터 생성
  x <- runif(n,a-r,a+r)
  y <- runif(n,b-sqrt(r^2-(x-a)^2),b+sqrt(r^2-(x-a)^2))
  data = cbind(x,y)
  # data
  par(pty="s")
  plot(data,col=rainbow(100, alpha=0.5))
  
  # 원 그래프 그리기
  n=300
  l_x <- seq(a-r,a+r,length=n)
  l_y1 <- b-sqrt(r^2-(l_x-a)^2)
  l_y2 <- b+sqrt(r^2-(l_x-a)^2)
  
  lines(l_x,l_y1,lwd=2)
  lines(l_x,l_y2,lwd=2)
  abline(h=c(a-r,a+r),v=c(a-r,a+r),lty=2)
  
  # return(data)
}

unif_on_circle(1000,2,2,5)


# 원하는 범위내에서도 도전해보기

rm(list=ls())

# 중심이 (a,b)이고 반지름이 r이하인 균등한 변수 생성
Unif_on_Circle_fr = function(a,b,r,n){
  x = runif(n,a-r,a+r)
  y = NULL
  for(i in 1:n){
    y[i] = runif(1,b-sqrt(r^2-(x[i]-a)^2),b+sqrt(r^2-(x[i]-a)^2))
  }
  data = cbind(x,y)
  return(data)
}

Fireworks = function(num_fire, num_points, sleep){
  
  # 기준이 되는 중심및 반지름 선정하기
  x <- runif(num_fire,-3,3)
  y <- runif(num_fire,-3,3)
  r <- runif(num_fire, 0.5, 0.8)
  fire_list = cbind(x,y)
  fire_list = cbind(fire_list,r)
  
  # 폭죽들의 데이터 저장
  new_plot = NULL
  for(i in 1:num_fire){
    new_plot[[i]] = Unif_on_Circle_fr(x[i],y[i],r[i],num_points)
  }
  
  # 배경 그리기
  par(pty="s",bg="black") # 정사각형으로 비율 고정, 뒷배경을 검정색으로 고정
  plot(1,1,xlim=c(-3.5,3.5),ylim=c(-3.5,3.5),type="n",bty="n",axes=F) # axes=F : 축을 없에는 방법
  rd_col = sample(rainbow(num_points,alpha=0.3))
  
  # 폭죽 그리기
  for(i in 1:num_fire){
    for(j in 1:num_points){
      
      # 선 그리기
      lines(c(fire_list[i,1],new_plot[[i]][j,1]),c(fire_list[i,2],new_plot[[i]][j,2]),col=rd_col[j])
    }
    if(i>2){
      
      # 2개 간격으로 점 그리기
      points(new_plot[[i-2]],col=rd_col,cex=0.5)
    }
    Sys.sleep(sleep)
  }
  
  # 나머지 점 그리기(끝에서부터 2개)
  for(i in c(num_fire-1,num_fire)){
    points(new_plot[[i]],col=rd_col,cex=0.5)
    Sys.sleep(sleep)
  }
  
  # 리셋후 폭죽들의 점만 점점 커지게 출력
  plot(1,1,xlim=c(-2.8,2.8),ylim=c(-2.8,2.8),type="n",bty="n",axes=F)
  for(i in 1:num_fire){
    for(j in c(0.5,1,1.5)){
      points(new_plot[[i]],col=rd_col,cex=j)
      Sys.sleep = sleep
    }
  }
  
  # 결과값 저장
  results = list()
  results$center_point = fire_list
  results$fire_point = new_plot
  results$fire_col = rd_col
  return(results)
}

#----------------------------------------------#
# 새로운 스크립트에서 출력을 한다면.
# 함수 파일과 실행 파일을 같은 폴더에 놓고 
# 실행폴더에서 session - set working directory - to source file location 지정 할 것
# source("함수파일이름.R") 실행 후 코드작업

# dev.new() # 새로운 출력창 만들기
set.seed(10)
FireData = Fireworks(5,50,1)


FireData$center_point

Sys.sleep = 5
# dev.off() # 출력창 닫기