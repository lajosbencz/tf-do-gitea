resource "random_id" "secret_key" {
  byte_length = 32
}

resource "random_id" "lfs_jwt_secret" {
  byte_length = 32
}

resource "random_id" "internal_token" {
  byte_length = 32
}

resource "random_id" "jwt_secret" {
  byte_length = 32
}
