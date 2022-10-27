rm(list = ls())

# 함수의 해를 구하는 방법: Newton Raphson Method
# x(i+1) = x(i) + fx(i)/dx(i) 
# 2019015020 정보통계학과 오진석

# 변수 선언
n = 300 
x = seq(-4,6,length=n)
fx=x^3 - 2*x^2 + 3*x - 5 # 원 함수(그래프)
dx=3*x^2 - 4*x + 3 # 원 함수의 미분(그래프)
p= sample(x,1) # x의 초기값 설정

# 새로운 절편을 선언 및 초기화
new_x = p

for( i in 1:n){
  
  # 그래프 그리기
  plot(x, fx, lwd=3.0, type="l")
  abline(h=0, lwd=3)
  title(i)
  title("                    번째 실행")
  
  # 변수 초기화
  new_fx=new_x^3 - 2*new_x^2 + 3*new_x - 5 # 원 함수(점) 
  new_dx=3*new_x^2 - 4*new_x + 3 # 원 함수의 미분(점)
  slope = new_dx # 접선의 기울기
  interscapt = new_fx - new_dx*new_x # 접선의 절편

  # x절편 그리기
  points(new_x, 0, pch=19, col="blue")
  
  # x절편과 함수사이의 수직선 그리기
  lines(c(new_x,new_x), c(0, new_fx), col="blue", lwd=2.5)
  Sys.sleep(0.3)
  
  # 점 찍기
  points(new_x,new_fx,pch=19)
  Sys.sleep(0.3)
  
  # 접선 그리기
  abline(a=interscapt, b=slope, lwd=2.5, col="red")
  Sys.sleep(0.3)
  
  # 새로운 절편저장 및 그리기
  plot(x, fx, lwd=1.5, type="l")
  abline(h=0)
  new_x = new_x - new_fx / new_dx
  points(new_x, 0, pch=19, col="blue")
  
  if( (new_fx)^2 < 0.0001 ){
    break # y값과 0과의 오차가 0.01 이하일때 반복 중지
  }
}

new_x