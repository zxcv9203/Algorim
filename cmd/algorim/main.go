package main

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/hajimehoshi/go-mp3"
	"github.com/hajimehoshi/oto/v2"
)

func main() {
	fmt.Println("Algorim이 실행중입니다.")
	timer := time.NewTimer(time.Hour * 1)
	<-timer.C
	fmt.Println("Algorim이 종료되었습니다.")
	f, err := os.Open("./assets/end.mp3")
	if err != nil {
		log.Fatalln(err)
	}

	d, err := mp3.NewDecoder(f)
	if err != nil {
		log.Fatalln(err)
	}

	c, ready, err := oto.NewContext(d.SampleRate(), 2, 2)
	if err != nil {
		log.Fatalln(err)
	}
	<-ready

	p := c.NewPlayer(d)
	defer func(p oto.Player) {
		err := p.Close()
		if err != nil {
			log.Fatalln(err)
		}
	}(p)
	p.Play()

	for {
		time.Sleep(time.Second)
		if !p.IsPlaying() {
			break
		}
	}
}

