package server

type Message1 struct {
	Code int `json:"code"`
	Data interface{} `json:"data"`
	Message interface{} `json:"message"`
}
