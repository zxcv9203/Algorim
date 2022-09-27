#############################################
#	  Algorim build manager version 0.1    #
############################################

############################################
#				Variables				   #
############################################
# Makefile Variables

# NAME 프로젝트 이름
NAME=Algorim

############################################
#				Text Color		           #
############################################
GREEN		=	\033[32m
BG_GREEN	=	\033[42m
WHITE		=	\033[37m
END			=	\033[0m

############################################
#				Rules		               #
############################################
## -----------------------------------------
##          📌 Makefile 명령 목록
## -----------------------------------------
##
##

## help	: Algorim Makefile 명령에 대해 출력해줍니다.
##
help:
			@sed -n '/@sed/!s/## //p' Makefile

## build	: Algorim을 실행할 수 있는 실행파일을 만듭니다.
##
build:
	@echo "$(WHITE) 🛠️ $(NAME) 실행파일 생성중...$(END)"
	@go build cmd/algorim/main.go
	@echo "$(BG_GREEN) ✔️$(END) $(GREEN) $(NAME) 실행파일 생성완료 $(END)"

## run	: Algorim 실행 파일을 만들지 않고 프로그램을 실행합니다.
run:
	@go run cmd/algorim/main.go

## start	: Algorim을 실행 파일을 만든 후(빌드 진행) 프로그램을 실행합니다.
start: build
		./main

## clean	: Algorim 실행 파일을 제거합니다.
clean:
	@echo "$(WHITE)🧹 $(NAME) 실행파일 삭제중... $(END)"
	@rm -rf main
	@echo "$(BG_GREEN) ✔️ $(END)️ $(NAME) 실행파일 삭제완료 $(END)"

## test	: Algorim에 대한 테스트를 실행합니다.
test:
	@echo "$(WHITE)🧪 $(NAME) 테스트 시작... $(END)"
	@go test ./...

## re	: Algorim 실행 파일을 삭제한 후 재 빌드 후 실행시킵니다.
re: clean start

.PHONY: help build run start test clean re
