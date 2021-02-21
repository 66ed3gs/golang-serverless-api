# golang-serverless-api
Start coding in a minute.

- Cloud Run
- [api_gen](https://github.com/go-generalize/api_gen)

# Tutorial

### 1. Clone template

```bash
$ gh repo clone 66ed3gs/golang-serverless-api
```

### 2. Download the latest version of api_gen

```bash
$ make bootstrap
```

### 3. Generate routers from struct

```bash
$ make server_generate
```

### 4. Modify the controller

```go:get_echo_message_controller_gen.go

func (g *GetEchoMessageController) GetEchoMessage(
	c echo.Context, req *GetEchoMessageRequest,
) (res *GetEchoMessageResponse, err error) {
	res = &GetEchoMessageResponse{
		Status:  http.StatusOK,
		Message: req.Message,
	}

	return res, nil
}
```

### 5. Run

```bash
$ PORT=8888 go run cmd/main.go
$ curl -i 'http://localhost:8888/HelloWorld'
$ curl -i 'http://localhost:8888/Test'
```

### 6. Use Docker (optional)

```bash
$ docker build -t sample-image .
```

```bash
$ docker run -p 8080:8080 -e PORT=8080 --rm sample-image
```