rm(list=ls())

### 사용자 지정 변수
r = 250 # 총 횟수
n = 15 # 실행할 이항분포의 횟수
p = 0.8 # 성공 확률
time_sl = 0.05 # 각 시행마다의 딜레이
under_side = r / n * 2 # 누적 그래프의 y_size



### 사용자 지정 함수
# 입력값(0, 1)에 따른 상대적 다음 위치 반환 함수
ru_n <- function(num, p){
  if(p == 0){
    num = num-(1/2)
  }
  if(p==1){
    num = num+(1/2)
  }
  return(num)
}


### 총 데이터 구하기
# 변수 선언
x = NULL
data = NULL # 각각 성공의 유무 데이터
sum = NULL # 총 성공 횟수 데이터
t_data = NULL # 총 데이터
sum_list = NULL # 합계 데이터


# 각각 성공의 유무 데이터 구하기
for(i in 1:r){
  
  # 데이터 생성
  x<-rbinom(n,1,p)
  # 데이터 합계 계산
  n_tot <- 0
  for(j in 1:n){
    n_tot <- n_tot + x[j]
  }
  x[n+1] = n_tot
  # 총 데이터 저장
  t_data <- rbind(t_data, x)
  
}

# 누적 합계 리스트를 n개의 길이로 선언 후 0으로 초기화
for(i in 0:n+1){
  sum_list[i] = 0 # 리스트의 각 요소를 0으로 초기화
}



### 그래프 그리기
for(i in 1:r){
  
  # 합계 데이터에 누적합계 구하기
  for(t in 0:n+1){
    if(t == t_data[i,n+1]+1){
      sum_list[t] = sum_list[t]+1 # 해당 요소에 +1씩 해주기 
    }
  }
  # 결과값의 최대값 정정(그래프 크기 설정때문에)
  if(max(sum_list) > under_side){
    max_n=max(sum_list)
  }
  if(max(sum_list) < under_side+1){
    max_n = under_side
  }
  
  
  
  ### 경로 그래프 그리기
  # 배경(큰 틀) 그리기 
  # x11()
  plot(0, 0, type="n", xlim=c(0,n), ylim=c(0,n+max_n+1), xlab="", ylab="",
       axes = F, main="Binomial Distribution Bean Machine")
  text(0.8, n+max_n+0.5, paste("  P = ",p,"\n","N = ",n))
  legend("topright",legend=c(i),bty="n")
  # x축 작성
  axis(1, 0:n)
  # 좌표 찍히는 부분 테두리 그리기(삼각형)
  lines(x=c(0,n/2), y=c(max_n+1,n+max_n+1), lty=2)
  lines(x=c(n/2,n), y=c(n+max_n+1,max_n+1), lty=2)
  abline(h=max_n+1, col="gray", lwd=2 )
  # 빈 좌표 그리기
  for(p in 0:n){
    for(q in 0:p){
      points((n/2)-(1/2)*p+q,n+max_n+1-p, cex=1.5)
    }
  }
  # 이어지는 좌표 그리기
  base_x = n/2 # 기준점에 최고점의 x좌표로 초기화
  for(j in 1:n){
    # 기준점 찍고
    points(base_x, n+max_n+2-j, pch=19 ,cex=1.5, col="green") 
    # t_data에서 나온 결과 기준으로 상대적 위치 만들기
    new_base_x = ru_n(base_x, t_data[i,j])
    # 상대적 위치 찍기
    points(new_base_x, n+max_n+1-j, pch=19 ,cex=1.5, col="green")
    # 기준점이랑 상대적 위치 이은 선 그리기
    lines(c(base_x,new_base_x), c(n+max_n+2-j,n+max_n+1-j), lty=1, lwd=2.0, col="green")
    # 기준점 재설정
    base_x = new_base_x
  }
  
  # 누적 합계 그래프 그리기
  for(t in 0:n+1){
    points(c(t-1,t-1), c(0,sum_list[t]), type="l", lwd=5, col="green")
  }
  
  
  
  Sys.sleep(time_sl)
}
print(sum_list)
