rm(list=ls())

### 시용자 지정 변수 설정
n_grid = 10 # 배경그래프 격자 수
start_num = 10 # 시작 좌표의 개수
tic = 10 # 반복하는 횟수
time_s = 0.01 # 각 점들이 찍힐 때 딜레이



### 사용자 지정 함수
# 사각 격자 좌표 반환
make_4grid <- function(x,y){
  x_list = c(x,x+1,x+1,x)
  y_list = c(y,y,y+1,y+1)
  list = rbind(x_list,y_list)
  return(list)
}

# 기준 리스트와 맥스 인덱스를 넘기면 그 중 하나를 기준으로 사각좌표를 반환
chos_grid <- function(list, index){
  
  rand_index <- sample(1:index,1) # 기본 좌표 중에 하나 선택
  
  # x=0 인 경우
  if(list[1, rand_index] == 0){
    
    # x=0, y=0 인 경우
    if(list[2, rand_index] == 0){
      dist_4 <- sample(1:2,1)
      # (x=0, y=1)
      if(dist_4 == 1){
        x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
        y <- c(list[2,rand_index]+1, list[2,rand_index]+2, list[2,rand_index]+2, list[2,rand_index]+1)
        ind_grid = rbind(x,y)
      }
      # (x=1, y=0)
      if(dist_4 == 2){
        x <- c(list[1,rand_index]+1, list[1,rand_index]+1, list[1,rand_index]+2, list[1,rand_index]+2)
        y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
        ind_grid = rbind(x,y)
      }
      return(ind_grid)
    }
    
    # x=0, y=max 인 경우
    if(list[2, rand_index] == n_grid-1){
      dist_4 <- sample(1:2,1)
      # (x=0, y=-1)
      if(dist_4 == 1){
        x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
        y <- c(list[2,rand_index]-1, list[2,rand_index], list[2,rand_index], list[2,rand_index]-1)
        ind_grid = rbind(x,y)
      }
      # (x=1, y=0)
      if(dist_4 == 2){
        x <- c(list[1,rand_index]+1, list[1,rand_index]+1, list[1,rand_index]+2, list[1,rand_index]+2)
        y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
        ind_grid = rbind(x,y)
      }
      return(ind_grid)
    }
    
    # x=0 이지만 y가 끝값이 아닌 경우
    dist_4 <- sample(1:3,1)
    # (x=0, y=1)
    if(dist_4 == 1){
      x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
      y <- c(list[2,rand_index]+1, list[2,rand_index]+2, list[2,rand_index]+2, list[2,rand_index]+1)
      ind_grid = rbind(x,y)
    }
    # (x=0, y=-1)
    if(dist_4 == 2){
      x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
      y <- c(list[2,rand_index]-1, list[2,rand_index], list[2,rand_index], list[2,rand_index]-1)
      ind_grid = rbind(x,y)
    }
    # (x=1, y=0)
    if(dist_4 == 3){
      x <- c(list[1,rand_index]+1, list[1,rand_index]+1, list[1,rand_index]+2, list[1,rand_index]+2)
      y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
      ind_grid = rbind(x,y)
    }
    return(ind_grid)
  }
  
  # x=max 인 경우
  if(list[1, rand_index] == n_grid-1){
    
    # x=max, y=0 인 경우
    if(list[2, rand_index] == 0){
      dist_4 <- sample(1:2,1)
      # (x=-1, y=0)
      if(dist_4 == 1){
        x <- c(list[1,rand_index]-1, list[1,rand_index]-1, list[1,rand_index], list[1,rand_index])
        y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
        ind_grid = rbind(x,y)
      }
      # (x=0, y=1)
      if(dist_4 == 2){
        x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
        y <- c(list[2,rand_index]+1, list[2,rand_index]+2, list[2,rand_index]+2, list[2,rand_index]+1)
        ind_grid = rbind(x,y)
      }
      return(ind_grid)
    }
    
    # x=max, y=max 인 경우
    if(list[2, rand_index] == n_grid-1){
      dist_4 <- sample(1:2,1)
      # (x=-1, y=0)
      if(dist_4 == 1){
        x <- c(list[1,rand_index]-1, list[1,rand_index]-1, list[1,rand_index], list[1,rand_index])
        y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
        ind_grid = rbind(x,y)
      }
      # (x=0, y=-1)
      if(dist_4 == 2){
        x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
        y <- c(list[2,rand_index]-1, list[2,rand_index], list[2,rand_index], list[2,rand_index]-1)
        ind_grid = rbind(x,y)
      }
      return(ind_grid)
    }
    
    # x=0 이지만 y가 끝값이 아닌 경우
    dist_4 <- sample(1:3,1)
    # (x=-1, y=0)
    if(dist_4 == 1){
      x <- c(list[1,rand_index]-1, list[1,rand_index]-1, list[1,rand_index], list[1,rand_index])
      y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
      ind_grid = rbind(x,y)
    }
    # (x=0, y=1)
    if(dist_4 == 2){
      x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
      y <- c(list[2,rand_index]+1, list[2,rand_index]+2, list[2,rand_index]+2, list[2,rand_index]+1)
      ind_grid = rbind(x,y)
    }
    # (x=0, y=-1)
    if(dist_4 == 3){
      x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
      y <- c(list[2,rand_index]-1, list[2,rand_index], list[2,rand_index], list[2,rand_index]-1)
      ind_grid = rbind(x,y)
    }
    return(ind_grid)
  }
  
  # y=max 이지만 x가 끝값이 아닌 경우
  if(list[2, rand_index] == n_grid-1){
    dist_4 <- sample(1:3,1) 
    # (x=-1, y=0)
    if(dist_4 == 1){
      x <- c(list[1,rand_index]-1, list[1,rand_index]-1, list[1,rand_index], list[1,rand_index])
      y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
      ind_grid = rbind(x,y)
    }
    # (x=0, y=-1)
    if(dist_4 == 2){
      x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
      y <- c(list[2,rand_index]-1, list[2,rand_index], list[2,rand_index], list[2,rand_index]-1)
      ind_grid = rbind(x,y)
    }
    # (x=1, y=0)
    if(dist_4 == 3){
      x <- c(list[1,rand_index]+1, list[1,rand_index]+1, list[1,rand_index]+2, list[1,rand_index]+2)
      y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
      ind_grid = rbind(x,y)
    }
    return(ind_grid)
  }
  
  # y=0이지만 x가 끝값이 아닌 경우
  if(list[2, rand_index] == 0){
    dist_4 <- sample(1:3,1) 
    # (x=-1, y=0)
    if(dist_4 == 1){
      x <- c(list[1,rand_index]-1, list[1,rand_index]-1, list[1,rand_index], list[1,rand_index])
      y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
      ind_grid = rbind(x,y)
    }
    # (x=0, y=1)
    if(dist_4 == 2){
      x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
      y <- c(list[2,rand_index]+1, list[2,rand_index]+2, list[2,rand_index]+2, list[2,rand_index]+1)
      ind_grid = rbind(x,y)
    }
    # (x=1, y=0)
    if(dist_4 == 3){
      x <- c(list[1,rand_index]+1, list[1,rand_index]+1, list[1,rand_index]+2, list[1,rand_index]+2)
      y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
      ind_grid = rbind(x,y)
    }
    return(ind_grid)
  }
  
  # x, y 둘중 어느것도 끝값이 아닌 경우
  dist_4 <- sample(1:4,1) # 상하좌우 중 하나 선택
  # (x=-1, y=0)
  if(dist_4 == 1){
    x <- c(list[1,rand_index]-1, list[1,rand_index]-1, list[1,rand_index], list[1,rand_index])
    y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
    ind_grid = rbind(x,y)
  }
  # (x=0, y=1)
  if(dist_4 == 2){
    x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
    y <- c(list[2,rand_index]+1, list[2,rand_index]+2, list[2,rand_index]+2, list[2,rand_index]+1)
    ind_grid = rbind(x,y)
  }
  # (x=0, y=-1)
  if(dist_4 == 3){
    x <- c(list[1,rand_index], list[1,rand_index], list[1,rand_index]+1, list[1,rand_index]+1)
    y <- c(list[2,rand_index]-1, list[2,rand_index], list[2,rand_index], list[2,rand_index]-1)
    ind_grid = rbind(x,y)
  }
  # (x=1, y=0)
  if(dist_4 == 4){
    x <- c(list[1,rand_index]+1, list[1,rand_index]+1, list[1,rand_index]+2, list[1,rand_index]+2)
    y <- c(list[2,rand_index], list[2,rand_index]+1, list[2,rand_index]+1, list[2,rand_index])
    ind_grid = rbind(x,y)
  }
  return(ind_grid)
}



### 기본 그래프 그리기
x11()
plot(1, 1, xlim=c(0,n_grid), ylim=c(0,n_grid), 
     type="n", bty="n", xaxt="n", yaxt="n", xlab="", ylab="")
for(i in 0:n_grid){
  abline(h=i, v=i, lwd=1, col="gray")  
}



### 랜덤 좌표 설정
plot_x_list <- sample(1:n_grid-1,start_num,replace = TRUE)
plot_y_list <- sample(1:n_grid-1,start_num,replace = TRUE)
plot_xy_list <- rbind(plot_x_list, plot_y_list)
plot_xy_list



### 각 좌표마다 그림 그리기
# 각 좌표 표시 및 색칠하기

for(i in 1:start_num){
  plot_list <- make_4grid(plot_x_list[i],plot_y_list[i])
  points(plot_x_list[i]+0.5, plot_y_list[i]+0.5, pch=8, cex=1.5, col="blue")
  polygon(plot_list[1,],plot_list[2,]
          , col=adjustcolor("blue",alpha=0.20), border=NA)
}
# 총 반복 횟수
total_num = start_num*2^(tic-1)

# 매인 격자 그리기
for(i in start_num:total_num){
  
  # 기존 주요 좌표에서 새로운 랜덤 좌표 생성
  test_list <- chos_grid(plot_xy_list,i)
  
  # 새로운 좌표를 기준으로 격자 그리기
  polygon(test_list[1,],test_list[2,], col=adjustcolor("blue",alpha=0.20), border=NA)
  
  # 기존 주요 좌표에 새로운 좌표를 저장
  plot_xy_list <- cbind(plot_xy_list,test_list[,1])
  
  for(j in 1:tic){
    if(i == start_num*2^(j-1)){
      cat(i,"count /",j,"tic \n")
    }
  }
  Sys.sleep(time_s)
}


