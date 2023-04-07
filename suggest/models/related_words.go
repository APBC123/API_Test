package models

type KeyWords struct {
	Word string
}

func (table KeyWords) TableName() string {
	return "keywords"
}
