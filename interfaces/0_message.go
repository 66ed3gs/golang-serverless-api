package interfaces

// GetEchoMessageRequest : echo your message
type GetEchoMessageRequest struct {
	Message string `param:"message"`
}

// GetEchoMessageResponse : echo your message
type GetEchoMessageResponse struct {
	Status  int
	Message string
}
