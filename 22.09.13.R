# 초기화
# rm 함수
?rm # rm함수 도움말
rm(list = ls()) # 환경창 리셋

# 벡터
# c 함수
?c # c함수 도움말

# a : numeric value(실수형태)
a = c(1,2,3,4,5)
# b : integar value(정수형태)
b = 1:5

# rep 함수 : 같은 수를 반복하는 수열
?rep

rep(1,5)

# 길이가 같은 벡터 연산
a+b
a-b
a*b
a/b

# 길이가 다른 벡터 연산(한쪽이 길이를 다하면 다시 처음으로 돌아온다.)
c = c(1:6)
d = 3:5

c+d
d+c
c-d
d-c
# 순서 변경
c*d
d*c
c/d
d/c

# : 함수 : 등차가 1인 수열을 생성해준다.
su = 3:5
umm = -0.4:7.7

# seq 함수 : 일반적인 공차를 가지는 수열을 생성
?seq

seq(1, 2, by=0.1)
seq(1, 2, by=1.1)
seq(3, 5, length.out=10) # 10등분
# set(1, 10, by=1, length.out=100) # 이론적 오류로 에러가 난다.

# 행렬
# matrix 함수
?matrix

hl_data = c(1:9)
matrix(hl_data, nrow=3, ncol=3)
matrix(hl_data, nrow=3, ncol=3, byrow=F)
hangyeol1 = matrix(hl_data, nrow=3, ncol=3, byrow=T) # byrow : row를 기준으로 데이터를 채우겠다. 

hangyeol1
hangyeol1[2,3]

# 행렬 계산
A = matrix(1:4,2,2)
B = matrix(5:8,2,2)
A
B

# 각 요소의 계산
A + B
A * B 
A - B
A / B
# 행렬곱
A %*% B

# 대각행렬
# diag 함수 : 대각행렬을 만드는 함수
?diag

diag(1:5)

# 단위행렬
diag(rep(1,4))

# 대각 원소 출력
A
diag(A)

C = matrix(1:6,2,3)
C
diag(C) # 직사각형의 행렬에서도 될수 있는 요소가지 출력한다.

# 역행렬
# solve 함수 : 역행렬을 비롯한 방정식을 풀어주는 함수
A_inverse = solve(A)
A_inverse
