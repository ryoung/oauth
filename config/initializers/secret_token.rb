# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Oauth::Application.config.secret_key_base = 'a9fde113727c0b0e1f39dd2ab171166c41d510e882e9d96623ad8c81813d6643180028c558a20ff4a995593037d355391e0eb88f1460a062a4f01dbecb705b9e'
