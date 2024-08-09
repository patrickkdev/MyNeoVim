package main

func main() {
	fmt.Print("abc")

	for true {
		fmt.Println("abc")
	}
}

func handler(c *fiber.Ctx) {
}
